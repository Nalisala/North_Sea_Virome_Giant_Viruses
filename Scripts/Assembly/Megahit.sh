#!/bin/sh
#SBATCH --partition=HMEM1    # default "normal", if not specified
#SBATCH --time=1-00:00:00  # run time in days-hh:mm:ss
#SBATCH --nodes=1    # require 3 nodes
#SBATCH --ntasks-per-node=24 # (by default, "ntasks"="cpus")
#SBATCH --mem-per-cpu=8000  # MB RAM per CPU core (default 4 GB/core)
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out
# The above two lines reflect file locations for standard error and output
# Executable commands :

source ~/.bashrc.conda3
conda activate megahit

cd ~/Projects/NSV_1/working/prinseq++/megahit/
for sample in `cat ../../../data/sample_list`
do
	megahit -o ${sample} -1 ../${sample}_good_out_R1.fastq.gz -2 ../${sample}_good_out_R2.fastq.gz -t 40 -m 0.8
done
conda deactivate

#Change Names

for sample in `cat ../../../data/sample_list`
do
mv ${sample}/final.contigs.fa ${sample}/${sample}_megahit.fa
done
