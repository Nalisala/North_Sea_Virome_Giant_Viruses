`#! bin/bash  
#PBS -N fastqc
#PBS -l nodes=1:ppn=16 
#PBS -l walltime=40:00:00 
#PBS -l vmem=70gb 

source .bashrc 
conda activate fastqc 

for sample in $./vsc45617/Raw_data/NS_goes_viral/*astq.gz*  
do  fastqc -t 4 ./vsc45617/Raw_data/NS_goes_viral/*astq.gz* --o  ./vsc45617/Fastqc; done
