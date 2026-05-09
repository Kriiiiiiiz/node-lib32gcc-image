#!/bin/bash

cd /home/container || exit 1

node --version
npm --version

# Convert Pterodactyl placeholders like {{VAR}} into regular shell variables.
MODIFIED_STARTUP=$(printf '%s' "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

exec /bin/bash -c "${MODIFIED_STARTUP}"

