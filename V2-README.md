# 🚀 OrangeFox Recovery Builder v2.0

## ✨ Bienvenida

Este es un **workflow completamente nuevo** diseñado desde cero con:

- ✅ Código limpio y optimizado (400 líneas)
- ✅ 10 pasos automatizados
- ✅ Mejor manejo de errores
- ✅ Logs más claros
- ✅ Mejor rendimiento

---

## 📋 Parámetros del Workflow

### 1. Rama de OrangeFox
```
Opciones:
- OrangeFox-12.1 (Android 12) ← Más estable
- OrangeFox-11 (Android 11)
- fox_14.1 (Android 14) ← Más nuevo
- fox_13.0 (Android 13)
- snake-12.1 (Variante)
```

### 2. URL del Árbol
```
Ejemplo: https://github.com/usuario/dispositivo-tree
Debe ser un repositorio válido en GitHub
```

### 3. Rama del Árbol
```
Debe coincidir con la rama de OrangeFox
Ejemplo: OrangeFox-12.1 con OrangeFox-12.1
```

### 4. Ruta del Dispositivo
```
Formato: device/marca/codename
Ejemplo: device/nokia/cap_sprout
```

### 5. Codename
```
Nombre corto del dispositivo
Ejemplo: cap_sprout, joyeuse, d1
```

### 6. Makefile
```
Nombre del archivo .mk principal
Ejemplo: fox_cap_sprout.mk o AndroidProducts.mk
```

### 7. Objetivo
```
Qué compilar:
- recovery ← Recomendado
- boot
- vendor_boot
```

### 8. Opciones
```
Crear ZIP instalador: ✓ Sí (recomendado)
Crear TAR (Samsung): ✗ No (solo si Samsung)
```

---

## 🎯 Ejemplos Rápidos

### Nokia Cap Sprout
```
Rama: OrangeFox-12.1
URL: https://github.com/kinguser981/cap_sprout_oran
Rama del árbol: OrangeFox-12.1
Ruta: device/nokia/cap_sprout
Codename: cap_sprout
Makefile: fox_cap_sprout.mk
```

### Xiaomi Redmi Note 9
```
Rama: OrangeFox-12.1
URL: https://github.com/usuario/xiaomi-joyeuse
Rama del árbol: OrangeFox-12.1
Ruta: device/xiaomi/joyeuse
Codename: joyeuse
Makefile: AndroidProducts.mk
```

### Samsung Galaxy S10
```
Rama: fox_13.0
URL: https://github.com/usuario/samsung-s10
Rama del árbol: fox_13.0
Ruta: device/samsung/d1
Codename: d1
Makefile: AndroidProducts.mk
TAR: ✓ Sí
```

---

## ⏱️ Tiempos

```
Instalación dependencias: 5-10 min
Sincronización repo: 30-60 min
Compilación: 60-180 min (primera vez)
Post-procesamiento: 5 min
────────────────────────────
TOTAL PRIMERA VEZ: 2-4 horas

Compilaciones siguientes: 30-60 min (caché)
```

---

## 🎬 Pasos del Workflow

```
1. Checkout
2. Mostrar parámetros
3. Instalar dependencias
4. Configurar Git
5. Descargar Repo Tool
6. Inicializar Manifest
7. Sincronizar Repo (30-60 min)
8. Clonar árbol del dispositivo
9. Verificar archivos
10. Compilar Recovery (60-180 min)
11. Localizar recovery
12. Preparar artefactos
13. Crear notas
14. Publicar en Releases
15. Resumen final
```

---

## 📦 Archivos de Salida

Encontrarás en **Releases**:

- ✅ **recovery.img** - Imagen principal
- ✅ **recovery-installer.zip** - ZIP para instalar
- ✅ **recovery.tar** - Para Samsung (si elegiste)

---

## 🚀 ¿Cómo Usar?

### Paso 1: Ve a GitHub Actions
```
https://github.com/King5angel/OrangeFox-Recovery-Workflow-Builder
→ Actions
→ OrangeFox Recovery Builder - v2.0
```

### Paso 2: Haz Click en "Run workflow"
```
Selecciona tus parámetros
```

### Paso 3: ¡Ejecuta!
```
Presiona: "Run workflow"
Espera: 2-4 horas
```

---

## 🐛 Solución de Problemas

### Error: "Device tree not found"
```
Verifica:
1. URL es correcta y accesible
2. Rama existe en el repositorio
3. Rama coincide con manifest
```

### Error: "Compilación fallida"
```
Verifica:
1. Árbol es compatible con rama
2. Todos los archivos están presentes
3. Makefile existe
```

---

**¡Tu workflow v2.0 está listo para usar! 🚀**
