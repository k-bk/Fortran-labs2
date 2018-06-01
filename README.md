# Fortran-labs2
2nd assignment for Fortran classes

## Result


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
To compile using different version of algorithm, use:
```
$ make VER=1
```
Where 1 is version (normal, dot_product, cache, both)
To test speed of the algorithm, type:
```
$ cd src
$ make graphs VER=1 SIZE=1024
```

## Running
Test suite should run automatically. It is also possible to run it from test.x
There is also time testing bash script /src/run_graph.sh
