#!/bin/bash

NEW_BAM="/iblm/netapp/data3/gsiguenza/BWA_out/fikt3/diff"
# Activate conda env
source /iblm/netapp/home/gsiguenza/anaconda3/etc/profile.d/conda.sh
conda activate BWA_remap_step4

bwa mem -M /iblm/netapp/data3/jjaureguy/PRJEB18997/10_genos/hg38/ref_genome_reindex/hg38.fa.gz /iblm/netapp/data3/gsiguenza/find_intersecting_snps/fikt_3/diff_mb/merged_qc.remap.fq1.gz /iblm/netapp/data3/gsiguenza/find_intersecting_snps/fikt_3/diff_mb/merged_qc.remap.fq2.gz \
| samtools view -S -b -h -F 4 - > $NEW_BAM/diff.remap.bam

#$NEW_BAM/diff_mb.bam samtools sort -o $NEW_BAM/diff_mb.sort.bam $NEW_BAM/diff_mb.bam samtools index $NEW_BAM/diff_mb.sort.bam
