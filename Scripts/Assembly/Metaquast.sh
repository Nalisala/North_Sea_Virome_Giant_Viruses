#!/bin/sh
#SBATCH --partition=HMEM1    # default "normal", if not specified
#SBATCH --time=3-00:00:00  # run time in days-hh:mm:ss
#SBATCH --nodes=1    # require 3 nodes
#SBATCH --ntasks-per-node=80  # (by default, "ntasks"="cpus")
#SBATCH --mem-per-cpu=8000  # MB RAM per CPU core (default 4 GB/core)
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out

source ~/.bashrc.conda3
module load QUAST/5.0.2-foss-2020a-Python-3.8.2
conda activate metaquast

cd ~/Projects/NSV_1/working/metaquast/prinseq++/megahit/metaquast

metaquast.py ../*/*megahit.fa -o ./metaquast_together --max-ref-number 0

conda deactivate

#Compile all of the reports in one folder
#for sample in `cat ~/Projects/NSV_1/data/sample_list`
#do
#mkdir metaquast_reports
#cp ${sample}/report.html ./metaquast_reports/${sample}_metaquast_report.html
#cp ${sample}/report.tsv ./metaquast_reports/${sample}_metaquast_report.tsv
#done
