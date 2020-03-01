#!/bin/bash

# generate the scal and temperature values for the condition file
# usage 
# scal: ./gencond.sh 8 1 2
#       then scal values are each generated value - 1.0
# temp: ./gencond.sh 8 270 400

if [ $# -ne 3 ]; then
   echo "usage: ./gencond.sh nrep tmin tmax"
   exit
fi

nrep=$1
tmin=$2
tmax=$3

list=$(
awk -v n=$nrep \
    -v tmin=$tmin \
    -v tmax=$tmax \
  'BEGIN{for(i=0;i<n;i++){
    t=tmin*exp(i*log(tmax/tmin)/(n-1));
    printf(t); if(i<n-1)printf(" ");
  }
}'
)

echo $list
