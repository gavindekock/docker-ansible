FROM docker:stable-git

ENV DOCKER_MACHINE_BUCKET github.com/docker/machine/releases/download
ENV DOCKER_MACHINE_VERSION v0.10.0
ENV DOCKER_MACHINE_SHA256 74f77385f6744fb83ec922b206f39b4c33ac42e63ed09d4d63652741d8a94df9

RUN set -x \
	&& curl -fSL "https://${DOCKER_MACHINE_BUCKET}/${DOCKER_MACHINE_VERSION}/docker-machine-Linux-X86_64" -o docker-machine \
	&& echo "${DOCKER_MACHINE_SHA256}  docker-machine" | sha256sum -c - \
	&& mv docker-machine /usr/local/bin/ \
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
