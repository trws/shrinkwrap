#!/bin/bash
module load rocm/4.5.0
hipcc /opt/rocm-4.5.0/hip/samples/2_Cookbook/18_cmake_hip_device/square.cpp -Wl,-disable-new-dtags
ldd a.out | grep rocm
readelf -a ./a.out | grep PATH
module load rocm/4.3.1   # Breaks when different environment used to run 4.5.0 built executable
ldd a.out | grep rocm
./a.out
