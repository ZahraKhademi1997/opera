### Running instruction
```
sbatch --j soit_head slurm_SOIT_head.sh
```




### Conda removal instruction
`conda remove --name ins_aware --all`
`conda clean --all`
`pip cache purge`

### Conda env
`conda create -n ins_aware python=3.7.16  `
`conda activate ins_aware`
`module load cuda/11.1.0`
`conda list | grep torch`


### Torch dependancy 
`conda install pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 cudatoolkit=11.3 -c pytorch`

### cudnn
`conda install -c "nvidia/label/cuda-11.8.0" cuda-toolkit`
`python3 -m pip install nvidia-cudnn-cu11==8.7.0.84`
`mkdir -p $CONDA_PREFIX/etc/conda/activate.d`
`echo 'CUDNN_PATH=$(dirname $(python -c "import nvidia.cudnn;print(nvidia.cudnn.__file__)"))' >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh`
`echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/:$CUDNN_PATH/lib' >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh`
`source $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh`


### Interimage installation
`cd /ROOT/Opera/third_party/mmcv`
`MMCV_WITH_OPS=1 pip install -e .`

`cd /ROOT/Opera/third_party/mmdetection`
`pip install -e .`

`export SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True`
`cd /ROOT/Opera`
`pip install -r requirements.txt`
`pip install -e .`

### Cuda path check
-`echo $LD_LIBRARY_PATH`
should be: `/apps/compilers/cuda/11.1.0/lib64:/usr/local/cuda/lib64:/opt/slurm/lib64::`

### Changes
- `third_party/mmcv/mmcv/utils/config.py'
removing verify
