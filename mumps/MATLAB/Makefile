MUMPS_DIR = $(PWD)/..

INCMUMPS = -I$(MUMPS_DIR)/include
LIBMUMPS = -L$(MUMPS_DIR)/lib -l$(ARITH)mumps -lmumps_common -L$(MUMPS_DIR)/libseq -lmpiseq -lpord
LIBFORT = -lgfortran
LIBBLAS = -L$(MUMPS_DIR)/../../lib -lopenblas
LIBSCOTCH = -L$(MUMPS_DIR)/../../lib -lesmumps -lscotch -lscotcherr
LIBMETIS = -L$(MUMPS_DIR)/../../lib -lmetis

INC = $(INCMUMPS)
LIB = $(LIBMUMPS) $(LIBFORT) $(LIBBLAS) $(LIBSCOTCH) $(LIBMETIS)

MEX = mex -largeArrayDims
OPTC = -O CFLAGS='$$CFLAGS -fopenmp' LDFLAGS='$$LDFLAGS -fopenmp'

all:	d z

d:
	$(MAKE) ARITH=d dmumpsmex.stamp
z:
	$(MAKE) ARITH=z zmumpsmex.stamp

clean:
	rm -f dmumpsmex.* zmumpsmex*

$(ARITH)mumpsmex.stamp: mumpsmex.c
	cp -f mumpsmex.c $(ARITH)mumpsmex.c
	$(MEX) $(OPTC) $(ARITH)mumpsmex.c -DMUMPS_ARITH=MUMPS_ARITH_$(ARITH) $(INC) $(LIB)
	rm -f $(ARITH)mumpsmex.c
	touch $@
