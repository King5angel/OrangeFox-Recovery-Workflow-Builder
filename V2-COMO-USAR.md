# 📖 Cómo Usar tu Nuevo Workflow

## 🎯 PASO A PASO

### PASO 1: Subir a GitHub

En tu terminal (estando en la carpeta clonada):

```bash
git add .
git commit -m "feat: Agregar OrangeFox Workflow v2.0"
git push origin main
```

### PASO 2: Ir a GitHub Actions

```
https://github.com/King5angel/OrangeFox-Recovery-Workflow-Builder
→ Actions
→ OrangeFox Recovery Builder - v2.0
```

### PASO 3: Haz Click en "Run workflow"

### PASO 4: Completa los Parámetros

```
Rama de OrangeFox: OrangeFox-12.1
URL del árbol: Tu URL (ejemplo: https://github.com/usuario/device-tree)
Rama del árbol: OrangeFox-12.1
Ruta del dispositivo: device/marca/codename
Codename: Tu codename
Makefile: Tu makefile
Objetivo: recovery
Instalador: ✓ Sí
TAR: ✗ No (solo Samsung)
```

### PASO 5: Presiona "Run workflow"

### PASO 6: Espera (2-4 horas)

Ve a **Actions** y monitorea el build en tiempo real.

### PASO 7: Descarga tu Recovery

```
Releases → Selecciona tu build
→ Descarga recovery.img
```

---

## 🔧 Parámetros Explicados

### Rama de OrangeFox
La versión de OrangeFox que quieres compilar. Elige la que sea compatible con tu dispositivo.

### URL del Árbol
La URL del repositorio GitHub con la configuración de tu dispositivo. 

**Ejemplo válido:**
```
https://github.com/kinguser981/cap_sprout_oran
```

### Rama del Árbol
Debe coincidir exactamente con la rama de OrangeFox.

**Ejemplo:**
```
Si eliges OrangeFox-12.1 → Rama del árbol también OrangeFox-12.1
```

### Ruta del Dispositivo
Dónde se clonará el árbol del dispositivo.

**Formato:**
```
device/[marca]/[codename]

Ejemplos válidos:
- device/nokia/cap_sprout
- device/xiaomi/joyeuse
- device/samsung/d1
```

### Codename
Nombre corto de tu dispositivo. Se usa en las variables de compilación.

**Ejemplos:**
```
- cap_sprout (Nokia)
- joyeuse (Xiaomi Redmi Note 9)
- d1 (Samsung Galaxy S10)
```

### Makefile
Archivo makefile principal de tu dispositivo.

**Formatos comunes:**
```
- fox_cap_sprout.mk
- AndroidProducts.mk
- device.mk
```

### Objetivo
Qué compilar. Casi siempre será `recovery`.

**Opciones:**
```
- recovery ← Usa esto
- boot (solo si necesitas)
- vendor_boot (solo A13+)
```

---

## 📱 Ejemplos Listos para Usar

### Nokia Cap Sprout
```
Rama: OrangeFox-12.1
URL: https://github.com/kinguser981/cap_sprout_oran
Rama árbol: OrangeFox-12.1
Ruta: device/nokia/cap_sprout
Codename: cap_sprout
Makefile: fox_cap_sprout.mk
```

### Xiaomi Redmi Note 9
```
Rama: OrangeFox-12.1
URL: https://github.com/tu-usuario/xiaomi-joyeuse
Rama árbol: OrangeFox-12.1
Ruta: device/xiaomi/joyeuse
Codename: joyeuse
Makefile: AndroidProducts.mk
```

---

## ✨ ¡Listo!

Tu workflow está en tu repositorio GitHub. Solo necesitas:

1. Ir a **Actions**
2. Seleccionar **OrangeFox Recovery Builder - v2.0**
3. Hacer clic en **Run workflow**
4. Completar parámetros
5. ¡Esperar a que compile!

---

**¿Preguntas? Lee V2-README.md** 📖
