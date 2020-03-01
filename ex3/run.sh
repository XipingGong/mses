#!/bin/bash

cd $PWD

# Timing start
date
at=`date +%s`

# programs
# MMTSB was modified !!!
export MMTSBDIR=/home/ping/programs/mmtsb
export PATH=$MMTSBDIR/perl:$MMTSBDIR/bin:$PATH
export CHARMMEXEC=/home/ping/programs/charmm_latest/build/c45by/charmm
export CHARMMDATA=/home/ping/programs/charmm_latest/toppar
AAREX=$MMTSBDIR/perl/aarex.pl

# make host file

# simulation
dyntstep=0.002   # 2 fs/step
dynstep=1000 # 2 ps/exchange
ncycle=500  # 500 -> 1 ns
rexdir=ctrl
$AAREX   -hosts $PWD/hostfile \ # hostfile has two nodes (8 gpus in total)
         -charmmexec $CHARMMEXEC \
         -gpus 8 \  # require 8 gpus
         -n $ncycle \
         -condfile $PWD/conditions \
         -custom setup $PWD/setup.str \
         -dir $rexdir \
         -mdpar dynsteps=$dynstep,dyntstep=$dyntstep \
         -mdpar dynoutfrq=500,dyntrfrq=500 \
         -mdpar lang=1,langfbeta=0.1,nogb,nocut \
         -mdpar param=tpstr \
         -mdpar tpstr=toppar.str \
         -charmmlog charmm.log \
         -log rex.log \
         -par archive,psf=$PWD/aaqaa_hybrid.psf \
         -par natpdb=$PWD/aaqaa_hybrid.pdb \
         $PWD/aaqaa_hybrid.crd


# Timing end
date
bt=`date +%s`
duration1=`echo "($bt-$at)/60"   | bc -l`
duration2=`echo "($bt-$at)/3600" | bc -l`
perf=`echo "$dyntstep*$dynstep*$ncycle/$duration2*24/1000" | bc -l`
echo "Run time is $duration1 minutes (i.e., $duration2 hours)"
echo "Performance is $perf ns/day"



