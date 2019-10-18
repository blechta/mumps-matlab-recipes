#!/bin/bash
set -e

# Default values
: ${OPENBLAS_VERSION:=0.3.7}
: ${PREFIX:="${PWD}"}

# Download and unpack
mkdir -p src && cd src
wget -c -O OpenBLAS-${OPENBLAS_VERSION}.tar.gz https://github.com/xianyi/OpenBLAS/archive/v${OPENBLAS_VERSION}.tar.gz
tar -xzf OpenBLAS-${OPENBLAS_VERSION}.tar.gz
cd OpenBLAS-${OPENBLAS_VERSION}

# Build
# NO_LAPACKE=1 NO_CBLAS=1 are broken in 0.3.7: https://github.com/xianyi/OpenBLAS/issues/2215
#make INTERFACE64=0 NO_LAPACKE=1 NO_CBLAS=1 NO_SHARED=1 USE_OPENMP=0 USE_THREAD=0
make INTERFACE64=0 NO_LAPACKE=0 NO_CBLAS=0 NO_SHARED=1 USE_OPENMP=0 USE_THREAD=0

# Install
mkdir -p "${PREFIX}/lib"
cp libopenblas.a "${PREFIX}/lib"
