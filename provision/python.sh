#!/bin/sh

curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

source ~/.bashrc

sudo yum install -y zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel

pyenv install 3.4.5

pyenv global 3.4.5
