#!/bin/bash
#SBATCH --job-name=indexing
#SBATCH --cpus-per-task=1
#SBATCH --mem=4000M
#SBATCH --time=6:00:00
#SBATCH --partition=pibu_el8


for bam_file in *_alignment_sorted.bam; do
    samtools index "$bam_file"
done