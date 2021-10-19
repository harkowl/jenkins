FROM jenkins/jenkins:latest

## Python install 3.6.8 
#  已经下载并在目录中
#  https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
USER root
ADD Python-3.6.8.tgz /usr/local
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt update
RUN apt install build-essential -y && apt install libncurses5-dev libncursesw5-dev libreadline6-dev -y && apt install libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev -y && apt install libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev -y && apt install ca-certificates -y
#RUN ln /usr/lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/local/libssl.so && ln /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /usr/local/libcrypto.so
RUN cd /usr/local/Python-3.6.8 && ./configure
RUN cd /usr/local/Python-3.6.8 && make && make install 

#  Python3 Pip3 upgrade
#RUN curl -L https://bootstrap.pypa.io/get-pip.py -O ./get-pip.py
COPY get-pip.py /usr/local/Python-3.6.8/
RUN cd /usr/local/Python-3.6.8/ && python3 get-pip.py
RUN pip3 --version

# Pip3 modular
COPY install-pip3.txt /usr/local/Python-3.6.8/
RUN for pipmodular in `cat /usr/local/Python-3.6.8/install-pip3.txt | awk '{print $1}'`; do   python3 -m pip install $pipmodular; done
#RUN pip list

## Maven
ADD apache-maven-3.6.3.tar.gz /usr/local/
RUN echo 'export MAVEN_HOME=/usr/local/apache-maven-3.6.3' >> /etc/profile
RUN echo 'export PATH=${PATH}:${MAVEN_HOME}/bin' >> /etc/profile
#RUN tail -2 /etc/profile
#RUN source /etc/profile

EXPOSE 8080
EXPOSE 50000
