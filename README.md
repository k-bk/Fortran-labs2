# Fortran-labs2
2nd assignment for Fortran classes

## Compilation
Compilation is done using gfortran with pFunit.
pFunit needs few env variables specified:
```
F90_VENDOR=GNU
F90=gfortran
PFUNIT= path to pfunit e.g. /opt/pfunit/pfunit-serial
```

To compile, type:
```
$ make clean
$ make
```

## Running
Test suite should run automatically. It is also possible to run it from test.x
