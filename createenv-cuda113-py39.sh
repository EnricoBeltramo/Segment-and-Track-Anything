eval "$(conda shell.bash hook)"
conda remove -n sam-objectdetection-cu113-py39-env -y --all
conda create -n sam-objectdetection-cu113-py39-env -y python=3.9
conda activate sam-objectdetection-cu113-py39-env

#conda install pytorch==1.10.1 torchvision==0.11.2 torchaudio==0.10.1 cudatoolkit=11.3 -c pytorch -c conda-forge -y
#pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia -y

chmod +x ./script/install.sh
./script/install.sh

chmod +x ./script/download_ckpt.sh
./script/download_ckpt.sh

conda deactivate