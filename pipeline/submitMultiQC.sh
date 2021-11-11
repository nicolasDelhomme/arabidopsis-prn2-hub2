#!/bin/bash -l

set -ex

proj=u2017006
mail="sjoelander.j@gmail.com"
in=/mnt/picea/projects/arabidopsis/htuominen/chip-seq-prn2-hub2/fastqc
out=/mnt/picea/projects/arabidopsis/htuominen/chip-seq-prn2-hub2/multiqc

if [ ! -d $out ]; then
	mkdir -p $out
fi

module load bioinfo-tools multiqc

sbatch --mail-user=$mail -o $in/multiqc.out -e $in/multiqc.err -A $proj $UPSCb/pipeline/runMultiQC.sh $in $out