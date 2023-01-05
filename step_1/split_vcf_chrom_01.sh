#!/bin/bash

# splitting the newly converted hg38 file, sorted and compressed
# VCF_DIR="/iblm/netapp/data3/gsiguenza/phased_vcf/issa_3_hg38"
VCF="/iblm/netapp/data3/jjaureguy/PRJEB18997/phased_vcf/combined_vcf/merged_vcf_post_lift_sorted.vcf.gz"

# outputting split by chrom into
OUTPUT_DIR="/iblm/netapp/data4/jjaureguy/WASP_pipeline/wasp_output/chrom_split"

# run bcftools and index chrom 1 - 22 for fikt_3

#copy paste this into crossmap script
#echo "compressing file with bgzip"
#bcftools view fikt_3_hg38.vcf.gz -Oz -o fikt_3_hg38_compressed.vcf.gz
#echo "rerun and test newly generated file"

# did not have the -Oz flag? 
echo "working on splitting chromosome 1 - 22 and redirecting output to folder..."
for i in {1..22}
do
bcftools view -r "chr${i}" ${VCF} -Oz -o $OUTPUT_DIR/chrom_split_${i}.vcf.gz
done

echo "done"