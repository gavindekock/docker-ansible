FROM docker:1.10.3-git
RUN apk update
RUN apk upgrade
RUN apk add ca-certificates
RUN apk add python
RUN apk add python-dev
RUN apk add libxml2-dev
RUN apk add alpine-sdk
RUN curl -L  https://bootstrap.pypa.io/get-pip.py -o /usr/local/bin/get-pip.py
RUN python /usr/local/bin/get-pip.py
RUN pip install pywinrm boto markupsafe jinja2 docker-py cryptography ansible
RUN curl -L https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-Linux-x86_64 -o /usr/local/bin/docker-machine
RUN chmod +x /usr/local/bin/docker-machine
