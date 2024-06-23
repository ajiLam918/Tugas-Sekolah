#!/bin/bash


docker run -d --net=host -it -e NGROK_AUTHTOKEN=2eTzTtisRPj4pnUlPB0p8kGKdMR_5QHLfQkLt8qeaTwFDRnRP ngrok/ngrok:latest tcp --region ap 3389
docker run -d -it --rm -p 8006:8006 -p 3389:3389 --device=/dev/kvm \
  -e VERSION='win10' -e RAM_SIZE='32G' -e CPU_CORES='16' \
  --cap-add NET_ADMIN --stop-timeout 120 dockurr/windows
echo "Success!"
