# 📤 OFRP Builder - Archivos Grandes (>25MB)

## 🎯 Problema

GitHub solo permite subir archivos < 25MB

## ✅ Solución

Usar **archivos comprimidos** (.tar.gz o .zip) en Google Drive

---

## 🚀 Pasos (5 minutos)

### Paso 1: Comprimir tu recovery.img

#### En Windows (PowerShell):

```powershell
# Comprimir a .zip
Compress-Archive -Path C:\Users\TuUsuario\Desktop\recovery.img -DestinationPath C:\Users\TuUsuario\Desktop\recovery.zip

# Resultado: recovery.zip (~20-30% más pequeño)
```

#### En Windows (7-Zip):

```
1. Click derecho en recovery.img
2. 7-Zip → Add to archive...
3. Archive format: zip
4. Click OK
```

#### En Mac/Linux:

```bash
# Comprimir
tar -czf recovery.tar.gz recovery.img

# O con zip
zip recovery.zip recovery.img
```

### Paso 2: Sube el Comprimido a Google Drive

```
1. Ve a https://drive.google.com
2. Click en "New" → "File upload"
3. Selecciona recovery.zip
4. Espera a que suba
5. Click derecho → "Share"
6. "Cambiar a Acceso abierto"
7. Copia el link
```

### Paso 3: Obtén URL Directa

**De este link:**
```
https://drive.google.com/file/d/1ABC2DEF3GHI4JKL5MNO6PQR7STU8VWX/view?usp=sharing
```

**Copia la URL directa:**
```
https://drive.google.com/uc?export=download&id=1ABC2DEF3GHI4JKL5MNO6PQR7STU8VWX
```

### Paso 4: Ve a GitHub Actions

```
Tu Repositorio → Actions → OFRP Builder - Large File Upload
```

### Paso 5: Run Workflow

```
Click en "Run workflow"
```

### Paso 6: Completa Parámetros

```
DEVICE_CODENAME: cap_sprout
ANDROID_VERSION: 12
IMAGE_TYPE: recovery
SCREEN_RES_X: 720
SCREEN_RES_Y: 1600
COMPRESSED_FILE_URL: (Pega la URL directa de Google Drive)
```

### Paso 7: RUN

El workflow automáticamente:
- ✅ Descarga el .zip
- ✅ Descomprime
- ✅ Extrae recovery.img
- ✅ Publica en Releases

---

## 📊 Comparativa de Tamaños

```
recovery.img (original): 100 MB
recovery.zip (comprimido): 70-80 MB
recovery.tar.gz (comprimido): 60-70 MB
```

---

## 🔗 Ejemplo Completo

### Mi archivo:
```
C:\Users\King5angel\Desktop\recovery.img (100 MB)
```

### Comprimir:
```powershell
Compress-Archive -Path "C:\Users\King5angel\Desktop\recovery.img" -DestinationPath "C:\Users\King5angel\Desktop\recovery.zip"

# Resultado: recovery.zip (70 MB)
```

### Subir a Google Drive:
```
https://drive.google.com/file/d/1ABC2DEF3.../view?usp=sharing
```

### URL Directa:
```
https://drive.google.com/uc?export=download&id=1ABC2DEF3...
```

### GitHub Actions:
```
COMPRESSED_FILE_URL: https://drive.google.com/uc?export=download&id=1ABC2DEF3...
```

### Resultado (2 minutos):
```
✓ Descargado
✓ Descomprimido
✓ Publicado en Releases
✓ Listo para descargar
```

---

## 🎯 Alternativas

### Opción 1: OneDrive

```
1. Sube a OneDrive
2. Compartir → Obtener enlace
3. Pega URL en workflow
```

### Opción 2: Mega

```
1. Sube a Mega.nz
2. Click derecho → Obtén enlace público
3. Pega en workflow
```

### Opción 3: Dropbox

```
1. Sube a Dropbox
2. Click derecho → Obtén enlace compartible
3. Modifica: dl=0 → dl=1
4. Pega en workflow
```

---

## ✨ Ventajas

✅ **Sin límite de tamaño** - Usa Google Drive
✅ **Archivo comprimido** - Más rápido de descargar
✅ **Automático** - El workflow descomprime
✅ **Simple** - Solo pegar URL
✅ **Gratuito** - Google Drive tiene 15GB gratis

---

## 🆘 Solución de Problemas

### "No puedo comprimir"

Windows tiene zip nativo:
```powershell
Compress-Archive -Path archivo.img -DestinationPath archivo.zip
```

### "La URL no funciona"

Verifica que:
1. El link esté público (Acceso abierto)
2. Termina con `.../id=XXXXX`
3. No tenga caracteres raros al copiar

### "El workflow falla"

Espera 10 segundos después de "Run"
Recarga la página
Intenta de nuevo

---

## 🚀 ¡Listo!

Ahora puedes subir archivos de **cualquier tamaño** comprimidos.

**¡Inténtalo!** 👈

