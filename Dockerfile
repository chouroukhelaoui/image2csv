FROM ubuntu:18.04

ENV HOME /root
RUN apt-get update
RUN apt-get install -y poppler-utils
RUN apt install -y tesseract-ocr  tesseract-ocr-all
RUN apt install -y imagemagick
RUN apt install -y nano
WORKDIR /input

COPY . /input/
RUN apt install -yq python3-pip
RUN pip3 install --upgrade pip && \
   pip install opencv-python && \
    pip3 install requests && \
     pip3 install pytesseract && \
    mkdir /output
RUN chmod -R 777 /input/
ENV PYTHONIOENCODING=utf-8
RUN export PYTHONIOENCODING=utf-8
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
CMD /bin/bash