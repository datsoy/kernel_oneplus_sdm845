
#!/bin/bash

echo
echo "Clean Build Directory"
echo 

make clean && make mrproper
rm -rf out

echo
echo "Create Working Directory"
echo

mkdir -p out

echo
echo "Set DEFCONFIG"
echo 
make O=out omega_defconfig
export PATH="/home/datsoy/android/xcompiler/tc-build/install/bin:${PATH}"
export LD_LIBRARY_PATH="/home/datsoy/android/xcompiler/tc-build/install/lib:$LD_LIBRARY_PATH"

echo
echo "Build The Kernel"
echo 

time make -j$(nproc --all) O=out \
                      CC=clang \
                      CROSS_COMPILE=aarch64-linux-gnu-
