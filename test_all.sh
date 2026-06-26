#!/bin/bash

echo "=== Проверка релизной версии ==="
./sam2p-release --help || echo "FAIL: release"
echo ""

echo "=== Проверка отладочной версии ==="
./sam2p-debug --help || echo "FAIL: debug"
echo ""

echo "=== Проверка инструментированной версии ==="
./sam2p-instrumented --help || echo "FAIL: instrumented"
echo ""

echo "=== Проверка ASan в инструментированной версии ==="
ASAN_OPTIONS=verbosity=1 ./sam2p-instrumented --help 2>&1 | grep -q "AddressSanitizer" && echo "ASan активен" || echo "ASan не активен"
echo ""

echo "=== Размеры файлов ==="
ls -lh sam2p-*
echo ""

echo "=== Типы файлов ==="
file sam2p-*
