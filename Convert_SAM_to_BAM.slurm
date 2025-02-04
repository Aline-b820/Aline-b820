#!/bin/bash
#SBATCH --job-name=samtools
#SBATCH --cpus-per-task=1
#SBATCH --mem=10000M
#SBATCH --time=16:00:00
#SBATCH --partition=pibu_el8

for sam_file in /data/users/abarbosa/rna_seq_analysis/new_req_toxoplasma/sam_files/*_alignment.sam; do
    base=$(basename "$sam_file" .sam)
    apptainer exec /containers/apptainer/hisat2_samtools_408dfd02f175cd88.sif \
    samtools view -hbS "$sam_file" > /data/users/abarbosa/rna_seq_analysis/new_req_toxoplasma/sam_files/"${base}.bam"
done
