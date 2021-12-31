FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update; apt install -y emacs python pip tzdata

COPY requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt