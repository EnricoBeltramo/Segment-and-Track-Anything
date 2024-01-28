
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu2204-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda


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
