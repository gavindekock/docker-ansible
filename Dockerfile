FROM docker:1.10.1-git
RUN apk update
RUN apk add ca-certificates
RUN apk add python
RUN apk add python-dev
RUN apk add libxml2-dev
RUN apk add alpine-sdk
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install pywinrm boto markupsafe jinja2 docker-py ansible
