`#!/bin/bash                                               
#PBS -N metaspades                                  
#PBS -l nodes=4:ppn=16                                    
#PBS -l walltime=10:00:00                                   
#PBS -l vmem=50gb

module load SPAdes/3.15.3-GCC-11.2.0 

cd ./vsc45617/4.trim/ns_goes_viral for sample in `cat samplelist`;                                  
do metaspades.py -1 ${sample}_R1_paired.fastq.gz -2 ${sample}_R2_paired.fastq.gz -o ./vsc45617/5.assembly/ns_goes_viral/metaspades/${sample}; done
