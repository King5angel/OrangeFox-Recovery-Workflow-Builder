# 📱 Dual Mode Recovery Builder - Guía de Uso

## 🎯 ¿Qué es?

El workflow ahora tiene **2 modos**:

### Modo 1️⃣: **Download** (Descargar Recovery Original)
- Descarga un recovery ya compilado
- NO requiere compilación
- **¡MÁS RÁPIDO!** (5-10 minutos)
- Ideal para probar

### Modo 2️⃣: **Compile** (Compilar Recovery Personalizado)
- Compila desde cero
- Personalizado con tu device tree
- Toma más tiempo (2-4 horas)
- Para modificaciones personalizadas

---

## 🚀 Cómo Usar - Modo Download (RECOMENDADO PRIMERO)

### Paso 1: Ir a Actions

```
GitHub → Actions → Build Custom Recovery
→ Run workflow
```

### Paso 2: Completa los Parámetros

```
MODE: download                    ← Selecciona DOWNLOAD
DEVICE: nokia_cap_sprout         ← Tu dispositivo
RECOVERY_URL: https://...        ← URL del recovery original
```

### Paso 3: Donde Encontrar URLs

**Nokia Cap Sprout:**
```
https://dl.twrp.me/cap_sprout/
```

**Xiaomi Redmi Note 9 Pro:**
```
https://dl.twrp.me/joyeuse/
```

**Samsung Galaxy S10:**
```
https://dl.twrp.me/d1/
```

O busca en:
- **TWRP**: https://dl.twrp.me/
- **OrangeFox**: https://orangefox.download/
- **XDA Developers**: https://xda-developers.com/

### Paso 4: Ejecuta

```
Run workflow → Espera 5-10 minutos
```

### Paso 5: Descarga

```
Releases → Tu build reciente
→ Descarga recovery.img
```

---

## 🛠️ Cómo Usar - Modo Compile (MÁS AVANZADO)

### Paso 1: Ir a Actions

```
GitHub → Actions → Build Custom Recovery
→ Run workflow
```

### Paso 2: Completa los Parámetros

```
MODE: compile                    ← Selecciona COMPILE
DEVICE: nokia_cap_sprout         ← Tu dispositivo
MANIFEST_BRANCH: OrangeFox-12.1  ← Rama de OrangeFox
BUILD_TARGET: recovery           ← recovery o boot
RECOVERY_URL: (dejar en blanco)  ← NO necesario
```

### Paso 3: Ejecuta

```
Run workflow → Espera 2-4 horas
```

### Paso 4: Descarga

```
Releases → Tu build reciente
→ Descarga recovery.img
```

---

## 📊 Comparativa

| Aspecto | Download | Compile |
|--------|----------|---------|
| **Tiempo** | 5-10 min | 2-4 horas |
| **Complejidad** | Muy simple | Normal |
| **Personalización** | NO | SÍ |
| **Ideal para** | Probar/Instalar | Modificar |
| **Recomendado** | ✅ PRIMERO | Después |

---

## 🔗 URLs de Recovery por Dispositivo

### Nokia Cap Sprout
```
TWRP: https://dl.twrp.me/cap_sprout/recovery.img
OrangeFox: https://orangefox.download/nokia
```

### Xiaomi Redmi Note 9 Pro (joyeuse)
```
TWRP: https://dl.twrp.me/joyeuse/recovery.img
OrangeFox: https://orangefox.download/redmi-note-9-pro
```

### Samsung Galaxy S10 (d1)
```
TWRP: https://dl.twrp.me/d1/recovery.img
OrangeFox: https://orangefox.download/samsung-s10
```

### Xiaomi Poco F3 (alioth)
```
TWRP: https://dl.twrp.me/alioth/recovery.img
OrangeFox: https://orangefox.download/poco-f3
```

### Xiaomi Poco X3 (surya)
```
TWRP: https://dl.twrp.me/surya/recovery.img
OrangeFox: https://orangefox.download/poco-x3
```

---

## 📝 Paso a Paso Completo - Modo Download

### 1. Obtén la URL

Busca tu dispositivo en:
- https://dl.twrp.me/
- https://orangefox.download/

