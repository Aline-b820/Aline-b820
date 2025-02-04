#!/bin/bash
#SBATCH --job-name=featureCounts
#SBATCH --cpus-per-task=4
#SBATCH --mem=1000M
#SBATCH --time=24:00:00
#SBATCH --partition=pibu_el8

BAM_DIR="/data/users/abarbosa/rna_seq_analysis/new_req_toxoplasma/sam_files"
GTF_FILE="/data/users/abarbosa/rna_seq_analysis/new_req_toxoplasma/Mus_musculus.GRCm39.113.gtf"
OUTPUT_DIR="/data/users/abarbosa/rna_seq_analysis/output/featurecounts_output/"
CONTAINER="/containers/apptainer/subread_2.0.1--hed695b0_0.sif"


for BAM_FILE in "$BAM_DIR"/*_sorted.bam; do

    BASENAME=$(basename "$BAM_FILE" .bam)

    OUTPUT_FILE="$OUTPUT_DIR/${BASENAME}_counts.txt"

    echo "iniciando arquivo: $BAM_FILE."
    apptainer exec "$CONTAINER" featureCounts -T 4  -a "$GTF_FILE" -o "$OUTPUT_FILE" "$BAM_FILE"

    echo "FeatureCounts executado para $BAM_FILE. Resultado: $OUTPUT_FILE"
done
