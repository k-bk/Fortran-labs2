.PHONY: clean
ifneq ($(BASEMK_INCLUDED),YES)
include $(PFUNIT)/include/base.mk
endif

SUT: mulMatrix$(OBJ_EXT)


%$(OBJ_EXT): %.F90
	$(FC) -c $(FFLAGS) $(FPPFLAGS) $<

graphs: clean graphs.F90 mulMatrix.F90
	$(FC) -o mulMatrix.mod -c mulMatrix.F90 -ffree-form -std=f2008 -cpp -fimplicit-none -O2 -DVER=$(VER)
	$(FC) -o graphs.mod -c graphs.F90 -ffree-form -std=f2008 -cpp -fimplicit-none -O2 -DSIZE=$(SIZE)
	$(FC) -o graphs -ffree-form -std=f2008 -cpp -fimplicit-none -O2 graphs.mod mulMatrix.mod -DSIZE=$(SIZE)

clean: local-E1-clean

local-E1-clean:
	$(RM) *$(OBJ_EXT) *.mod graphs

