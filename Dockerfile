FROM ubuntu:18.04

RUN apt-get update
# neovimの安定版をaptに登録する
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y neovim

RUN apt-get install -y python3
RUN apt-get install -y python3-pip --fix-missing

RUN mkdir -p ~/.config/nvim
COPY nvim root/.config/nvim
