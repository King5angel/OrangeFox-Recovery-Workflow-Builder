# 📤 Git LFS - Subir Archivos Grandes Sin Límite

## ¿Qué es Git LFS?

Git LFS (Large File Storage) permite subir archivos **de cualquier tamaño** a GitHub sin compresión.

---

## 🚀 Configuración (Una sola vez)

### Paso 1: Instalar Git LFS

**Windows:**
1. Ve a: https://git-lfs.github.com/
2. Descarga el instalador
3. Ejecuta e instala
4. Reinicia tu PC

### Paso 2: Configurar Repositorio

En PowerShell:

```powershell
cd C:\Windows\System32\OrangeFox-Recovery-Workflow-Builder

# Inicializar Git LFS
git lfs install

# Decir a Git que maneje .img con LFS
git lfs track "*.img"

# Subir cambios
git add .gitattributes
git commit -m "Configure Git LFS"
git push origin main
```

---

## 📤 Usar Después (Cada Vez)

### Paso 1: Copia tu recovery.img

```bash
cp C:\Users\TuUsuario\Desktop\recovery.img ./recovery.img
```

### Paso 2: Sube con Git

```bash
git add recovery.img
git commit -m "Add recovery image"
git push origin main
```

**¡Eso es todo!** Git LFS automáticamente maneja archivos grandes.

---

## 🎯 Ejecutar Workflow

### Paso 1: Ve a GitHub Actions

```
Tu Repositorio → Actions → OFRP Builder - Local File
```

### Paso 2: Run Workflow

```
Click en "Run workflow"
```

### Paso 3: Parámetros

```
DEVICE_CODENAME: cap_sprout
ANDROID_VERSION: 12
IMAGE_TYPE: recovery
SCREEN_RES_X: 720
SCREEN_RES_Y: 1600
```

### Paso 4: RUN

El workflow:
- ✅ Encuentra recovery.img automáticamente
- ✅ Lo procesa
- ✅ Lo publica en Releases

---

## ✅ Ventajas

✅ **Sin límite de tamaño** - Soporta archivos > 1GB
✅ **Sin comprimir** - Archivo original intacto
✅ **Sin servicios externos** - Todo en GitHub
✅ **Automático** - Git LFS maneja todo
✅ **Rápido** - Subida eficiente
✅ **Seguro** - Todo en tu repositorio

---

## 🆘 Solución de Problemas

### "Git LFS no instala en Windows"

```
1. Abre PowerShell como Administrador
2. Descarga el instalador manual de git-lfs.github.com
3. Ejecuta como Administrador
```

### "Archivo muy grande para subir"

```
Si tu conexión es lenta:
- Conecta a WiFi más rápido
- Intenta en otro momento
- Git LFS reintentar automáticamente
```

### "El workflow no encuentra el archivo"

```
Verifica:
1. El archivo está en la raíz del repositorio
2. Se llama exactamente "recovery.img"
3. Ya hiciste git push
```

---

## 📊 Ejemplo Completo

### Mi archivo:
```
C:\Users\King5angel\Desktop\recovery.img (150 MB)
```

### Instalar Git LFS (una sola vez):
```powershell
cd C:\Windows\System32\OrangeFox-Recovery-Workflow-Builder
git lfs install
git lfs track "*.img"
git add .gitattributes
git commit -m "Configure Git LFS"
git push origin main
```

### Subir (cada vez):
```bash
cp C:\Users\King5angel\Desktop\recovery.img ./recovery.img
git add recovery.img
git commit -m "Add recovery"
git push origin main
```

### Ejecutar:
```
Actions → OFRP Builder - Local File
Run workflow → Parámetros → RUN
```

### Resultado (2 minutos):
```
✓ Encontrado
✓ Procesado
✓ Publicado en Releases
✓ Listo para descargar
```

---

## 🎉 ¡Listo!

Ahora puedes subir archivos **de cualquier tamaño** sin complicaciones.

**¡Inténtalo!** 👈

