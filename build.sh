#!/bin/bash

set -e

echo "Cleaning"

make clean || true

echo "Configure"
./configure --enable-lzw || true

echo "Release build"

make CFLAGS="-O2"

cp sam2p sam2p-release

echo "Debug build"

make clean

make CFLAGS="-g -O0"

cp sam2p sam2p-debug

echo "Instrumented build"

make clean

CC=afl-clang-fast \
CXX=afl-clang-fast++ \
CFLAGS="-fsanitize=address -g" \
make

cp sam2p sam2p-instrumented
