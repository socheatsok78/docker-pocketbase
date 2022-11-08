#!/bin/bash

POCKETBASE_FLAGS=()

PB_HOST=${PB_HOST:-0.0.0.0}
PB_PORT=${PB_PORT:-8090}
PB_DATA_DIR="${PB_DATA_DIR:-/opt/pocketbase}"
PB_PUBLIC_DIR="${PB_PUBLIC_DIR:-/var/pocketbase/public}"

test -n "${PB_DEBUG}" && POCKETBASE_FLAGS+=("--debug")
test -n "${PB_CORS}" && POCKETBASE_FLAGS+=("--origins=${PB_CORS}")
test -n "${PB_ENCRYPTION_KEY}" && POCKETBASE_FLAGS+=('--encryptionEnv=PB_ENCRYPTION_KEY')

# Print banner and version
cat /var/pocketbase/banner
echo -e "\n $(pocketbase --version)\n"

set -x
pocketbase serve ${POCKETBASE_FLAGS[@]} \
    --dir="${PB_DATA_DIR}" \
    --publicDir="${PB_PUBLIC_DIR}" \
    --http="${PB_HOST}:${PB_PORT}"
