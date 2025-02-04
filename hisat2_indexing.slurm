#!/bin/bash

apptainer exec --bind /data/ /containers/apptainer/hisat2_samtools_408dfd02f175cd88.sif hisat2-build genome.fa.gz genome/genome_index