#!/bin/bash

set -e

make clean || true

echo "Configure"
./configure --enable-lzw --disable-gif || true

echo "Release build"
make MY_CFLAGS="-O2 -g" && strip sam2p
cp sam2p sam2p-release

echo "Debug build"
make clean
make MY_CFLAGS="-g -O0"
cp sam2p sam2p-debug

echo "Instrumented build"
make clean
make ps_tiny CC=gcc CXX=g++ MY_CFLAGS=""
make USE_ASAN=1 \
CC=afl-clang-fast \
CXX=afl-clang-fast++ \
MY_CFLAGS="-g"
cp sam2p sam2p-instrumented

echo "Coverage build"
make clean
make ps_tiny CC=gcc CXX=g++ MY_CFLAGS=""
make MY_CFLAGS="-g -O0 --coverage" \
    LDFLAGS="--coverage"
cp sam2p sam2p-coverage


echo ""
echo "=== builds DONE ==="
ls -la sam2p-*
