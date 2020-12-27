FROM ubuntu:18.04

RUN apt-get update
# neovimの安定版をaptに登録する
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:neovim-ppa/stable
RUN add-apt-repository -y ppa:hnakamur/universal-ctags
RUN apt-get update
RUN apt-get install -y wget curl git
RUN apt-get install -y vim
RUN apt-get install -y neovim
RUN apt install -y universal-ctags
RUN apt-get install -y clang libclang-dev
RUN echo 'export LANG=C.UTF-8' >> ~/.bashrc
RUN apt-get install -y snapd
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install --user --upgrade pynvim
RUN git config --global credential.helper 'cache --timeout=86400'

RUN mkdir -p ~/.config/nvim
COPY nvim root/.config/nvim
RUN nvim -c q
