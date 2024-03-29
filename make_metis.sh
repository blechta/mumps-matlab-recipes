#!/bin/bash
set -e

# Default values
: ${METIS_VERSION:=5.1.0}
: ${METIS_WAYBACK_MACHINE_TIMESTAMP:=20170712055800}
: ${PREFIX:="${PWD}"}
: ${PROCS:=1}

# Download and unpack
mkdir -p src && cd src
wget -c -O metis-${METIS_VERSION}.tar.gz https://web.archive.org/web/${METIS_WAYBACK_MACHINE_TIMESTAMP}id_/glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-${METIS_VERSION}.tar.gz
tar -xzf metis-${METIS_VERSION}.tar.gz
cd metis-${METIS_VERSION}

# Build METIS static lib
make config
make -j${PROCS}

# Install
mkdir -p "${PREFIX}/lib" "${PREFIX}/include"
cp build/Linux-x86_64/libmetis/libmetis.a "${PREFIX}/lib"
cp include/metis.h "${PREFIX}/include"
