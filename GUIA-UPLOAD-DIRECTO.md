# 📤 Upload Recovery - Método Directo desde Workflow

## 🎯 ¿Cómo Funciona?

El workflow te permite subir tu recovery de **2 formas**:

### Opción 1️⃣: Via URL (MÁS SIMPLE)

```
Subes recovery.img a: Google Drive, OneDrive, Mega, etc
Obtienes URL compartible
Workflow descarga desde la URL
Se publica en Releases
```

### Opción 2️⃣: Via Git (Desde PC)

```
Copias recovery.img a tu carpeta
git add recovery.img
git push
Workflow lo detecta automáticamente
```

---

## 🚀 OPCIÓN 1: Upload via URL (RECOMENDADO)

### Paso 1: Sube tu recovery.img a la Nube

**Google Drive:**
```
1. Ve a https://drive.google.com
2. Sube recovery.img
3. Click derecho → Compartir
4. Cambia a "Cualquiera con el enlace"
5. Copia el link
```

**OneDrive:**
```
1. Ve a https://onedrive.live.com
2. Sube recovery.img
3. Click en archivo → Compartir
4. Copia el enlace
```

**Mega:**
```
1. Ve a https://mega.nz
2. Sube recovery.img
3. Click derecho → "Obtener enlace público"
4. Copia
```

### Paso 2: Obtén URL Directa

Para **Google Drive** (ejemplo):
```
Original: https://drive.google.com/file/d/1ABC2DEF3GHI4JKL5MNO6PQR7STU8VWX/view?usp=sharing

Reemplaza con:
https://drive.google.com/uc?export=download&id=1ABC2DEF3GHI4JKL5MNO6PQR7STU8VWX
```

### Paso 3: Ve a GitHub Actions

```
Tu Repo → Actions → Upload Custom Recovery Direct
```

### Paso 4: Run Workflow

```
Run workflow
```

### Paso 5: Completa los Parámetros

```
DEVICE: nokia_cap_sprout      ← Tu dispositivo
RECOVERY_NAME: mi-recovery    ← Nombre personalizado
UPLOAD_URL: https://...       ← Tu URL del archivo
DESCRIPTION: Mi recovery      ← Descripción
```

### Paso 6: Ejecuta

```
Run workflow → Espera 1-2 minutos
```

### Paso 7: Descarga

```
Releases → Tu build
→ Descarga recovery.img
```

---

## 💻 OPCIÓN 2: Upload via Git (Desde tu PC)

### Paso 1: Copia tu Archivo

```
C:\Windows\System32\OrangeFox-Recovery-Workflow-Builder\
```

Aquí copias: `recovery.img`

### Paso 2: Abre PowerShell

```powershell
cd C:\Windows\System32\OrangeFox-Recovery-Workflow-Builder
```

### Paso 3: Git Add

```powershell
git add recovery.img
```

### Paso 4: Git Commit

```powershell
git commit -m "Upload custom recovery.img"
```

### Paso 5: Git Push

```powershell
git push origin main
```

### Paso 6: Ve a GitHub Actions

```
Tu Repo → Actions → Upload Custom Recovery Direct
```

### Paso 7: Run Workflow

```
Run workflow
Deja UPLOAD_URL vacío
```

### Paso 8: Completa

```
DEVICE: nokia_cap_sprout
RECOVERY_NAME: mi-recovery
UPLOAD_URL: (DÉJALO VACÍO)
```

### Paso 9: Ejecuta

```
Run workflow → Espera 1-2 minutos
```

### Paso 10: Descarga

```
Releases → Tu archivo
```

---

## 📋 Parámetros Explicados

### DEVICE
```
nokia_cap_sprout     Nokia Cap Sprout
xiaomi_joyeuse       Xiaomi Redmi Note 9 Pro
samsung_d1           Samsung Galaxy S10
xiaomi_alioth        Xiaomi Poco F3
xiaomi_surya         Xiaomi Poco X3
custom               Mi dispositivo personalizado
```

### DEVICE_NAME (si es custom)
```
"Mi Nokia"
"Mi Xiaomi"
"Mi Samsung"
```

### RECOVERY_NAME
```
Nombre para identificar tu recovery

Ejemplos:
- mi-recovery
- twrp-v3.7
- orangefox-12.1
- custom-build
```

### UPLOAD_URL
```
URL directa al archivo

Ejemplos:
https://drive.google.com/uc?export=download&id=...
https://onedrive.live.com/.../recovery.img
https://dl.twrp.me/cap_sprout/...
```

### DESCRIPTION
```
Descripción opcional

Ejemplos:
- "Recovery personalizado"
- "TWRP modificado"
- "OrangeFox v12.1"
```

---

## ✅ Checklist

### Antes de Subir (Via URL)

- ✅ Archivo subido a Google Drive/OneDrive/Mega
- ✅ Link compartible obtenido
- ✅ URL directa copiada
- ✅ GitHub Actions accesible

### Antes de Subir (Via Git)

- ✅ recovery.img en la carpeta correcta
- ✅ PowerShell abierto en carpeta del repo
- ✅ Git instalado
- ✅ Acceso a GitHub

---

## 🎯 Flujo Recomendado

### Para Principiantes (VÍA URL)

```
1. Sube recovery a Google Drive (2 min)
2. Obtén URL (1 min)
3. Actions → Upload Custom Recovery Direct (1 min)
4. Parámetros + Run (1 min)
5. Espera (1-2 min)
6. Descarga de Releases (1 min)

Total: 7-10 minutos
```

### Para Usuarios Avanzados (VÍA GIT)

```
1. Copia recovery.img (1 min)
2. git add/commit/push (2-3 min)
3. Actions → Run workflow (1 min)
4. Parámetros + Run (1 min)
5. Espera (1-2 min)
6. Descarga (1 min)

Total: 7-10 minutos
```

---

## 🚀 ¡Comienza Ya!

### Si Tienes URL:

```
Actions → Upload Custom Recovery Direct
UPLOAD_URL: tu_url
Run workflow
```

### Si Tienes Archivo Local:

```
Git push → recovery.img
Actions → Upload Custom Recovery Direct
UPLOAD_URL: (vacío)
Run workflow
```

### Si No Tienes Nada:

```
Actions → Build Custom Recovery
MODE: download
Descarga un recovery original
```

---

**¡Fácil, rápido y sin complicaciones!** 🚀
