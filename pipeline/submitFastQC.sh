#!/bin/bash -l

## vars
proj=u2017006
mail="sjoelander.j@gmail.com"

## create the args
in=/mnt/picea/projects/arabidopsis/htuominen/chip-seq-prn2-hub2/raw
out=/mnt/picea/projects/arabidopsis/htuominen/chip-seq-prn2-hub2/fastqc

if [ ! -d $out ]; then
  mkdir -p $out
fi

for file in $(find $in -name "*.fq.gz"); do 
  fnam=$(basename $file)
  fnam=${fnam//.f*q.gz/}
  sbatch -A $proj --mail-user $mail -e $out/${fnam}.err -o $out/$fnam.out \
  -J FastQC-$fnam $UPSCb/pipeline/runFastQC.sh $out $file
done