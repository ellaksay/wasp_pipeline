#!/bin/bash

# splitting the newly converted hg38 file, sorted and compressed
# VCF_DIR="/iblm/netapp/data3/gsiguenza/phased_vcf/issa_3_hg38"
VCF_DIR="/iblm/netapp/home/gsiguenza/WASP/DATA/crossmap_hg38/fikt_3"

# outputting split by chrom into fikt_3_split directory
OUTPUT_DIR="/iblm/netapp/home/gsiguenza/WASP/DATA/chrom_split"

cd $VCF_DIR
# run bcftools and index chrom 1 - 22 for fikt_3

#copy paste this into crossmap script
#echo "compressing file with bgzip"
#bcftools view fikt_3_hg38.vcf.gz -Oz -o fikt_3_hg38_compressed.vcf.gz
#echo "rerun and test newly generated file"

# did not have the -Oz flag? 
echo "working on splitting chromosome 1 - 22 and redirecting output to folder..."
for i in {1..22}
do
bcftools view -r "chr${i}" fikt_3_hg38_sorted.vcf.gz -Oz -o $OUTPUT_DIR/fikt_3_split/chrom_split_${i}.vcf.gz
done

echo "done"