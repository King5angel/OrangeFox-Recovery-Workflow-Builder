# Configuracion del Custom Recovery Builder

# Ramas de OrangeFox disponibles
ORANGEFOX_BRANCHES=(
  "OrangeFox-12.1"
  "OrangeFox-11"
  "fox_14.1"
  "fox_13.0"
  "snake-12.1"
)

# Objetivos de compilacion
BUILD_TARGETS=(
  "recovery"
  "boot"
  "vendor_boot"
)

# Dispositivos por defecto
DEFAULT_DEVICE="nokia_cap_sprout"
DEFAULT_BRANCH="OrangeFox-12.1"
DEFAULT_TARGET="recovery"

# Timeouts (en minutos)
SYNC_TIMEOUT=120
BUILD_TIMEOUT=300

# Configuracion de compilacion
MAKE_JOBS=$(nproc --all)
USE_CCACHE=1
CCACHE_SIZE=50G

# Directorios
BUILD_DIR="$HOME/build"
ARTIFACTS_DIR="$BUILD_DIR/artifacts"
LOGS_DIR="$BUILD_DIR/logs"

# URLs
ORANGEFOX_MANIFEST="https://github.com/OrangeFoxRecovery/manifest.git"
REPO_TOOL="https://storage.googleapis.com/git-repo-downloads/repo"

# Metadata
PROJECT_VERSION="1.0"
PROJECT_AUTHOR="Custom Builder"
PROJECT_URL="https://github.com/usuario/Custom-Recovery-Builder"
