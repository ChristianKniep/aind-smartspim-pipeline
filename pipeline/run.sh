#!/usr/bin/env bash

DATA_PATH="s3://nextflow-input-sydney/SmartSPIM_758793_2024-10-18_22-38-15"

# Template path
TEMPLATE_PATH="s3://nextflow-input-sydney/SmartSPIM-template_2024-05-16_11-26-14"

# Cell detection path
CELL_DETECTION_PATH="s3://nextflow-input-sydney/mesoscale-anatomy-cell-detection/models/trained_models_03212024"

# On MM Batch, using nf-amazon
CLOUD="true"

# Results and process dataset paths
RESULTS_PATH="s3://apse2-nextflow-results/aind-smartspim-test-results"
OUTPUT_PATH="s3://apse2-nextflow-results/aind-smartspim-test-processed_dataset"
WORK_PATH="s3://apse2-nextflow-work/aind-smartspim-test-workdir"

NXF_VER=22.10.8 DATA_PATH=$DATA_PATH RESULTS_PATH=$RESULTS_PATH nextflow run main_slurm_v2.nf \
  --output_path $OUTPUT_PATH \
  -work-dir $WORK_PATH \
  --template_path $TEMPLATE_PATH \
  --cell_detection_model $CELL_DETECTION_PATH \
  -c ~/aws.config \
  > >(tee nextflow.stdout >&1) \
  2> >(tee nextflow.stderr >&2)

