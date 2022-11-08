#!/bin/bash

POCKETBASE_FLAGS=()

PB_HOST=${PB_HOST:-0.0.0.0}
PB_PORT=${PB_PORT:-8090}
PB_DATA_DIR="${PB_DATA_DIR:-/opt/pocketbase}"
PB_PUBLIC_DIR="${PB_PUBLIC_DIR:-/var/pocketbase/public}"

# Check if PB_DEBUG env is set
test -n "${PB_DEBUG}" && POCKETBASE_FLAGS+=("--debug")

# Check if PB_CORS env is set
test -n "${PB_CORS}" && POCKETBASE_FLAGS+=("--origins=${PB_CORS}")

# Check if PB_ENCRYPTION_KEY env is set
test -n "${PB_ENCRYPTION_KEY}" && POCKETBASE_FLAGS+=('--encryptionEnv=PB_ENCRYPTION_KEY')

# Print logo
cat /var/pocketbase/banner
echo -e "\n $(pocketbase --version)\n"

set -x
pocketbase serve ${POCKETBASE_FLAGS[@]} \
    --dir="${PB_DATA_DIR}" \
    --publicDir="${PB_PUBLIC_DIR}" \
    --http="${PB_HOST}:${PB_PORT}"
