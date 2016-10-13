FROM docker:1.12.3-git

ENV DOCKER_MACHINE_BUCKET github.com/docker/machine/releases/download
ENV DOCKER_MACHINE_VERSION v0.8.2
ENV DOCKER_MACHINE_SHA256 e5c3e360b46a82d4bc5ff2efe357b15040cfc58d3d962f793fee6ee1e44e9b66

RUN set -x \
&& curl -fSL "https://${DOCKER_MACHINE_BUCKET}/${DOCKER_MACHINE_VERSION}/docker-machine-Linux-x86_64" -o /usr/local/bin/docker-machine \
&& echo "${DOCKER_MACHINE_SHA256}  /usr/local/bin/docker-machine" | sha256sum -c - \
&& chmod +x /usr/local/bin/docker-machine \
&& docker-machine -v

RUN apk --no-cache add python \ 
python-dev \
libxml2-dev \
alpine-sdk \
openssl-dev \
libffi-dev 

RUN curl -L https://bootstrap.pypa.io/get-pip.py -o /usr/local/bin/get-pip.py
RUN python /usr/local/bin/get-pip.py

RUN pip install pywinrm boto boto3 markupsafe jinja2 docker-py cryptography ansible awscli
