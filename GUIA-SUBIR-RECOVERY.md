# 📤 Guía: Cómo Subir Tu Recovery.img Desde tu PC

## 🎯 ¿Por qué esto?

Tienes 3 opciones para usar tu recovery.img local:

1. **Opción Web** (MÁS FÁCIL) - Sin necesidad de Git
2. **Opción Git** (Desde PC) - Usando comandos
3. **Opción Workflow** (AUTOMÁTICA) - El workflow lo encuentra

---

## 📱 OPCIÓN 1: GitHub Web (RECOMENDADO)

### Paso 1: Ve a tu Repositorio

```
https://github.com/King5angel/OrangeFox-Recovery-Workflow-Builder
```

### Paso 2: Haz Clic en **Code**

```
Verde, lado derecho
```

### Paso 3: Haz Clic en **Add file**

```
Dropdown → Upload files
```

### Paso 4: Sube tu Archivo

```
Arrastra recovery.img
O haz clic para seleccionar
```

### Paso 5: Commit

```
"Upload recovery.img"
→ Commit changes
```

### Paso 6: Ejecuta el Workflow

```
Actions → Upload Custom Recovery
→ Run workflow
→ Parámetros:
   DEVICE: nokia_cap_sprout
   RECOVERY_FILE: recovery.img
→ Run workflow
```

### Paso 7: Descarga

```
Releases → Tu archivo
```

**⏱️ Tiempo: 2-5 minutos**

---

## 💻 OPCIÓN 2: Git Desde tu PC

### Paso 1: Copia tu Archivo

Copia `recovery.img` a:

```
C:\Windows\System32\OrangeFox-Recovery-Workflow-Builder\
```

### Paso 2: Abre PowerShell

```powershell
cd C:\Windows\System32\OrangeFox-Recovery-Workflow-Builder
```

### Paso 3: Agrega el Archivo

```powershell
git add recovery.img
```

### Paso 4: Commit

```powershell
git commit -m "Upload custom recovery.img"
```

### Paso 5: Push

```powershell
git push origin main
```

### Paso 6: Ejecuta Workflow

```
GitHub → Actions → Upload Custom Recovery
→ Run workflow
```

### Paso 7: Descarga

```
Releases → Tu archivo
```

**⏱️ Tiempo: 5-10 minutos**

---

## 🤖 OPCIÓN 3: Crear Carpeta de Uploads

### Paso 1: En GitHub Web

```
Code → Add file → Create new file
```

### Paso 2: Nombre

```
uploads/placeholder.txt
```

Esto crea la carpeta `uploads`

### Paso 3: Commit

```
Commit new file
```

### Paso 4: Sube tu Recovery

```
Abre carpeta uploads
Add file → Upload files
Sube recovery.img
```

### Paso 5: Ejecuta Workflow

```
Actions → Upload Custom Recovery
→ Run workflow
→ RECOVERY_FILE: recovery.img
```

**Nota:** El workflow buscará en `uploads/recovery.img`

---

## ⚙️ Usar el Workflow Upload

### Parámetros

```
DEVICE: nokia_cap_sprout
   ↓ Tu dispositivo

DEVICE_NAME: Mi Nokia
   ↓ Nombre (solo si es custom)

RECOVERY_FILE: recovery.img
   ↓ Nombre exacto del archivo

DESCRIPTION: Mi recovery personalizado
   ↓ Descripción opcional
```

### Flujo Completo

```
1. Sube recovery.img a GitHub (Web o Git)
2. Actions → Upload Custom Recovery
3. Run workflow
4. Espera 1-2 minutos
5. Releases → Tu archivo
6. Descarga recovery.img
7. Flashea en tu dispositivo
```

---

## 📋 Checklist

### Antes de Subir

- ✅ Tienes el archivo `recovery.img`
- ✅ Sabes el nombre exacto
- ✅ Tienes la URL del repo
- ✅ Acceso a GitHub

### Al Subir

- ✅ Archivo en la carpeta correcta
- ✅ Nombre sin espacios (recovery.img)
- ✅ Tamaño razonable (20-100 MB)

### Después de Subir

- ✅ Archivo visible en GitHub
- ✅ Workflow ejecutado
- ✅ Release creado
- ✅ Descargable

---

## 🆘 Solución de Problemas

### "El archivo es muy grande"

```
GitHub permite máx 100 MB por archivo
Si es más grande:
- Comprime: 7z, WinRAR, etc.
- O usa Git LFS (más complejo)
```

### "No veo el archivo después de subir"

```
Solución:
1. Actualiza la página (F5)
2. Ve a Code → verifica que está
3. Si no aparece, intenta de nuevo
```

### "El workflow no encuentra el archivo"

```
Solución:
1. Verifica el nombre exacto
2. Sin espacios ni caracteres especiales
3. recovery.img (no RECOVERY.IMG)
4. Si está en carpeta: uploads/recovery.img
```

### "No tengo recovery.img, quiero descargar uno"

```
Solución: Usa el workflow "Build Custom Recovery"
MODE: download
Descarga un recovery existente
```

---

## 🌟 Mejor Práctica

### Flujo Recomendado

```
1. DESCARGAR primero (Mode: download)
   → Prueba que funciona
   
2. COMPILAR personalizado (Mode: compile)
   → Si necesitas cambios
   
3. SUBIR tu propio (Upload workflow)
   → Si ya tienes uno hecho
```

---

## 📝 Ejemplos

### Ejemplo 1: Subir TWRP Descargado

```
1. Descarga de: https://dl.twrp.me/cap_sprout/
2. Sube a GitHub (Opción 1)
3. Ejecuta Upload workflow
4. Descarga de Releases
5. ¡Listo para flashear!
```

### Ejemplo 2: Subir Recovery Modificado

```
1. Tienes recovery.img modificado localmente
2. Copias a carpeta del repo
3. git add recovery.img
4. git commit
5. git push
6. Ejecuta Upload workflow
7. ¡Publicado en Releases!
```

### Ejemplo 3: Flujo Completo

```
DESCARGA → MODIFICA → SUBE → PUBLICA → FLASHEA

1. Download Mode (obtener)
2. Modificar localmente
3. Upload Workflow (publicar)
4. Releases (descargar)
5. adb/fastboot (instalar)
```

---

## 🚀 Comienza Ahora

### Si Tienes Archivo Local

```
Opción 1: Upload via Web (5 min)
→ GitHub → Add file → Upload
→ Actions → Upload Custom Recovery
→ Releases
```

### Si No Tienes Archivo

```
Opción 2: Descargar Primero
→ Actions → Build Custom Recovery
→ Mode: download
→ URL: https://dl.twrp.me/...
→ Releases
```

---

**¡Elige la opción que prefieras y comienza!** 🚀
