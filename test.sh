#!/bin/bash

mkdir /mnt/physics
docker run -d --net=host -it -e NGROK_AUTHTOKEN=2eTzTtisRPj4pnUlPB0p8kGKdMR_5QHLfQkLt8qeaTwFDRnRP ngrok/ngrok:latest http --region ap 8006
docker run -d -it --rm -p 8006:8006 -p 3389:3389 --device=/dev/kvm \
  -e VERSION='win10' -e RAM_SIZE='8G' -e CPU_CORES='2' \
  -v /mnt/physics:/storage --cap-add NET_ADMIN --stop-timeout 120 dockurr/windows
echo "Success!"
