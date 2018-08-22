FROM ubuntu:18.04

MAINTAINER hello@559labs.com

RUN apt-get update && \
    apt-get upgrade -yqq && \
    apt-get install -yqq python3 python3-pip openjdk-8-jdk graphviz python-pip python-dev \
            build-essential zlib1g-dev texlive texlive-lang-cjk libjpeg8 libjpeg8-dev \
            libfreetype6 libfreetype6-dev curl rsync && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Sphinx, sphinxcontrib-*
RUN pip3 install Sphinx sphinxcontrib-plantuml sphinxcontrib-blockdiag sphinxcontrib-seqdiag

# Thesae get added in at runtime
# ADD ./requirements.txt .
# RUN pip3 install -r requirements.txt

# Download PlantUML
RUN curl -L http://sourceforge.net/projects/plantuml/files/plantuml.jar/download > /plantuml.jar

WORKDIR /builds

ADD build.sh /builds/build.sh
CMD /bin/bash /builds/build.sh
