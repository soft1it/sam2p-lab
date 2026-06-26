#!/bin/bash

set -e

echo "===  sam2p-coverage START ==="

mkdir -p results

if [ ! -f tests/test.bmp ]; then
    echo "ERROR: tests/test.bmp not found"
    exit 1
fi

./sam2p-coverage test.bmp PNG:results/out1.png
echo "test.bmp -> PNG"

./sam2p-coverage test.png JPEG:results/out2.jpg
echo "test.png -> JPEG"

./sam2p-coverage test.jpg TIFF:results/out3.tiff
echo "test.jpg -> TIFF"

./sam2p-coverage test.pnm BMP:results/out4.bmp
echo "test.pnm -> BMP"

echo ""
echo "=== sam2p-coverage DONE  ==="
ls -la results/
