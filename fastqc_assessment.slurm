#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --cpus-per-task=1
#SBATCH --mem=1000
#SBATCH --time=1:00:00
#SBATCH --partition=pibu_el8

apptainer exec /containers/apptainer/fastqc-0.12.1.sif fastqc /data/courses/rnaseq_course/toxoplasma_de/reads/*.fastq.gz -o /data/users/abarbosa/rna_seq_analysis/new_req_toxoplasma/ 