#!/bin/sh
#SBATCH --partition=HMEM1    # default "normal", if not specified
#SBATCH --time=3-00:00:00  # run time in days-hh:mm:ss
#SBATCH --nodes=1    # require 3 nodes
#SBATCH --ntasks-per-node=80  # (by default, "ntasks"="cpus")
#SBATCH --mem-per-cpu=8000  # MB RAM per CPU core (default 4 GB/core)
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out


source ~/.bashrc.conda3
conda activate genomad

cd ~/Projects/NSV_1/working/prinseq++/genomad/

for sample in `cat ../../../data/sample_list`
do
genomad end-to-end --cleanup --splits 8 ../megahit/${sample}/${sample}_megahit.fa genomad_output $HOME/viral_tools/genomad/genomad_db

done

conda deactivate
