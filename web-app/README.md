# 🌐 OFRP Web Builder

Aplicación web para subir y procesar recovery.img directamente.

## 🎯 Características

- ✅ Interfaz web moderna y fácil de usar
- ✅ Soporta archivos de cualquier tamaño
- ✅ Procesa automáticamente en GitHub Actions
- ✅ Publica en Releases automáticamente
- ✅ Responsive (móvil + desktop)

## 🚀 Instalación Local

### 1. Instalar Node.js

Descarga desde: https://nodejs.org/

### 2. Instalar dependencias

```bash
cd web-app
npm install
```

### 3. Configurar variables de entorno

Copia `.env.example` a `.env`:

```bash
cp .env.example .env
```

Edita `.env` con tus valores:

```
GITHUB_TOKEN=tu_token_aqui
GITHUB_REPO=King5angel/OrangeFox-Recovery-Workflow-Builder
PORT=3000
```

### 4. Crear token de GitHub

```
1. Ve a: https://github.com/settings/tokens
2. Click en "Generate new token"
3. Selecciona permisos:
   - repo (acceso completo)
   - workflow
4. Genera y copia el token
5. Pégalo en .env
```

### 5. Iniciar servidor

```bash
npm start
```

Accede a: http://localhost:3000

## 📦 Deploy en Vercel (Gratis)

### 1. Pushear a GitHub

```bash
git add web-app/
git commit -m "Add web app"
git push origin main
```

### 2. Conectar Vercel

```
1. Ve a: https://vercel.com/import
2. Importa tu repositorio
3. Selecciona carpeta: web-app
4. Configura variables de entorno en Vercel:
   - GITHUB_TOKEN
   - GITHUB_REPO
5. Deploy
```

### 3. Acceder

```
https://tu-app.vercel.app
```

## 🛠️ Estructura

```
web-app/
├── server.js          # Servidor Express
├── package.json       # Dependencias
├── .env.example       # Variables de entorno
└── public/
    └── index.html     # Interfaz web
```

## 📝 Cómo Usar

1. Abre http://localhost:3000
2. Completa los parámetros:
   - Dispositivo
   - Versión Android
   - Tipo de imagen
   - Resolución
3. Selecciona tu recovery.img
4. Click en "Procesar Recovery"
5. Espera confirmación
6. Tu recovery estará en Releases

## 🔒 Seguridad

- El archivo se procesa en memoria
- No se guarda localmente
- Se envía directamente a GitHub
- Usa GITHUB_TOKEN seguro

## 📊 Workflow

```
1. Usuario sube archivo en web
2. Server recibe el archivo
3. Convierte a Base64
4. Dispara workflow en GitHub
5. Workflow decodifica
6. Publica en Releases
7. Usuario descarga desde Releases
```

## 🆘 Troubleshooting

### "GITHUB_TOKEN no configurado"

```
Verifica que .env existe y tiene GITHUB_TOKEN
```

### "Error: 403 Forbidden"

```
El token no tiene permisos suficientes
Crea uno nuevo con permisos: repo + workflow
```

### "Archivo muy grande"

```
Node permite hasta 500MB
Si es más grande, comprime primero
```

## 📱 Responsive

Funciona perfectamente en:
- Desktop
- Tablet
- Mobile

## 🎨 Personalización

Puedes editar `public/index.html` para cambiar:
- Colores
- Estilos
- Textos
- Campos del formulario

## 📄 Licencia

MIT

## 👨‍💻 Autor

King5angel

---

**¿Preguntas?** Crea un issue en GitHub.
