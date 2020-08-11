#!/bin/bash
set -e

# Default values
: ${OPENBLAS_VERSION:=0.3.10}
: ${PREFIX:="${PWD}"}

# Download and unpack
mkdir -p src && cd src
wget -c -O OpenBLAS-${OPENBLAS_VERSION}.tar.gz https://github.com/xianyi/OpenBLAS/archive/v${OPENBLAS_VERSION}.tar.gz
tar -xzf OpenBLAS-${OPENBLAS_VERSION}.tar.gz
cd OpenBLAS-${OPENBLAS_VERSION}

# Build
make INTERFACE64=0 NO_LAPACKE=1 NO_CBLAS=1 NO_SHARED=1 USE_OPENMP=1 NUM_PARALLEL=$(nproc)

# Install
mkdir -p "${PREFIX}/lib"
cp libopenblas.a "${PREFIX}/lib"
