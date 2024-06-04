#!/bin/sh
#SBATCH --partition=HMEM1    # default "normal", if not specified
#SBATCH --time=0-10:30:00  # run time in days-hh:mm:ss
#SBATCH --nodes=1    # require 3 nodes
#SBATCH --ntasks-per-node=36  # (by default, "ntasks"="cpus")
#SBATCH --mem-per-cpu=4000  # MB RAM per CPU core (default 4 GB/core)
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out
# The above two lines reflect file locations for standard error and output
# Executable commands :

source ~/.bashrc.conda3
conda activate prinseq-plus-plus

cd ../working/prinseq++/

for sample in `cat ../../data/sample_list`
do

prinseq++ -fastq ../fastp/${sample}_R1_paired.fastq.gz -fastq2 ../fastp/${sample}_R2_paired.fastq.gz -threads 36 -out_name ${sample}  -out_gz -derep
done

conda deactivate

conda activate fastqc

mkdir fastqc
cd ./fastqc

fastqc ../*R1* ../*R2* 

conda deactivate


conda activate multiqc

mkdir multiqc
cd ./multiqc

multiqc ../../.

conda deactivate
