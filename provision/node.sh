#!/bin/sh
# run this script as 'vagrant' user

curl -L git.io/nodebrew | perl - setup
source ~/.bashrc

nodebrew install-binary stable
nodebrew use stable
