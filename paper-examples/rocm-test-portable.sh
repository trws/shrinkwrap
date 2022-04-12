#!/bin/bash
# module load rocm/4.5.0
export PATH="/opt/rocm-4.5.0/bin:/opt/rocm-4.5.0/llvm/bin:/opt/rocm-4.5.0/opencl/bin:$PATH"
export LD_LIBRARY_PATH="/opt/rocm-4.5.0/lib:/opt/rocm-4.5.0/hip/lib:/opt/rocm-4.5.0/hsa/lib:/opt/rocm-4.5.0/lib64:$LD_LIBRARY_PATH"
export MANPATH="/opt/rocm-4.5.0/share/man:$MANPATH"
export CMAKE_PREFIX_PATH="/opt/rocm-4.5.0:$CMAKE_PREFIX_PATH"
export ROCM_PATH="/opt/rocm-4.5.0"
export HIP_PATH="/opt/rocm-4.5.0/hip"
hipcc /opt/rocm-4.5.0/hip/samples/2_Cookbook/18_cmake_hip_device/square.cpp -Wl,-disable-new-dtags
ldd a.out | grep rocm
readelf -a ./a.out | grep PATH
# module load rocm/4.3.1   # Breaks when different environment used to run 4.5.0 built executable
export PATH="/opt/rocm-4.3.1/bin:/opt/rocm-4.3.1/llvm/bin:/opt/rocm-4.3.1/opencl/bin:$PATH"
export LD_LIBRARY_PATH="/opt/rocm-4.3.1/lib:/opt/rocm-4.3.1/hip/lib:/opt/rocm-4.3.1/hsa/lib:/opt/rocm-4.3.1/lib64:$LD_LIBRARY_PATH"
export MANPATH="/opt/rocm-4.3.1/share/man:$MANPATH"
export CMAKE_PREFIX_PATH="/opt/rocm-4.3.1:$CMAKE_PREFIX_PATH"
export ROCM_PATH="/opt/rocm-4.3.1"
export HIP_PATH="/opt/rocm-4.3.1/hip"
ldd a.out | grep rocm
./a.out
