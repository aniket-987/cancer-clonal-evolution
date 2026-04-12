# Clonal Evolution & Subclonal Architecture in Relapsed Neuroblastoma

## Overview
This project provides a professional-grade computational framework for reconstructing the evolutionary history of tumors. By comparing primary and relapsed samples, the pipeline identifies somatic mutations, calls Copy Number Variations (CNVs) & uses Bayesian clustering to deconvolve subclonal populations.

## Key Features
* **Somatic Comparison:** Uses Mutect2 logic to differentiate between founder mutations & subclonal expansions.
* **Deconvolution:** Implements Dirichlet Process Mixture Models to identify hidden cell populations.
* **Reproducibility:** Fully containerized environment with a Nextflow orchestration layer.

## Project Structure
* `workflow/`: Nextflow DSL2 orchestration.
* `scripts/`: Custom R & Python modules for CNV and Clonal analysis.
* `docker/`: YAML environment specification for cross-platform execution.
