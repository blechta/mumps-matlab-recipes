#!/bin/bash
set -e

# Default values
: ${MUMPS_VERSION:=5.3.3}
: ${PREFIX:="${PWD}"}
: ${PROCS:=1}

# Download and unpack
mkdir -p src && cd src
wget -c -O MUMPS_${MUMPS_VERSION}.tar.gz https://graal.ens-lyon.fr/MUMPS/MUMPS_${MUMPS_VERSION}.tar.gz
tar -xzf MUMPS_${MUMPS_VERSION}.tar.gz
cd MUMPS_${MUMPS_VERSION}

# Build MUMPS static lib
cp ../../mumps/Makefile.inc .
make -j${PROCS} dexamples zexamples

# Test
cd examples
cp ../../../mumps/examples/check_test .
./dsimpletest < input_simpletest_real | ./check_test
./zsimpletest < input_simpletest_cmplx | ./check_test
cd ..

# Build MATLAB mex
cd MATLAB
cp Makefile Makefile.bak
cp ../../../mumps/MATLAB/Makefile .
make

# Install
mkdir -p "${PREFIX}/lib/matlab"
cp *.m *.mex* *.mat "${PREFIX}/lib/matlab"

# Test MATLAB
cd /tmp
MATLABPATH="${PREFIX}/lib/matlab:${MATLABPATH}" matlab -nojvm -batch 'simple_example; zsimple_example; schur_example; diagainv_example; multiplerhs_example; sparserhs_example; polyfit(1:10, sin(1:10), 2)'
