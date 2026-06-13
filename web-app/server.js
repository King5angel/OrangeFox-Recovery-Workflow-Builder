const express = require('express');
const multer = require('multer');
const axios = require('axios');
const path = require('path');
const fs = require('fs');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Configurar multer para subidas
const storage = multer.memoryStorage();
const upload = multer({ 
  storage: storage,
  limits: { fileSize: 500 * 1024 * 1024 } // 500MB
});

// Middleware
app.use(express.static('public'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Variables globales
const GITHUB_TOKEN = process.env.GITHUB_TOKEN;
const GITHUB_REPO = process.env.GITHUB_REPO || 'King5angel/OrangeFox-Recovery-Workflow-Builder';
const GITHUB_OWNER = GITHUB_REPO.split('/')[0];
const GITHUB_REPO_NAME = GITHUB_REPO.split('/')[1];

// Ruta: Página principal
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Ruta: Upload de archivo
app.post('/api/upload', upload.single('recovery_file'), async (req, res) => {
  try {
    const { device_codename, android_version, image_type, screen_res_x, screen_res_y } = req.body;

    if (!req.file) {
      return res.status(400).json({ error: 'No file provided' });
    }

    if (!device_codename || !android_version || !image_type) {
      return res.status(400).json({ error: 'Missing required parameters' });
    }

    console.log(`\n📤 Upload recibido:`);
    console.log(`   Dispositivo: ${device_codename}`);
    console.log(`   Android: ${android_version}`);
    console.log(`   Tipo: ${image_type}`);
    console.log(`   Archivo: ${req.file.originalname}`);
    console.log(`   Tamaño: ${(req.file.size / 1024 / 1024).toFixed(2)} MB`);

    // Crear contenido Base64
    const fileBase64 = req.file.buffer.toString('base64');

    // Disparar workflow de GitHub
    const workflowResult = await triggerGitHubWorkflow(
      device_codename,
      android_version,
      image_type,
      screen_res_x,
      screen_res_y,
      fileBase64
    );

    res.json({
      success: true,
      message: 'Archivo procesando en GitHub Actions',
      workflow_run_id: workflowResult.run_id,
      check_url: `https://github.com/${GITHUB_REPO}/actions/runs/${workflowResult.run_id}`
    });

  } catch (error) {
    console.error('Error:', error.message);
    res.status(500).json({ 
      error: 'Error procesando archivo',
      details: error.message 
    });
  }
});

// Disparar workflow de GitHub
async function triggerGitHubWorkflow(device, android, imageType, resX, resY, fileBase64) {
  try {
    if (!GITHUB_TOKEN) {
      throw new Error('GITHUB_TOKEN no configurado');
    }

    console.log('\n🔄 Disparando workflow de GitHub...');

    const response = await axios.post(
      `https://api.github.com/repos/${GITHUB_REPO}/actions/workflows/ofrp-web-upload.yml/dispatches`,
      {
        ref: 'main',
        inputs: {
          DEVICE_CODENAME: device,
          ANDROID_VERSION: android,
          IMAGE_TYPE: imageType,
          SCREEN_RES_X: resX,
          SCREEN_RES_Y: resY,
          BASE64_FILE: fileBase64
        }
      },
      {
        headers: {
          'Authorization': `token ${GITHUB_TOKEN}`,
          'Accept': 'application/vnd.github.v3+raw',
          'Content-Type': 'application/json'
        }
      }
    );

    console.log('✓ Workflow disparado');

    // Obtener el ID de ejecución más reciente
    const runsResponse = await axios.get(
      `https://api.github.com/repos/${GITHUB_REPO}/actions/runs`,
      {
        headers: {
          'Authorization': `token ${GITHUB_TOKEN}`,
          'Accept': 'application/vnd.github.v3+json'
        }
      }
    );

    const latestRun = runsResponse.data.workflow_runs[0];
    
    return {
      run_id: latestRun.id,
      status: latestRun.status
    };

  } catch (error) {
    console.error('Error disparando workflow:', error.response?.data || error.message);
    throw error;
  }
}

// Iniciar servidor
app.listen(PORT, () => {
  console.log(`
╔════════════════════════════════════════╗
║    OFRP Web Builder - Servidor         ║
║    http://localhost:${PORT}                 ║
╚════════════════════════════════════════╝
  `);
});
