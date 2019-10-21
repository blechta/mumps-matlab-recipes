# Begin orderings
ISCOTCHDIR = $(topdir)/../../include
LSCOTCHDIR = $(topdir)/../../lib
ISCOTCH   = -I$(ISCOTCHDIR)
LSCOTCH   = -L$(LSCOTCHDIR) -lesmumps -lscotch -lscotcherr

LPORDDIR = $(topdir)/PORD/lib/
IPORD    = -I$(topdir)/PORD/include/
LPORD    = -L$(LPORDDIR) -lpord

IMETISDIR = $(topdir)/../../include
LMETISDIR = $(topdir)/../../lib
IMETIS    = -I$(IMETISDIR)
LMETIS    = -L$(LMETISDIR) -lmetis

# Corresponding variables reused later
ORDERINGSF = -Dmetis -Dpord -Dscotch
ORDERINGSC  = $(ORDERINGSF)

LORDERINGS = $(LMETIS) $(LPORD) $(LSCOTCH)
IORDERINGSF = $(ISCOTCH)
IORDERINGSC = $(IMETIS) $(IPORD) $(ISCOTCH)
# End orderings
################################################################################

PLAT    =
LIBEXT  = .a
OUTC    = -o
OUTF    = -o
RM = /bin/rm -f
CC = gcc -fPIC
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
#OPTF    = -O3 -fopenmp
#OPTL    = -O3 -fopenmp
#OPTC    = -O3 -fopenmp
OPTF    = -O3
OPTL    = -O3
OPTC    = -O3
#End Optimized options

INCS = $(INCSEQ)
LIBS = $(LIBSEQ)
LIBSEQNEEDED = libseqneeded
