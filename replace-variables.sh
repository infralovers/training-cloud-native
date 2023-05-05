#!/bin/sh

# Replace <ENV-USER-ID>
find examples* -type f -exec sed -i -e "s/<ENV-USER-ID>/$USER_ID/g" {} \;

# Replace <ENV-ANIMAL>
find examples* -type f -exec sed -i -e "s/<ENV-ANIMAL>/$ANIMAL/g" {} \;

# Replace <ENV-IP>
find examples* -type f -exec sed -i -e "s/<ENV-IP>/$HOST_IP/g" {} \;

# Replace <ENV-NAME>
find examples* -type f -exec sed -i -e "s/<ENV-NAME>/$ENVIRONMENT/g" {} \;

# Replace <ENV-DOMAIN>
find examples* -type f -exec sed -i -e "s/<ENV-DOMAIN>/$DOMAIN/g" {} \;