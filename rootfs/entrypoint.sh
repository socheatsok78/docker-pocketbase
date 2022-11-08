#!/bin/bash

POCKETBASE_FLAGS=()

PB_HOST=${PB_HOST:-0.0.0.0}
PB_PORT=${PB_PORT:-8090}
PB_DATA_DIR="${PB_DATA_DIR:-/opt/pocketbase}"
PB_PUBLIC_DIR="${PB_PUBLIC_DIR:-/var/pocketbase/public}"

test -n "${PB_DEBUG}"           && POCKETBASE_FLAGS+=("--debug")
test -n "${PB_CORS}"            && POCKETBASE_FLAGS+=("--origins=${PB_CORS}")

# Add support for Secret Engine
# https://docs.docker.com/engine/swarm/secrets
# https://kubernetes.io/docs/concepts/configuration/secret/
#
# You can set PB_ENCRYPTION_KEY or PB_ENCRYPTION_KEY_FILE
# Example: PB_ENCRYPTION_KEY=/run/secrets/<secret_name>
if [[ -n "${PB_ENCRYPTION_KEY_FILE}" ]]; then
    test -n "${PB_ENCRYPTION_KEY}" && {
        echo "Both $PB_ENCRYPTION_KEY and $PB_ENCRYPTION_KEY_FILE are set (but are exclusive)"
        exit 1
    }
    PB_ENCRYPTION_KEY="$(< "${PB_ENCRYPTION_KEY_FILE}")"
    unset PB_ENCRYPTION_KEY_FILE
fi

test -n "${PB_ENCRYPTION_KEY}"  && POCKETBASE_FLAGS+=('--encryptionEnv=PB_ENCRYPTION_KEY')

# Print banner and version
cat /var/pocketbase/banner
echo -e "\n $(pocketbase --version)\n"

set -x
pocketbase serve ${POCKETBASE_FLAGS[@]} \
    --dir="${PB_DATA_DIR}" \
    --publicDir="${PB_PUBLIC_DIR}" \
    --http="${PB_HOST}:${PB_PORT}"
