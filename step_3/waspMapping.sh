#!/bin/bash
# changed output to data3 directory for fikt_3

# Change OUT_DIR, DATA_DIR, BAM_PATH AND --samples "_" to match with patient id and corresponding files
OUT_DIR="/iblm/netapp/data3/gsiguenza/find_intersecting_snps/fikt_3"

# location of hg38 h5 files 
DATA_DIR="/iblm/netapp/home/gsiguenza/WASP/DATA/output/fikt_3_h5"
# changed to run on fikt_3
BAM_PATH="/iblm/netapp/data3/jjaureguy/PRJEB18997/10_genos/19_genos_fastq/HPSI0114i-fikt_3/out/treatments"
WASP="/iblm/netapp/home/gsiguenza/WASP"

# directory path to merged bam using var SAMPLE_NAME
#/iblm/netapp/data3/jjaureguy/PRJEB18997/10_genos/19_genos_fastq/HPSI0114i-fikt_3/out/treatments/${SAMPLE_NAME}/merged_qc.bam


# Pull out reads that need to be remapped to check for bias
# Use the -p option for paired-end reads.
# will need to parallelize this and organize files from diff genomes into directories

#diff_mb
python ${WASP}/mapping/find_intersecting_snps.py \
       --is_paired_end \
       --is_sorted \
       --output_dir ${OUT_DIR}/diff_mb  \
       --snp_index $DATA_DIR/snp_index.h5 \
       --snp_tab $DATA_DIR/snp_tab.h5 \
       --haplotype $DATA_DIR/haplotypes.h5 \
       --samples "HPSI0114i-fikt_3" \
       $BAM_PATH/diff_mb/merged_qc.bam
      
       #${SAMPLE_NAME}/merged_qc.bam
       #$DATA_DIR/sim_pe_reads.bam replaced with above 

# int_gamma_mb
python $WASP/mapping/find_intersecting_snps.py \
       --is_paired_end \
       --is_sorted \
       --output_dir ${OUT_DIR}/int_gamma_mb  \
       --snp_index $DATA_DIR/snp_index.h5 \
       --snp_tab $DATA_DIR/snp_tab.h5 \
       --haplotype $DATA_DIR/haplotypes.h5 \
       --samples "HPSI0114i-fikt_3"  \
       $BAM_PATH/int_gamma_mb/merged_qc.bam

# salm_int_gamma_mb
python $WASP/mapping/find_intersecting_snps.py \
       --is_paired_end \
       --is_sorted \
       --output_dir ${OUT_DIR}/salm_int_gamma_mb  \
       --snp_index $DATA_DIR/snp_index.h5 \
       --snp_tab $DATA_DIR/snp_tab.h5 \
       --haplotype $DATA_DIR/haplotypes.h5 \
       --samples "HPSI0114i-fikt_3" \
       $BAM_PATH/salm_int_gamma_mb/merged_qc.bam

# salm_mb
python $WASP/mapping/find_intersecting_snps.py \
       --is_paired_end \
       --is_sorted \
       --output_dir ${OUT_DIR}/salm_mb  \
       --snp_index $DATA_DIR/snp_index.h5 \
       --snp_tab $DATA_DIR/snp_tab.h5 \
       --haplotype $DATA_DIR/haplotypes.h5 \
       --samples "HPSI0114i-fikt_3" \
       $BAM_PATH/salm_mb/merged_qc.bam

# Remap the reads, using same the program and options as before.
# alignment script for remapping (script that Jeff ran for original mapping, MUST MATCH FOR REMAPPING)
# bwa mem -t 16 -M ${genome} ${outdir}/reads/*val_1.fq.gz ${outdir}/reads/*val_2.fq.gz | samtools view -S -b -h
#  -F 4 - > ${outdir}/alignments/${sample}.bam

# call remap script executes the script in the first script's process, and pulls in variables and functions 
# from the other script (so they are usable from the calling script) NOTE: exit in second script terminates calling script as well.
source /iblm/netapp/home/gsiguenza/WASP/SCRIPTS/remap.sh