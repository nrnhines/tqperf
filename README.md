From https://senselab.med.yale.edu/ModelDB/showmodel.cshtml?model=137845

Modified for performance testing of CoreNEURON.

```
# be sure use a version of NEURON with a CoreNEURON compatible hh.mod
nrnivmodl mod

# 2^12 cells, 1000 connections per cell
mpiexec -n 4 nrniv run.hoc -mpi  # change ncellpow and second arg to mkmodel

# or with specific stop time as
mpiexec -n 4 nrniv -c tstop=50 run.hoc -mpi

# prepare coreneuron
nrnivmodl-core mod
mpiexec -n 4 ./x86_64/special-core -e 50 -d coredat/ --mpi --multisend
```


Original README
----------
Generates figures 3-9 of
Hines M, Kumar S, Schuermann F (2011).
Comparison of neuronal spike exchange methods on a Blue Gene/P supercomputer.
Frontiers in Computational Neuroscience.

See http://www.neuron.yale.edu/hg/z/neuron/nrnbgp/ for the NEURON version
actually used to carry out the simulation on the Blue Gene/P.
Figures 3 and 9 require this version as the hoc code uses several features
not yet available in the standard versions. The relevant statements are:
init.hoc: {pc.timeout(1)}
net.hoc: pc.gid_clear(4)
param.hoc and perfrun.hoc: any use of pc.send_time(x) with x > 4

The DCMF_Multicast methods used in the paper are specific to the Blue Gene/P.
However the MPI multisend implementation can be used on any MPI installed
system. In particular the two-phase exchange method may be useful.
The exchange methods are implemented mostly in src/nrniv/bgpdma.cpp .

