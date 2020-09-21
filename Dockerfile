FROM ubuntu:20.04

ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
      apt-get -y install sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN printf '\ndocker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
CMD /bin/bash

# Install to make the setupscrip faster
RUN sudo apt install git python3-pip software-properties-common snap -y

RUN pip3 install pyyaml

COPY . /home/docker/eos_setup
WORKDIR /home/docker/eos_setup
