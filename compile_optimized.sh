#!/bin/bash

# Optimized compilation script for SIGHP
# This script uses aggressive compiler optimizations while maintaining compatibility

# Compiler settings
CXX=g++
TARGET=sighp_optimized
SOURCE_DIR=src
SOURCES="$SOURCE_DIR/SIGHP.cpp"

# Base optimization flags
BASE_FLAGS="-std=c++17 -O3 -DNDEBUG"

# Architecture-specific optimizations
ARCH_FLAGS="-march=native -mtune=native"

# Advanced optimization flags
OPT_FLAGS="-flto -ffast-math -funroll-loops -fprefetch-loop-arrays"
OPT_FLAGS="$OPT_FLAGS -fomit-frame-pointer -finline-functions"
OPT_FLAGS="$OPT_FLAGS -ftree-vectorize -floop-nest-optimize"

# Memory and cache optimizations
MEMORY_FLAGS="-falign-functions=32 -falign-loops=32"

# Link-time optimizations
LINK_FLAGS="-flto -Wl,-O2 -Wl,--gc-sections"

# Debug information (can be removed for production)
# DEBUG_FLAGS="-g -fno-omit-frame-pointer"

# Warning flags (recommended but not affecting performance)
WARNING_FLAGS="-Wall -Wextra -Wno-unused-parameter"

# Combine all flags
ALL_FLAGS="$BASE_FLAGS $ARCH_FLAGS $OPT_FLAGS $MEMORY_FLAGS $WARNING_FLAGS"

echo "Compiling with optimization flags:"
echo "$ALL_FLAGS"
echo ""

# Compile
$CXX $ALL_FLAGS $SOURCES -o $TARGET $LINK_FLAGS

if [ $? -eq 0 ]; then
    echo "✅ Compilation successful!"
    echo "Executable: $TARGET"
    
    # Show file size
    ls -lh $TARGET
    
    echo ""
    echo "🚀 Performance optimizations applied:"
    echo "  • -O3: Maximum optimization level"
    echo "  • -march=native: Target current CPU architecture"
    echo "  • -flto: Link-time optimization"
    echo "  • -ffast-math: Fast floating-point math"
    echo "  • -funroll-loops: Loop unrolling"
    echo "  • -ftree-vectorize: Auto-vectorization"
    echo "  • Memory alignment optimizations"
    echo ""
    echo "Usage: ./$TARGET [options]"
    
else
    echo "❌ Compilation failed!"
    exit 1
fi 