#!/bin/sh

# Replace <ENV-USER-ID>
find 12* -type f -exec sed -i -e "s/<ENV-USER-ID>/$USER_ID/g" {} \;

# Replace <ENV-ANIMAL>
find 12* -type f -exec sed -i -e "s/<ENV-ANIMAL>/$ANIMAL/g" {} \;

# Replace <ENV-IP>
find 12* -type f -exec sed -i -e "s/<ENV-IP>/$HOST_IP/g" {} \;
