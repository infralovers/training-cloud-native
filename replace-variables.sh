#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Replace <ENV-USER-ID>
find "${SCRIPT_DIR}/examples" -type f -exec sed -i -e "s/<ENV-USER-ID>/$USER_ID/g" {} \;

# Replace <ENV-ANIMAL>
find "${SCRIPT_DIR}/examples" -type f -exec sed -i -e "s/<ENV-ANIMAL>/$ANIMAL/g" {} \;

# Replace <ENV-IP>
find "${SCRIPT_DIR}/examples" -type f -exec sed -i -e "s/<ENV-IP>/$HOST_IP/g" {} \;

# Replace <ENV-NAME>
find "${SCRIPT_DIR}/examples" -type f -exec sed -i -e "s/<ENV-NAME>/$ENVIRONMENT/g" {} \;

# Replace <ENV-DOMAIN>
find "${SCRIPT_DIR}/examples" -type f -exec sed -i -e "s/<ENV-DOMAIN>/$DOMAIN/g" {} \;