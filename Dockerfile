FROM ubuntu:latest
MAINTAINER Potewo

ENV USER docker
ENV HOME /home/${USER}
ENV SHELL /bin/bash

RUN apt update
RUN apt -y upgrade
RUN apt -y install git vim sudo zsh neovim python-neovim python3-neovim
RUN useradd -m docker -s /bin/bash && echo "${USER}:${USER}" | chpasswd && adduser docker sudo


USER ${USER}
WORKDIR ${HOME}
