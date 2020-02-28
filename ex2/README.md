============================================

Author: Xiping Gong, PhD student, UMass Amherst

Email: xipinggong@umass.edu

Date: 01/29/2020 (Xiping; first version)
Date: 02/28/2020 (Xiping; second version)

============================================

# Example 2: CUDA NVE molecular dynamics for GBMV2/SA-MSES simulation

## Executable CHARMM (included GBMV2/SA)

Before running the following the examples, please install the CHARMM with MSES plugin (version > c45). Also, please run a test file included to make sure your installation is correct.

## Running CHARMM input file

CHARMM='the path of an executable CHARMM program'

E.g., CHARMM='/home/ping/share/charmm/build/c42vby/charmm'

> $CHARMM -i msesgbmv.inp | tee msesgbmv.out

## Analysis of output files

    Energy conservation (CUDA)

> grep "DYNA>" msesgbmv.out

> This is 2ps NVE simulations, please increase the simulation time to 300 ps to see what happened. Suggestion: before running the system, please make sure you do a NVE test, because
> energy conservation can make sure the energy and forces calculations are consistent.

# Reference

