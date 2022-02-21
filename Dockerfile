FROM python:3.8.9

WORKDIR /usr/src/sparrow

RUN apt-get update
RUN apt-get install -y tesseract-ocr
RUN pip install --upgrade pip
RUN pip install --upgrade pip setuptools wheel
RUN pip install p5py
RUN pip install PEP517
RUN pip install git+https://github.com/huggingface/transformers

COPY requirements.txt ./

RUN pip install -r requirements.txt \
    && rm -rf /root/.cache/pip

RUN pip install torch==1.10.0 torchvision==0.11.0 -f https://download.pytorch.org/whl/torch_stable.html

RUN pip install git+https://github.com/facebookresearch/detectron2@main

COPY setup.py ./

RUN python setup.py