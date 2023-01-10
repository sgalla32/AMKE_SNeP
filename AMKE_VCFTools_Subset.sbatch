#!/bin/bash
#SBATCH -J AMKE_VCFTools_Subset
#SBATCH -o log.o%j 
#SBATCH -p bsudfq
#SBATCH -N 1
#SBATCH -n 14
#SBATCH -t 1-00:00:00
#SBATCH --mail-type=END
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=stephaniegalla@boisestate.edu

#Ensure the temporary directory is in your scratch, so that big files don't take up too much space.

export TMPDIR=~/scratch
 
 # Subset Individuals for populations.
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_197inds_72k.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_Alaska_Samples.txt --out amke_72k_Alaska.vcf --recode
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_197inds_72k.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_West_Samples.txt --out amke_72k_West.vcf --recode
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_197inds_72k.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_Texas_Samples.txt --out amke_72k_Texas.vcf --recode
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_197inds_72k.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_East_Samples.txt --out amke_72k_East.vcf --recode
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_197inds_72k.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_Florida_Samples.txt --out amke_72k_Florida.vcf --recode

# Create PLINK outputs for each population.
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_Alaska.vcf.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_Alaska
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_West.vcf.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_West
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_Texas.vcf.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_Texas
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_East.vcf.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_East
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_Florida.vcf.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_Florida

## Create VCFs that filter for HWE and linkage disequilibrium. 

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_197inds_72k.recode.vcf --hwe 0.05 --out ~/scratch/AMKE/VCF/AMKE_SNP_HWE --recode
~/anaconda3/bin/bcftools +prune -l 0.8 -w 1000 ~/scratch/AMKE/VCF/AMKE_SNP_HWE.recode.vcf -Ov -o ~/scratch/AMKE/VCF/AMKE_SNP_HWE_LD0.8.recode.vcf

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_Alaska_Samples.txt --out ~/scratch/AMKE/VCF/amke_72k_Alaska_HWE --recode
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE_LD0.8.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_Alaska_Samples.txt --out ~/scratch/AMKE/VCF/amke_72k_Alaska_HWE_LD --recode

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_West_Samples.txt --out ~/scratch/AMKE/VCF/amke_72k_West_HWE --recode
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE_LD0.8.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_West_Samples.txt --out ~/scratch/AMKE/VCF/amke_72k_West_HWE_LD --recode

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_Texas_Samples.txt --out ~/scratch/AMKE/VCF/amke_72k_Texas_HWE --recode
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE_LD0.8.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_Texas_Samples.txt --out ~/scratch/AMKE/VCF/amke_72k_Texas_HWE_LD --recode

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_East_Samples.txt --out ~/scratch/AMKE/VCF/amke_72k_East_HWE --recode
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE_LD0.8.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_East_Samples.txt --out ~/scratch/AMKE/VCF/amke_72k_East_HWE_LD --recode

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_Florida_Samples.txt --out ~/scratch/AMKE/VCF/amke_72k_Florida_HWE --recode
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE_LD0.8.recode.vcf --keep ~/scratch/AMKE/VCF/AMKE_SNP_Florida_Samples.txt --out ~/scratch/AMKE/VCF/amke_72k_Florida_HWE_LD --recode

# Create new PLINK outputs for each population 
 
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE.recode.vcf --plink --out ~/scratch/AMKE/PLINK/AMKE_SNP_HWE
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/AMKE_SNP_HWE_LD.recode.vcf --plink --out ~/scratch/AMKE/PLINK/AMKE_SNP_HWE_LD0.8

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_Alaska_HWE.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_Alaska_HWE
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_Alaska_HWE_LD.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_Alaska_HWE_LD0.8

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_West_HWE.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_West_HWE
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_West_HWE_LD.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_West_HWE_LD0.8

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_Texas_HWE.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_Texas_HWE
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_Texas_HWE_LD.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_Texas_HWE_LD0.8

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_East_HWE.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_East_HWE
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_East_HWE_LD.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_East_HWE_LD0.8

~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_Florida_HWE.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_Florida_HWE
~/anaconda3/bin/vcftools --vcf ~/scratch/AMKE/VCF/amke_72k_Florida_HWE_LD0.8.recode.vcf --plink --out ~/scratch/AMKE/PLINK/amke_72_Florida_HWE_LD0.8
