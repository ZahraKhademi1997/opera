#!/bin/bash
# Launch pytorch distributed in a software environment or container
#
# (c) 2022, Eric Stubbs
# University of Florida Research Computing

#SBATCH --wait-all-nodes=1
#SBATCH --job-name=soit_head
#SBATCH --mail-type=NONE
#SBATCH --mail-user=
#SBATCH --time=71:00:00
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --output=R-%x.%j.out
#SBATCH --error=R-%x.%j.err
#SBATCH --gpus-per-node=a100:1
#SBATCH --ntasks=1
#SBATCH --cpus-per-gpu=6
#SBATCH --mem-per-cpu=6gb
#SBATCH --constraint=a100




# LOAD PYTORCH SOFTWARE ENVIRONMENT
#==================================

## You can load a software environment or use a singularity container.
## CONTAINER="singularity exec --nv /path/to/container.sif" (--nv option is to enable gpu)
module load cuda/11.1.0
module load conda/24.1.2 gcc/12.2.0
conda activate ins_aware



# PRINTS
#=======
date; pwd; which python
export HOST=$(hostname -s)
NODES=$(scontrol show hostnames | grep -v $HOST | tr '\n' ' ')
echo "Host: $HOST" 
echo "Other nodes: $NODES"

echo "SLURM Environment Variables:"
env | grep SLURM
echo "---------------------------"

# PYTHON SCRIPT
#==============
# echo "Starting $SLURM_GPUS_PER_TASK process(es) on each node..."
# python -u main.py
# python -u models/ops/setup.py build install


# PYTHON SCRIPT
#==============
echo "Starting $SLURM_GPUS_PER_TASK process(es) on each node..."
python tools/train.py configs/soit/soit_r50_16x2_50e_coco.py --work-dir path/to/SOIT_model/output/ \
    

    