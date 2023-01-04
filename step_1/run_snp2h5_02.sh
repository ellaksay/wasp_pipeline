#!/bin/bash

WASP="/iblm/netapp/home/gsiguenza/WASP"

CHROM_DIR="/iblm/netapp/home/gsiguenza/WASP/DATA/chromSize"
VCF_DIR="/iblm/netapp/home/gsiguenza/WASP/DATA/chrom_split"
#changed to run on fikt_3_hg38 split data
OUT_DIR="/iblm/netapp/home/gsiguenza/WASP/DATA/output/fikt_3_h5"

cd ${WASP}/snp2h5 

echo "running snp2h5 on iisa_3 vcf files..."
# check text file to restore original paths
./snp2h5 --chrom $CHROM_DIR/hg38.chrom.sizes --format vcf --haplotype $OUT_DIR/haplotypes.h5 --snp_index $OUT_DIR/snp_index.h5 --snp_tab $OUT_DIR/snp_tab.h5 $VCF_DIR/fikt_3_split/*.vcf.gz

echo "done"