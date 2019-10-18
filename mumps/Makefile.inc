# Begin orderings
LSCOTCHDIR = $(topdir)/../..
ISCOTCH   = -I/usr/include/scotch
LSCOTCH   = -L$(LSCOTCHDIR) -lesmumps -lscotch -lscotcherr

LPORDDIR = $(topdir)/PORD/lib/
IPORD    = -I$(topdir)/PORD/include/
LPORD    = -L$(LPORDDIR) -lpord

LMETISDIR = $(topdir)/../..
IMETIS    = -I/usr/include/metis
LMETIS    = -L$(LMETISDIR) -lmetis

# Corresponding variables reused later
#ORDERINGSF = -Dmetis -Dpord -Dscotch
ORDERINGSF = -Dpord
ORDERINGSC  = $(ORDERINGSF)

#LORDERINGS = $(LMETIS) $(LPORD) $(LSCOTCH)
LORDERINGS = $(LPORD)
#IORDERINGSF = $(ISCOTCH)
IORDERINGSF =
#IORDERINGSC = $(IMETIS) $(IPORD) $(ISCOTCH)
IORDERINGSC = $(IPORD)
# End orderings
################################################################################

PLAT    =
LIBEXT  = .a
OUTC    = -o
OUTF    = -o
RM = /bin/rm -f
#CC = gcc -fPIC -fno-lto  -static-libgfortran -static-libgcc
#FC = gfortran -fPIC  -static-libgfortran -static-libgcc
#FL = gfortran -fPIC  -static-libgfortran -static-libgcc
CC = gcc -fPIC -fno-lto
FC = gfortran -fPIC
FL = gfortran -fPIC
AR = ar vr
RANLIB = ranlib

LAPACK = -L$(topdir)/../../lib/ -lopenblas

INCSEQ = -I$(topdir)/libseq
LIBSEQ  = $(LAPACK) -L$(topdir)/libseq/ -lmpiseq

LIBBLAS = -L$(topdir)/../../lib/ -lopenblas
LIBOTHERS = -lpthread

#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
#OPTF    = -O -fopenmp
#OPTL    = -O -fopenmp
#OPTC    = -O -fopenmp
OPTF    = -O0 -g
OPTL    = -O0 -g
OPTC    = -O0 -g
#End Optimized options

INCS = $(INCSEQ)
LIBS = $(LIBSEQ)
LIBSEQNEEDED = libseqneeded
