FROM docker:1.12.1-git

ENV DOCKER_MACHINE_BUCKET github.com/docker/machine/releases/download
ENV DOCKER_MACHINE_VERSION v0.8.1
ENV DOCKER_MACHINE_SHA256 63d485bf4613db70b7df41369f94b83f4e957e87c42a4da4ab7a57bdc985a7ca

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

RUN curl -L  https://bootstrap.pypa.io/get-pip.py -o /usr/local/bin/get-pip.py
RUN python /usr/local/bin/get-pip.py

RUN pip install pywinrm boto markupsafe jinja2 docker-py cryptography ansible awscli

