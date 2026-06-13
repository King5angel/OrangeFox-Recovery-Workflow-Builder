# 📤 Upload Recovery Direct - Guía Rápida

## 🎯 ¿Qué es?

Un workflow que **descarga tu recovery.img directamente desde una URL** y lo publica en Releases sin necesidad de compilar.

---

## 🚀 Pasos (2 minutos)

### Paso 1: Sube tu recovery.img a Google Drive o similar

**Google Drive:**
1. Ve a https://drive.google.com
2. Sube `recovery.img`
3. Click derecho → Compartir → "Cualquiera con el enlace"
4. Copia el link

**Obtén la URL directa:**
```
Original: https://drive.google.com/file/d/1ABC2DEF3GHI4JKL5MNO6PQR7STU8VWX/view?usp=sharing

URL directa:
https://drive.google.com/uc?export=download&id=1ABC2DEF3GHI4JKL5MNO6PQR7STU8VWX
```

### Paso 2: Ve a GitHub Actions

```
Tu Repo → Actions → Upload Recovery Direct
```

### Paso 3: Run workflow

```
Run workflow
```

### Paso 4: Completa los parámetros

```
DEVICE: nokia_cap_sprout (o tu dispositivo)
DEVICE_NAME: Nokia Cap Sprout
RECOVERY_URL: https://drive.google.com/uc?export=download&id=...
DESCRIPTION: Recovery compilado
```

### Paso 5: Ejecuta

```
Run workflow
```

### Paso 6: Espera 1-2 minutos

El recovery se descargará y se publicará en **Releases**

---

## 📥 Descargar e Instalar

### En GitHub Releases

```
Tu Repo → Releases → Build más reciente
→ Descarga recovery.img
```

### En tu dispositivo

```bash
adb reboot bootloader
fastboot flash recovery recovery.img
fastboot reboot
```

---

## 🔗 URLs Útiles para Subir

### Google Drive (Recomendado)
```
1. Sube archivo
2. Click derecho → Compartir
3. Cambia a "Acceso abierto"
4. Copia link
5. Reemplaza en URL directa: ?id=FILE_ID
```

### OneDrive
```
1. Sube archivo
2. Click derecho → Obtener enlace de descarga
3. Copia URL directa
```

### Mega.nz
```
1. Sube archivo
2. Click derecho → Obtener enlace público
3. Copia URL
```

---

## ⚡ Ventajas

✅ **Súper rápido** - No compila, solo descarga
✅ **Fácil** - Solo necesitas URL
✅ **Automático** - Todo en GitHub Actions
✅ **Seguro** - El archivo se descarga desde tu fuente
✅ **Flexible** - Funciona con cualquier recovery

---

## 🎯 Ejemplo Completo

```
1. Descargo recovery compilado localmente
2. Lo subo a Google Drive
3. Obtengo URL directa
4. Ejecuto: Upload Recovery Direct
5. Parámetro RECOVERY_URL: https://drive.google.com/uc?export=download&id=1ABC...
6. Run workflow
7. ¡Listo! Disponible en Releases en 2 minutos
```

---

**¡Así de simple!** 🚀
