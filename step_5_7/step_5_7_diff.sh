#!/bin/bash
wasp="/iblm/netapp/home/gsiguenza/WASP"
bwa_data="/iblm/netapp/data3/gsiguenza/BWA_out/fikt3"
int_sect_snps="/iblm/netapp/data3/gsiguenza/find_intersecting_snps/fikt_3"
merged_dir="/iblm/netapp/data3/gsiguenza/step_6/diff"

# Activate conda env
source /iblm/netapp/home/gsiguenza/anaconda3/etc/profile.d/conda.sh
conda activate BWA_remap_step4

# Use filter_remapped_reads.py to create filtered list of reads that correctly
# remap to same position

python $wasp/mapping/filter_remapped_reads.py \
       $int_sect_snps/diff_mb/merged_qc.to.remap.bam \
       $bwa_data/diff/diff.remap.sort.bam \
       $bwa_data/diff/diff.remap.keep.bam

# Create a merged BAM containing [1] reads that did
# not need remapping [2] filtered remapped reads
samtools merge $merged_dir/diff.keep.merge.bam \
	$bwa_data/diff/diff.remap.keep.bam \
	$int_sect_snps/diff_mb/merged_qc.keep.bam

# Sort and index the bam file
samtools sort -o $merged_dir/diff.keep.merge.sort.bam \
	$merged_dir/diff.keep.merge.bam
samtools index $merged_dir/diff.keep.merge.sort.bam 

# Filter out duplicate reads. Use rmdup_pe.py for paired-end reads,
# rmdup.py for single-end reads.
python $wasp/mapping/rmdup_pe.py $merged_dir/diff.keep.merge.sort.bam \
	$merged_dir/diff.keep.rmdup.merge.sort.bam
