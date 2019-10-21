#!/bin/bash
set -e

# Default values
: ${SCOTCH_VERSION:=6.0.8}
: ${PREFIX:="${PWD}"}
: ${PROCS:=1}

# Download and unpack
mkdir -p src && cd src
wget -c -O scotch_${SCOTCH_VERSION}.tar.gz https://gforge.inria.fr/frs/download.php/latestfile/298/scotch_${SCOTCH_VERSION}.tar.gz
tar -xzf scotch_${SCOTCH_VERSION}.tar.gz
cd scotch_${SCOTCH_VERSION}/src

# Build SCOTCH static lib
cp ../../../scotch/Makefile.inc .
make -j${PROCS} esmumps

# Install
mkdir -p "${PREFIX}/lib" "${PREFIX}/include"
cp esmumps/libesmumps.a libscotch/libscotch.a libscotch/libscotcherr.a "${PREFIX}/lib"
cp ../include/scotchf.h  ../include/scotch.h "${PREFIX}/include"
