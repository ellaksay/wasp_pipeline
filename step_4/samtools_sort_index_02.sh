#!/bin/bash
wasp="/iblm/netapp/home/gsiguenza/WASP"
bwa_data="/iblm/netapp/data3/gsiguenza/BWA_out/fikt3"
int_sect_snps="/iblm/netapp/data3/gsiguenza/find_intersecting_snps/fikt_3"
merged_dir="/iblm/netapp/data3/gsiguenza/step_6/diff"

# Activate conda env
source /iblm/netapp/home/gsiguenza/anaconda3/etc/profile.d/conda.sh
conda activate BWA_remap_step4

#diff
samtools sort -o $bwa_data/diff/diff.remap.sort.bam $bwa_data/diff/diff.remap.bam
samtools index $bwa_data/diff/diff.remap.sort.bam

#int_gamma
samtools sort -o $bwa_data/int_gamma/int_gamma.remap.sort.bam $bwa_data/int_gamma/int_gamma.remap.bam
samtools index $bwa_data/int_gamma/int_gamma.remap.sort.bam

#salm
samtools sort -o $bwa_data/salm/salm.remap.sort.bam $bwa_data/salm/salm.remap.bam
samtools index $bwa_data/salm/salm.remap.sort.bam

#salm_int_gamma
samtools sort -o $bwa_data/salm_int_gamma/salm_int_gamma.remap.sort.bam $bwa_data/salm_int_gamma/salm_int_gamma.remap.bam
samtools index $bwa_data/salm_int_gamma/salm_int_gamma.remap.sort.bam
