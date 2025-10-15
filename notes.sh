mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate
conda init --all

git clone https://github.com/Tencent-Hunyuan/Hunyuan-GameCraft-1.0.git
cd Hunyuan-GameCraft-1.0

conda create -n HYGameCraft python==3.10
conda activate HYGameCraft
conda install pytorch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1 pytorch-cuda=12.4 -c pytorch -c nvidia

python -m pip install -r requirements.txt
# python -m pip install ninja
# python -m pip install git+https://github.com/Dao-AILab/flash-attention.git@v2.6.3

cd weights
python -m pip install "huggingface_hub[cli]"
huggingface-cli download tencent/Hunyuan-GameCraft-1.0 --local-dir ./

nvidia-smi --query-gpu=name,compute_cap --format=csv

pip uninstall torch torchvision torchaudio -y
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
python -c "import torch; print(torch.__version__); print(torch.cuda.is_available())"

