FROM ubuntu:focal
MAINTAINER Potewo

ENV USER docker
ENV HOME /home/${USER}
ENV SHELL /bin/bash

RUN apt update
RUN apt -y upgrade
RUN apt -y install git vim sudo zsh neovim curl
RUN useradd -m docker -s ${SHELL} && echo "${USER}:${USER}" | chpasswd && adduser docker sudo


USER ${USER}
WORKDIR ${HOME}
