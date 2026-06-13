# 📤 OFRP Upload Base64 - Guía Completa

## 🎯 ¿Cómo Funciona?

1. **Conviertes tu recovery.img a Base64** (texto)
2. **Pegas el texto en el workflow input**
3. **El workflow decodifica automáticamente**
4. **Se publica en Releases**

---

## 🚀 Pasos (3 minutos)

### Paso 1: Convierte tu recovery.img a Base64

#### En Windows PowerShell:

```powershell
# Navega a tu carpeta
cd C:\Users\TuUsuario\Desktop

# Convierte a Base64
$file = "recovery.img"
$base64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes($file))
$base64 | clip

# ✓ Copiado al portapapeles automáticamente
```

#### En Windows CMD:

```bash
# Descarga certutil (incluido en Windows)
certutil -encode recovery.img recovery.b64

# Abre el archivo recovery.b64
# Copia TODO el contenido (sin las líneas BEGIN y END)
```

#### En Mac/Linux:

```bash
base64 recovery.img | pbcopy  # Mac
base64 recovery.img | xclip -selection clipboard  # Linux
```

### Paso 2: Ve a GitHub Actions

```
Tu Repositorio → Actions → OFRP Builder - Upload Base64
```

### Paso 3: Run Workflow

```
Click en "Run workflow"
```

### Paso 4: Completa los Parámetros

```
DEVICE_CODENAME: cap_sprout
ANDROID_VERSION: 12
IMAGE_TYPE: recovery
SCREEN_RES_X: 720
SCREEN_RES_Y: 1600
BASE64_FILE: (Pega aquí el texto Base64 que copiaste)
```

### Paso 5: Run

El workflow automáticamente:
- ✅ Decodifica el Base64
- ✅ Recrea el recovery.img
- ✅ Crea configuración
- ✅ Publica en Releases

---

## 📋 Checklist

- ✅ Tienes recovery.img en tu escritorio
- ✅ Lo convertiste a Base64
- ✅ Copiaste el texto
- ✅ Fuiste a GitHub Actions
- ✅ Ejecutaste el workflow
- ✅ Esperaste 1-2 minutos
- ✅ Descargaste de Releases

---

## 🎯 Ejemplo Completo

### Mi archivo:
```
C:\Users\King5angel\Desktop\recovery.img (50 MB)
```

### Convertir en PowerShell:
```powershell
cd C:\Users\King5angel\Desktop
$file = "recovery.img"
$base64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes($file))
$base64 | clip
```

### Resultado:
```
(Se copia ~67 MB de texto Base64 al portapapeles)
```

### En GitHub:
```
Parámetro BASE64_FILE: (Pego el texto)
Run workflow
```

### En Releases:
```
✓ recovery.img (50 MB) - Listo para descargar
✓ config.txt - Información
```

---

## ⚠️ Consideraciones

### Ventajas
✅ Sin necesidad de git
✅ Desde cualquier computadora
✅ Sin necesidad de subir a la nube
✅ Completamente local en GitHub

### Limitaciones
⚠️ Base64 es ~33% más grande (50MB → 67MB de texto)
⚠️ Toma más tiempo copiar/pegar (archivos muy grandes)
⚠️ Máximo ~100 MB recomendado

---

## 🔄 Alternativas si Es Muy Grande

Si tu archivo es > 100 MB, usa estas opciones:

### Opción 1: Comprimir Primero
```bash
# En Windows
tar -czf recovery.tar.gz recovery.img

# Luego convierte recovery.tar.gz a Base64
```

### Opción 2: Usar Carpeta Compartida
```
OneDrive / Google Drive / Mega
→ Obtén URL pública
→ Usa el workflow "Upload Recovery Direct"
```

### Opción 3: Subir via GitHub Web
```
Tu Repo → Add file → Upload files
→ Selecciona recovery.img directamente
```

---

## 🆘 Solución de Problemas

### "El Base64 es muy largo"
```
Normal - es esperado
Copiar/pegar puede tomar tiempo con archivos grandes
```

### "Error decodificando"
```
Verifica que:
1. Copiaste TODO el contenido Base64
2. Sin espacios al inicio/final
3. Sin líneas de BEGIN/END (solo el contenido)
```

### "El workflow no inicia"
```
Espera 10 segundos después de "Run"
Recarga la página
```

---

## 🚀 ¡Listo!

Ahora puedes subir tu recovery.img desde cualquier parte sin necesidad de git.

**¡Inténtalo!** 👈

