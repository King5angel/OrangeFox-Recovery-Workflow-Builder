#!/bin/bash

# Script para generar configuracion de recovery personalizado
# Uso: ./scripts/generate-config.sh nokia_cap_sprout OrangeFox-12.1

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
DEVICES_FILE="$PROJECT_ROOT/devices/devices.json"

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Funciones
print_error() {
    echo -e "${RED}ERROR: $1${NC}"
    exit 1
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

print_header() {
    echo ""
    echo "======================================"
    echo "$1"
    echo "======================================"
    echo ""
}

# Validar argumentos
if [ $# -lt 1 ]; then
    print_error "Uso: $0 <device_id> [branch]"
    echo ""
    echo "Dispositivos disponibles:"
    if command -v jq &> /dev/null; then
        jq 'keys[]' "$DEVICES_FILE" | sed 's/"//g' | sed 's/^/  - /'
    else
        echo "  - nokia_cap_sprout"
        echo "  - xiaomi_joyeuse"
        echo "  - samsung_d1"
        echo "  - xiaomi_alioth"
        echo "  - xiaomi_surya"
    fi
    exit 1
fi

DEVICE_ID=$1
BRANCH=$2

print_header "Custom Recovery Builder - Configurador"

# Validar que el archivo de dispositivos existe
if [ ! -f "$DEVICES_FILE" ]; then
    print_error "Archivo de dispositivos no encontrado: $DEVICES_FILE"
fi

print_info "Leyendo configuracion del dispositivo: $DEVICE_ID"

# Intentar parsear con jq (si existe)
if command -v jq &> /dev/null; then
    if ! jq -e ".$DEVICE_ID" "$DEVICES_FILE" > /dev/null 2>&1; then
        print_error "Dispositivo no encontrado: $DEVICE_ID"
    fi
    
    DEVICE_NAME=$(jq -r ".$DEVICE_ID.name" "$DEVICES_FILE")
    CODENAME=$(jq -r ".$DEVICE_ID.codename" "$DEVICES_FILE")
    BRAND=$(jq -r ".$DEVICE_ID.brand" "$DEVICES_FILE")
    DEVICE_PATH=$(jq -r ".$DEVICE_ID.device_path" "$DEVICES_FILE")
    TREE_URL=$(jq -r ".$DEVICE_ID.tree_url" "$DEVICES_FILE")
    DEFAULT_BRANCH=$(jq -r ".$DEVICE_ID.default_branch" "$DEVICES_FILE")
    MAKEFILE=$(jq -r ".$DEVICE_ID.makefile" "$DEVICES_FILE")
    NOTES=$(jq -r ".$DEVICE_ID.notes" "$DEVICES_FILE")
else
    # Fallback si jq no existe
    print_info "jq no instalado, usando parser basico"
    case $DEVICE_ID in
        nokia_cap_sprout)
            DEVICE_NAME="Nokia Cap Sprout"
            CODENAME="cap_sprout"
            BRAND="nokia"
            DEVICE_PATH="device/nokia/cap_sprout"
            TREE_URL="https://github.com/kinguser981/cap_sprout_oran"
            DEFAULT_BRANCH="OrangeFox-12.1"
            MAKEFILE="fox_cap_sprout.mk"
            NOTES="Works with OrangeFox 12.1"
            ;;
        *)
            print_error "Dispositivo no soportado sin jq: $DEVICE_ID"
            ;;
    esac
fi

# Usar rama proporcionada o default
if [ -z "$BRANCH" ]; then
    BRANCH=$DEFAULT_BRANCH
fi

print_success "Dispositivo encontrado: $DEVICE_NAME"
echo ""
echo "Detalles del dispositivo:"
echo "  Nombre: $DEVICE_NAME"
echo "  Codename: $CODENAME"
echo "  Marca: $BRAND"
echo "  Rama: $BRANCH"
echo "  Ruta: $DEVICE_PATH"
echo "  URL del arbol: $TREE_URL"
echo "  Makefile: $MAKEFILE"
echo "  Notas: $NOTES"
echo ""

# Crear archivo de configuracion
CONFIG_FILE="$PROJECT_ROOT/.build-config"
cat > "$CONFIG_FILE" << EOF
# Configuracion generada para $DEVICE_NAME
# $(date)

DEVICE_ID=$DEVICE_ID
DEVICE_NAME=$DEVICE_NAME
CODENAME=$CODENAME
BRAND=$BRAND
DEVICE_PATH=$DEVICE_PATH
TREE_URL=$TREE_URL
BRANCH=$BRANCH
MAKEFILE=$MAKEFILE
BUILD_TARGET=recovery
RECOVERY_INSTALLER=true
EOF

print_success "Configuracion guardada en: $CONFIG_FILE"
echo ""

# Crear archivo de parametros para GitHub Actions
PARAMS_FILE="$PROJECT_ROOT/.github-params.json"
cat > "$PARAMS_FILE" << EOF
{
  "MANIFEST_BRANCH": "$BRANCH",
  "DEVICE_TREE_URL": "$TREE_URL",
  "DEVICE_TREE_BRANCH": "$BRANCH",
  "DEVICE_PATH": "$DEVICE_PATH",
  "DEVICE_CODENAME": "$CODENAME",
  "DEVICE_MAKEFILE": "$MAKEFILE",
  "BUILD_TARGET": "recovery",
  "RECOVERY_INSTALLER": true
}
EOF

print_success "Parametros para GitHub Actions guardados en: $PARAMS_FILE"
echo ""

print_header "Instrucciones Siguientes"

echo "1. Actualiza tu tree_url si es necesario:"
echo "   Edita: devices/devices.json"
echo ""

echo "2. Para compilar localmente (si tienes Android SDK):"
echo "   source build/envsetup.sh"
echo "   lunch fox_$CODENAME-user"
echo "   make -j\$(nproc --all) recovery"
echo ""

echo "3. Para compilar en GitHub Actions:"
echo "   - Haz push de los cambios"
echo "   - Ve a Actions en tu repositorio"
echo "   - Selecciona: Build Custom Recovery"
echo "   - Haz clic en: Run workflow"
echo "   - Completa los parametros (ya estan precargados)"
echo ""

print_success "Configuracion completada!"
echo ""
