#!/bin/bash

set -e

echo "===  sam2p-instrumented START ==="

mkdir -p results

./sam2p-coverage test.bmp PNG:results/out1.png
echo "test.bmp -> PNG"

./sam2p-coverage test.png JPEG:results/out2.jpg
echo "test.png -> JPEG"

./sam2p-coverage test.jpg TIFF:results/out3.tiff
echo "test.jpg -> TIFF"

./sam2p-coverage test.ppm BMP:results/out4.bmp
echo "test.pnm -> BMP"

echo ""
echo "=== sam2p-instrumented DONE  ==="
ls -la results/
