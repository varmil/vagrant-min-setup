#!/bin/sh
# https://docs.docker.com/engine/installation/linux/centos/

sudo yum update -y


sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF


sudo yum install -y docker-engine


sudo systemctl enable docker.service


sudo systemctl start docker


sudo docker run --rm hello-world
