#!/bin/bash  
#PBS -N virsorter_trim2Mega_nsgv                                 
#PBS -l nodes=4:ppn=20                                            
#PBS -l walltime=30:00:00                                            
#PBS -l vmem=40gb                                                   
cd ../vsc45617  

source .bashrc                                                     
conda activate vs2                                                  
cd ../vsc45617/5.assembly/ns_goes_viral/trim2 for sample in `cat samplelistmega`;                                  
do                                                              
virsorter run --keep-original-seq -w /data/gent/vo/001/gvo00125/vsc45617/7.identification/ns_goes_viral/virsorter/trim2/${sample}.out -i /data/gent/vo/001/gvo00125/vsc45617/5.assembly/ns_goes_viral/trim2/${sample}/final.contigs.fa --include-groups dsDNAphage,NCLDV,RNA,ssDNA,lavidaviridae --min-length 1500 --min-score 0.5 -j 20 all; done

#After the CheckV run virsorter again 
#combine provirus.fna and virus.fna from checkv output
 
		cat checkv/proviruses.fna checkv/viruses.fna > checkv/combined.fna
  
#Adding following parameter to virsorter command:

	--seqname-suffix-off --viral-gene-enrich-off --prep-for-dramv
