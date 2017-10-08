FROM docker:stable-git

ENV DOCKER_MACHINE_BUCKET github.com/docker/machine/releases/download
ENV DOCKER_MACHINE_VERSION v0.12.2
ENV DOCKER_MACHINE_SHA256 56f1e04811e21e972c44ca9b1d0a78784764646fedab3858c6239fcbaac4c87d

RUN set -ex \
&& apk add --no-cache libcurl curl 

RUN set -ex \
&& curl -fSL "https://${DOCKER_MACHINE_BUCKET}/${DOCKER_MACHINE_VERSION}/docker-machine-`uname -s`-`uname -m`" -o docker-machine \
&& echo "${DOCKER_MACHINE_SHA256}  docker-machine" | sha256sum -c - \
&& mv docker-machine /usr/local/bin/ \
&& chmod +x /usr/local/bin/docker-machine \
&& docker-machine -v

RUN apk add --no-cache python \ 
python-dev \
libxml2-dev \
alpine-sdk \
openssl-dev \
libffi-dev

RUN curl -L https://bootstrap.pypa.io/get-pip.py -o /usr/local/bin/get-pip.py

RUN python /usr/local/bin/get-pip.py

RUN pip install pywinrm boto boto3 markupsafe jinja2 docker-py cryptography ansible awscli
