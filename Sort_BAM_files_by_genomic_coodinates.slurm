#!/bin/bash
#SBATCH --job-name=samtools_sorting
#SBATCH --cpus-per-task=4
#SBATCH --mem=25000M
#SBATCH --time=12:00:00
#SBATCH --partition=pibu_el8

for bam_file in /data/users/abarbosa/rna_seq_analysis/new_req_toxoplasma/sam_files/*_alignment.bam; do
    base=$(basename "$bam_file" .bam)
    samtools sort "$bam_file" -o /data/users/abarbosa/rna_seq_analysis/new_req_toxoplasma/sam_files/"${base}_sorted.bam"
done