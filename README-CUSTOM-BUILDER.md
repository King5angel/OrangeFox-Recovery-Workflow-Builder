# 🔨 Custom Recovery Builder

> Un constructor automático de OrangeFox Recovery personalizado para múltiples dispositivos.

![Status](https://img.shields.io/badge/status-active-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Devices](https://img.shields.io/badge/devices-5%2B-orange)

---

## ✨ ¿Qué es?

Un **sistema completo de compilación automática** que permite crear recoveries personalizadas para tu dispositivo sin conocimientos de Android.

### Características:

- ✅ **5+ Dispositivos Preconfigutados**
- ✅ **Compilación Automática en GitHub Actions**
- ✅ **Base de Datos de Dispositivos (JSON)**
- ✅ **Script Generador de Configuración**
- ✅ **Documentación Completa en Español**
- ✅ **Publicación Automática en Releases**

---

## 🚀 Inicio Rápido

### 1. Ejecutar Workflow (1 minuto)

```
GitHub → Actions → Build Custom Recovery
→ Run workflow
→ Selecciona tu dispositivo
→ Ejecuta
```

### 2. Esperar Compilación (2-4 horas)

Monitores el progreso en Actions.

### 3. Descargar Recovery (1 minuto)

```
Releases → Tu build
→ Descarga recovery.img
```

### 4. Instalar en Dispositivo (10-15 minutos)

```bash
adb reboot bootloader
fastboot flash recovery recovery.img
fastboot reboot
```

---

## 📱 Dispositivos Soportados

| Dispositivo | Codename | Rama | Estado |
|---|---|---|---|
| Nokia Cap Sprout | nokia_cap_sprout | OrangeFox-12.1 | ✅ |
| Xiaomi Redmi Note 9 Pro | xiaomi_joyeuse | OrangeFox-12.1 | ✅ |
| Samsung Galaxy S10 | samsung_d1 | fox_13.0 | ✅ |
| Xiaomi Poco F3 | xiaomi_alioth | OrangeFox-12.1 | ✅ |
| Xiaomi Poco X3 | xiaomi_surya | OrangeFox-12.1 | ✅ |

**¿Tu dispositivo no está? [Agrégalo aquí](GUIA-CUSTOM-BUILDER.md#agregar-nuevo-dispositivo)**

---

## 📂 Estructura

```
.
├── .github/workflows/
│   ├── build-custom.yml ........... Workflow principal
│   └── build.yml ................. Build básico
├── devices/
│   └── devices.json .............. Database de dispositivos
├── scripts/
│   └── generate-config.sh ........ Script generador
├── GUIA-CUSTOM-BUILDER.md ........ Guía completa
├── GUIA-INSTALACION-FLASHEO.md .. Métodos de instalación
└── README.md ..................... Este archivo
```

---

## 🎯 Cómo Funciona

### 1. Base de Datos de Dispositivos

Archivo `devices/devices.json` contiene configuración de cada dispositivo:

```json
{
  "nokia_cap_sprout": {
    "name": "Nokia Cap Sprout",
    "codename": "cap_sprout",
    "tree_url": "https://github.com/...",
    "default_branch": "OrangeFox-12.1",
    ...
  }
}
```

### 2. Workflow Automático

El workflow `build-custom.yml`:
1. Lee la database
2. Carga configuración del dispositivo
3. Descarga código de OrangeFox
4. Clona tu árbol del dispositivo
5. Compila automáticamente
6. Publica en Releases

### 3. Instalación Simple

Descarga el `recovery.img` y flashea con `fastboot`.

---

## 🔧 Personalización

### Agregar Nuevo Dispositivo

1. Edita `devices/devices.json`
2. Agrega tu dispositivo:
   ```json
   "tu_device": {
     "name": "Tu Dispositivo",
     "codename": "tu_codename",
     "brand": "marca",
     "device_path": "device/marca/codename",
     "tree_url": "https://github.com/usuario/arbol",
     "default_branch": "OrangeFox-12.1",
     "makefile": "fox_codename.mk",
     "supported_branches": ["OrangeFox-12.1"],
     "architecture": "arm64",
     "android_version": "12",
     "notes": "Tus notas"
   }
   ```
3. Commit y push
4. Listo - aparecerá en el dropdown

### Compilación Local

```bash
# Generar configuración
./scripts/generate-config.sh nokia_cap_sprout OrangeFox-12.1

# Compilar
cd ~/build
source build/envsetup.sh
lunch fox_nokia_cap_sprout-user
make -j$(nproc --all) recovery
```

---

## 📚 Documentación

- **[GUIA-CUSTOM-BUILDER.md](GUIA-CUSTOM-BUILDER.md)** - Guía completa de uso
- **[GUIA-INSTALACION-FLASHEO.md](GUIA-INSTALACION-FLASHEO.md)** - Métodos de instalación
- **[V2-COMO-USAR.md](V2-COMO-USAR.md)** - Parámetros del workflow

---

## 🔄 Flujo de Trabajo

```
┌─────────────────────────┐
│  Run Workflow           │
│  (GitHub Actions)       │
└──────────┬──────────────┘
           ↓
┌─────────────────────────┐
│  Cargar Configuración   │
│  (devices.json)         │
└──────────┬──────────────┘
           ↓
┌─────────────────────────┐
│  Compilar Recovery      │
│  (OrangeFox + Device)   │
└──────────┬──────────────┘
           ↓
┌─────────────────────────┐
│  Generar Artifacts      │
│  (recovery.img)         │
└──────────┬──────────────┘
           ↓
┌─────────────────────────┐
│  Publicar en Releases   │
│  (Descargable)          │
└──────────┬──────────────┘
           ↓
┌─────────────────────────┐
│  Instalar en Dispositivo│
│  (fastboot flash)       │
└─────────────────────────┘
```

---

## 📋 Requisitos

### Para Usar el Workflow:
- ✅ Cuenta de GitHub
- ✅ Fork de este repositorio
- ✅ Dispositivo compatible

### Para Compilar Localmente:
- ✅ Linux/macOS (o WSL en Windows)
- ✅ 50+ GB espacio en disco
- ✅ Dependencias de AOSP instaladas

---

## ⏱️ Tiempos

```
Primer build: 2-4 horas
- Sincronización: 30-60 min
- Compilación: 60-180 min

Builds posteriores: 30-60 min
(Caché acelera significativamente)
```

---

## 🆘 Solución de Problemas

### Build Falla
1. Revisa los logs en Actions
2. Verifica que tree_url es correcto
3. Asegúrate de que la rama existe
4. Intenta con otra rama

### Recovery No Se Flashea
1. Verifica que es el recovery correcto
2. Intenta con otro método (Odin, ADB, etc.)
3. Asegúrate de tener drivers instalados

Ver [GUIA-CUSTOM-BUILDER.md](GUIA-CUSTOM-BUILDER.md#solución-de-problemas) para más.

---

## 🤝 Contribuir

¿Tienes un dispositivo para agregar?

1. Fork este repositorio
2. Agrega tu dispositivo a `devices/devices.json`
3. Commit y push
4. Abre un Pull Request

---

## 📞 Soporte

- **GitHub Issues**: Reporta problemas
- **Documentación**: Lee las guías
- **XDA Developers**: Busca en la comunidad
- **OrangeFox Wiki**: https://wiki.orangefox.download

---

## 📄 Licencia

MIT License - Usa libremente

---

## 🌟 Créditos

- **OrangeFox Recovery**: Equipo original
- **TWRP**: Base de technología
- **Android Open Source Project**: Framework

---

## 🚀 ¡Comienza Ya!

```bash
# Clona tu fork
git clone https://github.com/TU_USUARIO/Custom-Recovery-Builder.git

# Agrega tu dispositivo (opcional)
# Edita devices/devices.json

# Commit y push
git add .
git commit -m "Agregar mi dispositivo"
git push

# ¡Usa el workflow!
# GitHub → Actions → Build Custom Recovery
```

---

**Construye tus recoveries personalizadas sin complicaciones.** 🔨✨