Ejemplo para Nokia Cap Sprout:
```
https://dl.twrp.me/cap_sprout/TWRP.img
```

### 2. Ve a Actions

```
GitHub → Actions
```

### 3. Selecciona Workflow

```
Build Custom Recovery
```

### 4. Click en "Run workflow"

```
Dropdown superior derecho
```

### 5. Completa los Parámetros

```
MODE: download
DEVICE: nokia_cap_sprout
RECOVERY_URL: https://dl.twrp.me/cap_sprout/TWRP.img
```

### 6. Click en "Run workflow"

```
Verde, abajo del formulario
```

### 7. Espera

```
Actions → Tu build en progreso
Ver logs en tiempo real
```

### 8. Descarga

```
Cuando termine → Releases
→ Descarga recovery.img
```

### 9. Instala

```bash
adb reboot bootloader
fastboot flash recovery recovery.img
fastboot reboot
```

---

## ⚙️ Parámetros Explicados

### MODE (Requerido)

```
download = Descargar recovery original
compile  = Compilar recovery personalizado
```

**Recomendación:** Comienza con `download`

### DEVICE (Requerido)

```
nokia_cap_sprout     Nokia Cap Sprout
xiaomi_joyeuse       Xiaomi Redmi Note 9 Pro
samsung_d1           Samsung Galaxy S10
xiaomi_alioth        Xiaomi Poco F3
xiaomi_surya         Xiaomi Poco X3
```

### RECOVERY_URL (Solo Download)

```
URL donde descargar el recovery

Ejemplos:
https://dl.twrp.me/cap_sprout/TWRP.img
https://orangefox.download/nokia/recovery.img
```

### MANIFEST_BRANCH (Solo Compile)

```
OrangeFox-12.1  Android 12 (Recomendado)
OrangeFox-11    Android 11
fox_14.1        Android 14 (Más nuevo)
```

### BUILD_TARGET (Solo Compile)

```
recovery   Compilar recovery (Defecto)
boot       Compilar boot
```

---

## 🆘 Solución de Problemas

### "URL no válida"
```
Solución: Verifica que la URL sea correcta
Prueba acceder desde navegador primero
```

### "Descarga falla"
```
Solución: 
- URL podría estar caída
- Intenta otra URL
- Intenta modo Compile
```

### "Compilación falla (Modo Compile)"
```
Solución:
- Verifica que el device tree existe
- Intenta otra rama de OrangeFox
- Revisa los logs
```

---

## 🎯 Flujo Recomendado

### Opción 1: Solo Probar (MÁS RÁPIDO)

```
1. Mode: download
2. Espera 5-10 min
3. Descarga
4. Instala en dispositivo
5. ¡Listo!
```

### Opción 2: Compilar Personalizado (MÁS CONTROL)

```
1. Mode: compile
2. Espera 2-4 horas
3. Descarga
4. Instala en dispositivo
5. ¡Personalizado!
```

### Opción 3: Combinado (RECOMENDADO)

```
1. Primero: download (probar rápido)
2. Luego: compile (si necesitas cambios)
3. Comparar resultados
4. Elegir el que prefieras
```

---

## 📊 Estados del Workflow

### ✅ Verde - Éxito
```
Build completado
Recovery está listo en Releases
Descarga y flashea
```

### 🟡 Amarillo - En Progreso
```
Workflow ejecutándose
Monitorea los logs
```

### ❌ Rojo - Fallo
```
Algo falló
Revisa los logs
Intenta con otros parámetros
```

---

## 🔗 Enlaces Útiles

- **TWRP Recovery**: https://twrp.me/
- **OrangeFox**: https://orangefox.download/
- **XDA Developers**: https://xda-developers.com/
- **Android Flash Tool**: https://flash.android.com/

---

## 🚀 ¡Comienza Ya!

**Recomendación para principiantes:**

1. Ve a **Actions**
2. Selecciona **Build Custom Recovery**
3. **MODE**: `download`
4. **DEVICE**: Tu dispositivo
5. **RECOVERY_URL**: Encuentra en TWRP
6. **Run workflow**
7. Espera 5-10 minutos
8. ¡Descarga y flashea!

---

**¡Construye tus recoveries personalizadas!** 🔧✨
