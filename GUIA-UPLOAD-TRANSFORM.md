# 📤 Upload and Transform Recovery - Guía Completa

## 🎯 ¿Qué Hace?

Te permite:
1. ✅ **Subir** tu `recovery.img` directamente al repositorio
2. ✅ **Procesarlo** automáticamente
3. ✅ **Transformarlo** en recovery personalizado
4. ✅ **Publicarlo** en Releases

---

## 🚀 Pasos Rápidos (5 minutos)

### Paso 1: Prepara tu recovery.img

**Tienes 3 opciones:**

**Opción A - Subirlo a la raíz del repo:**
```bash
# En tu PC, en la carpeta del repositorio
cp tu-recovery.img ./recovery.img
git add recovery.img
git commit -m "Add recovery file"
git push origin main
```

**Opción B - Crear carpeta recoveries:**
```bash
mkdir recoveries
cp tu-recovery.img recoveries/recovery.img
git add recoveries/
git commit -m "Add recovery file"
git push origin main
```

**Opción C - Crear carpeta uploads:**
```bash
mkdir uploads
cp tu-recovery.img uploads/recovery.img
git add uploads/
git commit -m "Add recovery file"
git push origin main
```

### Paso 2: Ve a GitHub Actions

```
Tu Repositorio → Actions → Upload and Transform Recovery
```

### Paso 3: Click en "Run workflow"

```
Run workflow button
```

### Paso 4: Completa los Parámetros

```
DEVICE: nokia_cap_sprout (o tu dispositivo)
DEVICE_NAME: Nokia Cap Sprout
RECOVERY_FILE: recovery.img
MODIFICATIONS: (descripción de cambios)
```

### Paso 5: Ejecuta

```
Click en "Run workflow"
```

### Paso 6: Espera (1-2 minutos)

El recovery se procesará y publicará en **Releases**

---

## 📥 Descargar Desde Releases

```
Tu Repo → Releases → Build más reciente
→ Descarga los archivos:
   - recovery.img (el archivo principal)
   - recovery-info.txt (información)
   - recovery-installer.zip (instalador opcional)
```

---

## 📱 Instalar en tu Dispositivo

### Opción 1: Fastboot (Recomendado)

```bash
# 1. Conecta tu dispositivo por USB
# 2. Ejecuta:
adb reboot bootloader

# 3. Espera a que reinicie en modo bootloader
# 4. Flashea:
fastboot flash recovery recovery.img

# 5. Reinicia:
fastboot reboot
```

### Opción 2: TWRP/OrangeFox

```
1. Copia recovery.img a /sdcard/ de tu teléfono
2. Abre TWRP o OrangeFox
3. Install → Selecciona recovery.img
4. Flash
5. Reboot
```

### Opción 3: ADB Sideload

```bash
adb reboot recovery
adb sideload recovery-installer.zip
```

---

## 🔧 Personalizar el Recovery

### Antes de Subirlo

Puedes modificar tu `recovery.img` **antes de subirlo**:

1. **Descargarlo** desde tu compilación
2. **Modificarlo** localmente:
   - Cambiar ramdisk
   - Agregar módulos
   - Personalizar boot
   - Etc.
3. **Subirlo** al repositorio
4. **Ejecutar** el workflow

### Después de Subirlo

El workflow:
- ✅ Verifica el archivo
- ✅ Calcula MD5
- ✅ Crea empaquetado
- ✅ Publica en Releases

---

## 📋 Estructura de Carpetas (Recomendado)

```
Tu-Repositorio/
├── recovery.img (opción 1)
├── recoveries/
│   └── recovery.img (opción 2)
├── uploads/
│   └── recovery.img (opción 3)
├── .github/
│   └── workflows/
│       └── upload-transform.yml
└── README.md
```

---

## ✅ Checklist

- ✅ Tienes tu `recovery.img` personalizado
- ✅ Lo subiste al repositorio (en raíz o en carpeta)
- ✅ Ejecutaste `git push`
- ✅ Fuiste a GitHub → Actions → Upload and Transform
- ✅ Completaste los parámetros
- ✅ Ejecutaste el workflow
- ✅ Esperaste 1-2 minutos
- ✅ Descargaste de Releases
- ✅ Instalaste en tu dispositivo

---

## 🆘 Solución de Problemas

### "Archivo no encontrado"

```
Solución:
1. Verifica que el archivo existe en el repositorio
2. Usa: git ls-files | grep recovery
3. Verifica el nombre exacto (case-sensitive)
4. Intenta: recovery.img (minúsculas)
```

### "Recovery no flashea"

```
Solución:
1. Verifica que es compatible con tu dispositivo
2. Intenta otro método de instalación
3. Asegúrate de tener drivers ADB instalados
4. Prueba: fastboot devices
```

### "Instalador ZIP no funciona"

```
Solución:
1. Usa recovery.img directamente con fastboot
2. O intenta ADB sideload
3. O copia a /sdcard/ e instala desde TWRP
```

---

## 🎯 Ejemplo Completo

```bash
# 1. Tengo mi recovery compilado
ls -la my-recovery.img

# 2. Lo subo al repo
cp my-recovery.img ./recovery.img
git add recovery.img
git commit -m "Add custom recovery for Nokia Cap Sprout"
git push origin main

# 3. GitHub Actions automáticamente ejecuta el workflow
# 4. Se publica en Releases
# 5. Descargo recovery.img
# 6. Lo instalo:
adb reboot bootloader
fastboot flash recovery recovery.img
fastboot reboot

# 7. ¡Listo! Recovery personalizado instalado
```

---

## 🚀 ¡Comenzar Ahora!

1. Prepara tu `recovery.img`
2. Súbelo al repositorio
3. Ejecuta: `Upload and Transform Recovery`
4. ¡Listo en 2 minutos!

---

**¡Fácil, rápido y automatizado!** 🎉
