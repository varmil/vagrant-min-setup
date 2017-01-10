#!/bin/sh
# https://docs.docker.com/engine/installation/linux/centos/

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


# create docker group for using docker without sudo
groupadd docker
usermod -aG docker vagrant


# docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
