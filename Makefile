.PHONY: tests clean all
.DEFAULT_GOAL = tests

TOP_DIR := $(shell pwd)
SRC_DIR=$(TOP_DIR)/src
TEST_DIR=$(TOP_DIR)/tests

VPATH = . $(SRC_DIR) $(TEST_DIR)

include /opt/pfunit/pfunit-serial/include/base.mk

# The following may be redundant since FC should already be
# appropriately set in include/base.mk.
ifeq ($(USEMPI),YES)
   FC=mpif90
endif

EXE = tests$(EXE_EXT)
LIBS = -L$(PFUNIT)/lib -lpfunit

all: $(EXE)

ifeq ($(USEMPI),YES)
	mpirun -np 1 ./$(EXE)
else
	./$(EXE)
endif

SUT:
	make -C $(SRC_DIR) SUT
	make -C $(TEST_DIR) tests

tests: all

$(EXE): testSuites.inc mulMatrix.F90 SUT
	$(FC) -o $@ -I$(PFUNIT)/mod -I$(PFUNIT)/include -Itests $(PFUNIT)/include/driver.F90 $(TEST_DIR)/*$(OBJ_EXT) $(SRC_DIR)/*$(OBJ_EXT) $(LIBS) $(FFLAGS) $(FPPFLAGS)

distclean: clean

clean: local-E0-clean

local-E0-clean:
	make -C $(SRC_DIR) clean
	make -C $(TEST_DIR) clean
	rm -f $(EXE) *$(OBJ_EXT)

export FC
export FPPFLAGS
export FFLAGS
export SRC_DIR
export TEST_DIR
export OBJ_EXT
export LIB_EXT
export EXE_EXT
