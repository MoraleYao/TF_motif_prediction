#!/bin/bash
#SBATCH --job-name=trill_test              # Job name
#SBATCH --account=pcahan1_gpu
#SBATCH --partition=a100                   # GPU queue (update based on your cluster)
#SBATCH --gres=gpu:1                       # Number of GPUs
#SBATCH --cpus-per-task=4                  # CPU cores per task
#SBATCH --mem=16G                           # Memory allocation
#SBATCH --ntasks=1
#SBATCH --time=01:00:00                    # Max runtime (HH:MM:SS)
#SBATCH --output=../logs/embed_%x_%j_%A.log            # Standard output file
#SBATCH --error=../logs/embed_%x_%j_%A.err            # Error output file

# Load necessary modules
module load cuda/12.1

# Run TRILL with an example command
trill --outdir /home/jyao42/data_pcahan1/jyao42/projects/external_projects/TRILL/results/ \
    example 1 embed esm2_t12_35M /home/jyao42/data_pcahan1/jyao42/projects/external_projects/TRILL/data/query.fasta \
    --avg --per_AA

