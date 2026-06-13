# 🔧 Custom Recovery Builder - Guía de Uso

## ¿Qué es esto?

Un **constructor automático de recoveries personalizadas** para múltiples dispositivos. Sin necesidad de conocer compilación de Android.

---

## 🚀 Primeros Pasos (1 minuto)

### Opción 1: Desde GitHub Web (MÁS FÁCIL)

1. Ve a tu repositorio: `https://github.com/TU_USUARIO/OrangeFox-Recovery-Workflow-Builder`
2. Haz clic en: **Actions**
3. Selecciona: **Build Custom Recovery**
4. Haz clic en: **Run workflow**
5. Completa:
   ```
   Dispositivo: nokia_cap_sprout (o el tuyo)
   Rama: OrangeFox-12.1
   Objetivo: recovery
   ```
6. **Run workflow** y espera 2-4 horas

---

## 📱 Dispositivos Soportados

### Disponibles Ahora:

```
✓ nokia_cap_sprout      - Nokia Cap Sprout
✓ xiaomi_joyeuse        - Xiaomi Redmi Note 9 Pro
✓ samsung_d1            - Samsung Galaxy S10
✓ xiaomi_alioth         - Xiaomi Poco F3
✓ xiaomi_surya          - Xiaomi Poco X3
```

### Agregar Nuevo Dispositivo:

1. Edita `devices/devices.json`
2. Agrega tu dispositivo:
   ```json
   "mi_dispositivo": {
     "name": "Mi Dispositivo",
     "codename": "mi_codename",
     "brand": "marca",
     "device_path": "device/marca/codename",
     "tree_url": "https://github.com/tu_usuario/tu_arbol",
     "default_branch": "OrangeFox-12.1",
     "makefile": "fox_codename.mk",
     "supported_branches": ["OrangeFox-12.1"],
     "architecture": "arm64",
     "android_version": "12",
     "notes": "Tus notas"
   }
   ```
3. Haz commit y push
4. El dispositivo aparecerá en el dropdown

---

## 💻 Compilar Localmente (Opcional)

### Generar Configuración:

```bash
# Instala jq (para parsear JSON)
sudo apt-get install jq

# Genera configuracion para tu dispositivo
./scripts/generate-config.sh nokia_cap_sprout OrangeFox-12.1
```

### Compilar:

```bash
# Descarga el código (30-60 min)
cd ~/build
./bin/repo sync -j8 -c

# Compila (60-180 min)
source build/envsetup.sh
lunch fox_nokia_cap_sprout-user
make -j$(nproc --all) recovery
```

---

## 📥 Descargar Recovery

1. Compilación completada → **Releases**
2. Selecciona tu build más reciente
3. Descarga: `recovery.img`

---

## 📱 Instalar en tu Dispositivo

### Método 1: Fastboot (Recomendado)

```bash
adb reboot bootloader
fastboot flash recovery recovery.img
fastboot reboot
```

### Método 2: ADB Sideload

```bash
adb reboot recovery
adb sideload recovery-installer.zip
```

### Método 3: Desde TWRP/OrangeFox

1. Copia `recovery.img` a `/sdcard/`
2. TWRP → Install
3. Selecciona `recovery.img`
4. Flash

---

## 🎯 Parámetros del Workflow

### DEVICE
```
Dispositivo a compilar
Opciones: nokia_cap_sprout, xiaomi_joyeuse, samsung_d1, etc.
```

### MANIFEST_BRANCH
```
Versión de OrangeFox
- OrangeFox-12.1 (Android 12) ← Más estable
- OrangeFox-11 (Android 11)
- fox_14.1 (Android 14) ← Más nuevo
```

### BUILD_TARGET
```
Qué compilar
- recovery ← Por defecto
- boot
```

---

## 🔧 Solución de Problemas

### "Device tree not found"
```
Solución:
1. Verifica que la URL en devices/devices.json sea correcta
2. Verifica que la rama existe
3. Intenta clonar manualmente:
   git clone -b rama https://github.com/usuario/repo.git
```

### "Compilación falla"
```
Solución:
1. Verifica que el árbol es compatible con la rama
2. Revisa los logs en Actions
3. Asegúrate de que todos los archivos están presentes
4. Intenta con una rama anterior
```

### "Recovery no encontrado"
```
Solución:
1. El árbol podría ser incompatible
2. Revisa el makefile
3. Intenta compilar localmente para debuggear
```

---

## 📚 Estructura del Proyecto

```
OrangeFox-Recovery-Workflow-Builder/
├── .github/
│   └── workflows/
│       └── build-custom.yml ........... Workflow principal
├── devices/
│   └── devices.json .................. Database de dispositivos
├── scripts/
│   └── generate-config.sh ............ Script generador
├── V2-README.md
├── V2-COMO-USAR.md
└── README.md
```

---

## 🌟 Características

✅ **Dispositivos Múltiples** - Base de datos preconfigurada
✅ **Automático** - No requiere intervención manual
✅ **Rápido** - Compilación en paralelo
✅ **Fácil** - Interfaz web simple
✅ **Documentado** - Guías paso a paso
✅ **Extensible** - Agrega nuevos dispositivos fácilmente

---

## 🤝 Contribuir

¿Tienes un nuevo dispositivo? ¡Comparte!

1. Agrega tu dispositivo a `devices/devices.json`
2. Haz commit y push
3. Los demás pueden usarlo

---

## 📞 Soporte

**¿Problemas?**

1. Revisa esta guía
2. Consulta GUIA-INSTALACION-FLASHEO.md
3. Lee los logs de GitHub Actions
4. Busca en XDA Developers

---

**¡A compilar tus recoveries personalizadas!** 🚀
