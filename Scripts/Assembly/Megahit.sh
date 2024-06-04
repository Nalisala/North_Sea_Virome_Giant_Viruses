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

#or

#single Pair End megahit assembly

megahit -1 15_R1_paired.fastq.gz -2 15_R2_paired.fastq.gz -o /data/gent/vo/001/gvo00125/vsc45617/5.assembly/ns_goes_viral/megahit

# submitting to HPC script for 4 Pair End fasta files
# create non existing directory for output

   #!/bin/bash 
    #PBS -N megahit                                
    #PBS -l nodes=4:ppn=16                                   
    #PBS -l walltime=10:00:00                             
    #PBS -l vmem=50gb                                      
    module load MEGAHIT/1.2.9-GCCcore-10.2.0-Python-2.7.18    
    cd ./4.trim/ns_goes_viral megahit -1 15_R1_paired.fastq.gz,18_R1_paired.fastq.gz,20_R1_paired.fastq.gz,24_R1_paired.fastq.gz -2 15_R2_paired.fastq.gz,18_R2_paired.fastq.gz,20_R2_paired.fastq.gz,24_R2_paired.fastq.gz -o ./vsc45617/5.assembly/ns_goes_viral/megahit



