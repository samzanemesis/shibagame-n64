#!/bin/bash

cd "$(dirname "$0")"

docker build -t n64sdk https://github.com/CrashOveride95/n64sdkmod.git
docker run --name n64sdk-instance -e N64_LIBGCCDIR="/usr/local/n64chain/lib/gcc/mips64-elf/10.2.0" -v "$(pwd)":/opt/src -i -t n64sdk bash
docker rm n64sdk-instance