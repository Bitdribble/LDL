FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# A minimum number of packages required to install CUDA
RUN apt-get update; apt-get install -y \
    apt-utils \
    curl \
    gnupg \
    wget \
    zip

# Container side CUDA version must match host side CUDA version.
# You can get the Ubuntu 20 version as apt install nvidia-cuda-toolkit,
# but it may not match your host side version
#
# In my case, the host side has CUDA 11.2, so we install that.
RUN rm -rf /tmp/cuda && \
    mkdir /tmp/cuda && \
    wget --progress=bar:force:noscroll https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin && \
    mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    wget --progress=bar:force:noscroll https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda-repo-ubuntu2004-11-2-local_11.2.0-460.27.04-1_amd64.deb && \
    dpkg -i cuda-repo-ubuntu2004-11-2-local_11.2.0-460.27.04-1_amd64.deb && \
    apt-key add /var/cuda-repo-ubuntu2004-11-2-local/7fa2af80.pub && \
    apt-get update && \
    apt-get -y install cuda && \
    rm -rf /tmp/cuda

# CUDA takes a long time to download.
# The list of these packages keeps changing, so I'm listing it after CUDA
RUN apt-get update; apt-get install -y \
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
    zip

# Torch is large, pip runs out of memory w/o --no-cache-dir
# so preinstall torch
RUN pip3 install --default-timeout=300 --verbose --no-cache-dir torch==1.10.1

# Install the other requirements
COPY requirements.txt /tmp
RUN pip3 install --default-timeout=300 -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt