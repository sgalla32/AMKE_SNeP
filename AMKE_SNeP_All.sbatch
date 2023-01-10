#!/bin/bash
#SBATCH -J AMKE_snep
#SBATCH -o log.o%j 
#SBATCH -p bsudfq
#SBATCH -N 1
#SBATCH -n 14
#SBATCH -t 14-00:00:00
#SBATCH --mail-type=END
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=stephaniegalla@boisestate.edu

#Ensure the temporary directory is in your scratch, so that big files don't take up too much space.

export TMPDIR=~/scratch

module load snep

#All
SNeP -ped ~/scratch/AMKE/PLINK/All/amke_197inds_72k.ped
SNeP -ped ~/scratch/AMKE/PLINK/All/AMKE_SNP_HWE.ped
SNeP -ped ~/scratch/AMKE/PLINK/All/AMKE_SNP_HWE_LD0.8.ped

#West
SNeP -ped ~/scratch/AMKE/PLINK/West/amke_72_West.ped
SNeP -ped ~/scratch/AMKE/PLINK/West/amke_72_West_HWE.ped
SNeP -ped ~/scratch/AMKE/PLINK/West/amke_72_West_HWE_LD0.8.ped

#East
SNeP -ped ~/scratch/AMKE/PLINK/East/amke_72_East.ped
SNeP -ped ~/scratch/AMKE/PLINK/East/amke_72_East_HWE.ped
SNeP -ped ~/scratch/AMKE/PLINK/East/amke_72_East_HWE_LD0.8.ped

#Alaska
SNeP -ped ~/scratch/AMKE/PLINK/Alaska/amke_72_Alaska.ped
SNeP -ped ~/scratch/AMKE/PLINK/Alaska/amke_72_Alaska_HWE.ped
SNeP -ped ~/scratch/AMKE/PLINK/Alaska/amke_72_Alaska_HWE_LD0.8.ped

#Florida
SNeP -ped ~/scratch/AMKE/PLINK/Florida/amke_72_Florida.ped
SNeP -ped ~/scratch/AMKE/PLINK/Florida/amke_72_Florida_HWE.ped
SNeP -ped ~/scratch/AMKE/PLINK/Florida/amke_72_Florida_HWE_LD0.8.ped

#Texas
SNeP -ped ~/scratch/AMKE/PLINK/Texas/amke_72_Texas.ped
SNeP -ped ~/scratch/AMKE/PLINK/Texas/amke_72_Texas_HWE.ped
SNeP -ped ~/scratch/AMKE/PLINK/Texas/amke_72_Texas_HWE_LD0.8.ped
