#!/bin/sh
# https://docs.docker.com/engine/installation/linux/centos/

yum update -y


tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF


yum install -y docker-engine


systemctl enable docker.service


systemctl start docker


docker run --rm hello-world


groupadd docker


usermod -aG docker vagrant
