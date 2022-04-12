#!/bin/bash
set -x
module load rocm/4.5.0
amdflang -fopenmp -fopenmp-targets=amdgcn-amd-amdhsa -Xopenmp-target=amdgcn-amd-amdhsa -march=gfx908 -L /opt/cray/pe/mpich/8.1.11/ofi/amd/4.4/lib/ -lmpifort_amd hasgpu.f90
ldd a.out | grep rocm
LD_LIBRARY_PATH=/opt/rocm-4.5.0/llvm/lib ldd /opt/cray/pe/mpich/8.1.11/ofi/amd/4.4/lib/libmpifort_amd.so | grep rocm


