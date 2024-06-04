#!/bin/bash 
		`#PBS -N trimmomatic_nsgv
		`#PBS -l nodes=4:ppn=16
		`#PBS -l walltime=2:00:00
		`#PBS -l vmem=50gb                                              
  
  module load Trimmomatic/0.39-Java-11
	
 cd /data/gent/vo/001/gvo00125/vsc45617/1.raw_data/ns_goes_viral
for sample in `cat sample_list`                                         
do java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -threads 4 ${sample}_R1.fastq.gz ${sample}_R2.fastq.gz ./vsc45617/4.trim/ns_goes_viral/${sample}_R1_paired.fastq.gz ./vsc45617/4.trim/ns_goes_viral/${sample}_R1_unpaired.fastq.gz ./vsc45617/4.trim/ns_goes_viral/${sample}_R2_paired.fastq.gz ./vsc45617/4.trim/ns_goes_viral/${sample}_R2_unpaired.fastq.gz 
ILLUMINACLIP:./vsc45617/miniconda3/pkgs/trimmomatic-0.39-hdfd78af_2/share/trimmomatic/adapters/TruSeq3-PE-2.fa:1:30:10 MINLEN:80;done
