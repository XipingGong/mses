============================================

Author: Xiping Gong, PhD student, UMass Amherst

Email: xipinggong@umass.edu

Date: 01/29/2020 (Xiping; first version)
Date: 02/28/2020 (Xiping; second version)

============================================

# Example 1: CPU/CUDA Energies, forces and molecular dynamics for MSES simulation

## Executable CHARMM (included GBMV2/SA)

Before running the following the examples, please install the CHARMM with MSES plugin (version > c45). Also, please run a test file included to make sure your installation is correct.

## Running CHARMM input file

CHARMM='the path of an executable CHARMM program'

E.g., CHARMM='/home/ping/share/charmm/build/c42vby/charmm'

> $CHARMM -i mses.inp | tee mses.out

## Analysis of output files

    Energies (CPU vs. GPU)

> grep "ENER>" mses.out

> Please see the difference

    Forces (CPU vs. GPU)

> awk '{printf "%f %f %f\n", $6,$7,$8}' testenerforcecpu.dat | head -5

> awk '{printf "%f %f %f\n", $6,$7,$8}' testenerforcegpu.dat | head -5

> awk '{printf "%f %f %f\n", $6,$7,$8}' testdynaforcecpu.dat | head -5

> awk '{printf "%f %f %f\n", $6,$7,$8}' testdynaforcegpu.dat | head -5

> Please look at the min and max (CPU-GPU). In theory, the max value should be closer to zero, but some errors happened.

    Energy conservation (CPU vs. GPU)

> grep "DYNA>" mses.out

> This is 1ps NVE simulations, please increase the simulation time to 300 ps to see any difference between cpu
> and gpu. Also, one additional case can be explored. Set the timestep = 2fs, do the same simulations and look at the difference.

# Reference

