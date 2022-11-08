#!/bin/bash

POCKETBASE_FLAGS=()

PB_HOST=${PB_HOST:-0.0.0.0}
PB_PORT=${PB_PORT:-8090}
PB_DATA_DIR="${PB_DATA_DIR:-/opt/pocketbase}"

# Check if PB_DEBUG env is set
if [[ -n "${PB_DEBUG}" ]]; then
    POCKETBASE_FLAGS+=("--debug")
fi

# Check if PB_ENCRYPTION_KEY env is set
if [[ -n "${PB_ENCRYPTION_KEY}" ]]; then
    POCKETBASE_FLAGS+=('--encryptionEnv=PB_ENCRYPTION_KEY')
fi

set -x
pocketbase serve ${POCKETBASE_FLAGS[@]} \
    --dir="${PB_DATA_DIR}" \
    --http="${PB_HOST}:${PB_PORT}"
