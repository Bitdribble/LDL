FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update; apt-get install -y \
    apt-utils \
    curl \
    emacs \
    git \
    iputils-ping \
    htop \
    lsof \
    net-tools \
    pip \
    psmisc \
    python3 \
    sudo \
    traceroute \
    tzdata \
    vim \
    wget \
    zip

# Torch is large, pip runs out of memory w/o --no-cache-dir
# so preinstall torch
RUN pip3 install --default-timeout=300 --verbose --no-cache-dir torch==1.9.0

# Install the other requirements
COPY requirements.txt /tmp
RUN pip3 install --default-timeout=300 -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt