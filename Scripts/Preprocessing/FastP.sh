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
conda activate fastp

cd /export/lv6/user/hshaikh/Projects/NSV_1/working/fastp/fastp_dedup_6/

for sample in `cat ../../../data/sample_list`
do

fastp -i ../../../data/${sample}_R1.fastq.gz -I ../../../data/${sample}_R2.fastq.gz -o ${sample}_R1_paired.fastq.gz -O ${sample}_R2_paired.fastq.gz --unpaired1 ${sample}_R1_unpaired.fastq.gz --unpaired2 ${sample}_R2_unpaired.fastq.gz --compression 4 --dedup 6 --dont_overwrite --verbose --detect_adapter_for_pe --trim_front1 10 --trim_front2 15 --trim_tail1 1 --trim_tail2 1 --cut_right --cut_right_mean_quality 22 --length_required 50 --correction --overrepresentation_analysis --html ${sample}.html --json ${sample}.json --report_title '${sample} fastp report'

done

conda deactivate
