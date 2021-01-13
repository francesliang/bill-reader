FROM ubuntu:18.04 as base

ENV PROJECT_PATH=/app

RUN apt-get update \
    && apt-get install -y python3-pip python3.7-dev \
    tesseract-ocr poppler-utils libxext-dev libsm-dev libxrender-dev \
    && pip3 install --upgrade pip \


COPY InvoiceNet $PROJECT_PATH/InvoiceNet

RUN cd $PROJECT_PATH/InvoiceNet \
    && pip3 install .


WORKDIR /app

COPY src /app/src

