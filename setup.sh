#!/bin/bash

## TODO: Exit if not Ubuntu

sudo apt update

## check for & install tmux
tmux -V || export has_tmux=0
if [ $has_tmux -eq 0 ]; then
    sudo apt install -y tmux
    ## TODO: test install & print results
fi

## check for & install docker
sudo docker compose version || export has_docker=0
if [ $has_docker -eq 0 ]; then
    # Add Docker's official GPG key:
    sudo apt install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    # Install docker
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    ## TODO: test install & print results
fi

## check for & install python3
python3 --version || export has_python=0
if [ $has_python -eq 0 ]; then
    sudo apt install -y python3
    ## TODO: test install & print results
fi

## check for & install termsaver
termsaver || export has_termsaver=0
if [ $has_termsaver -eq 0 ]; then
    pip install termsaver
    ## TODO: test install & print results
fi

## check for & install nms
nms -v || export has_nms=0
if [ $has_nms -eq 0 ]; then
    sudo apt install -y make git
    git clone https://github.com/bartobri/no-more-secrets.git
    cd ./no-more-secrets
    make nms
    make sneakers
    sudo make install
    cd ..
    ## TODO: test install & print results
fi

# setup file permissions
chmod +x *.sh