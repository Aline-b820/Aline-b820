#!/bin/bash
#SBATCH --job-name=hisat2
#SBATCH --cpus-per-task=4
#SBATCH --mem=8000M
#SBATCH --time=12:00:00
#SBATCH --partition=pibu_el8

for read1 in /data/users/abarbosa/rna_seq_analysis/new_req_toxoplasma/*_1.fastq.gz; do
    read2=${read1/_1.fastq.gz/_2.fastq.gz}

    base=$(basename ${read1} _1.fastq.gz)

    apptainer exec /containers/apptainer/hisat2_samtools_408dfd02f175cd88.sif \
    hisat2 -x /data/users/abarbosa/rna_seq_analysis/output/genome_index \
    -1 ${read1} -2 ${read2} \
    -S /data/users/abarbosa/rna_seq_analysis/new_req_toxoplasma/sam_files/${base}_alignment.sam -p 4 --summary-file /data/users/abarbosa/rna_seq_analysis/output/${base}_summary.txt --rna-strandness RF
done