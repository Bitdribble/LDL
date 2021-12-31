FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update; apt install -y emacs python3 pip tzdata

COPY requirements.txt /tmp
RUN pip3 install --default-timeout=300 -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt