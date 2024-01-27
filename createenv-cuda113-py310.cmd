call conda remove -n sam-objectdetection-cu113-py310-env -y --all
call conda create -n sam-objectdetection-cu113-py310-env -y python=3.10
call conda activate sam-objectdetection-cu113-py310-env

REM Install SAM
call cd sam
call pip install -e .
call cd ..

REM Install Grounding-Dino
call pip install -e git+https://github.com/IDEA-Research/GroundingDINO.git@main#egg=GroundingDINO

REM Install other lib
call pip install numpy opencv-python pycocotools matplotlib Pillow==9.2.0 scikit-image
call pip install gradio==3.39.0 zip gdown ffmpeg==1.4

REM Install Pytorch Correlation
call git clone https://github.com/ClementPinard/Pytorch-Correlation-extension.git
call cd Pytorch-Correlation-extension
call python setup.py install
call cd ..


call conda deactivate