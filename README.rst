============================================
Recipe to build MUMPS for Matlab from source
============================================

TODO
====

* Add performance tests
* Add threading/OpenMP tests (including MUMPS's BLR)
* Write OO wrapper for MUMPS (with automatic lifetime management)


Quick install guide
===================

::

    ./make_openblas.sh
    ./make_scotch.sh
    ./make_metis.sh
    ./make_mumps.sh

Then use by::

    export MATLABPATH="${PWD}/lib/matlab:${MATLABPATH}"
    matlab

    >> id = initmumps();
    >> id.SYM = 0;
    >> id = dmumps(id);
    >> ...


Usage of Matlab/MUMPS
=====================

See `MUMPS User Guide, section 10 <https://web.archive.org/web/20200926104305id_/mumps.enseeiht.fr/doc/userguide_5.3.3.pdf#section.10>`_.


Dependencies
============

Combinations known to work:

* Matlab R2019a, GCC 7.4.0 (Ubuntu 18.04), OpenBLAS 0.3.7, MUMPS 5.2.1
* Matlab R2019a, GCC 5.4.0 (Ubuntu 16.04), OpenBLAS 0.3.7, MUMPS 5.2.1
* Matlab R2020a, GCC 9.3.0 (Ubuntu 20.04), OpenBLAS 0.3.10, MUMPS 5.3.3


Testing
=======

There is obviously no public CI because Matlab
license do not allow to do that. So you have to believe me
that this works.


License
=======

BSD 2-clause. Note that this license only applies to
the recipes in this repository and in no way applies to
source codes and binaries downloaded, built, linked,
and installed by these recipes.


Authors
=======

`Jan Blechta <https://www-user.tu-chemnitz.de/~blej/>`_
