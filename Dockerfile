FROM debian:stretch

MAINTAINER mohanliu <mohan@u.northwestern.edu>

RUN apt-get update
RUN apt-get install -y git vim wget bzip2
RUN apt-get install -y build-essential default-libmysqlclient-dev python-dev
RUN apt install -y libgl1-mesa-glx

COPY .bashrc /root/.bashrc
COPY .vimrc /root/.vimrc
COPY requirements.txt /root/requirements.txt

WORKDIR /root
RUN wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh
RUN chmod +x miniconda.sh
RUN ./miniconda.sh -b
RUN /root/miniconda2/bin/conda update --yes --quiet conda
ENV PATH /root/miniconda2/bin:$PATH
RUN conda create -n oqmd -y

RUN bash -c 'source activate oqmd && conda install --yes --quiet python=2.7 atlas numpy scipy matplotlib=2.2.3'
RUN bash -c 'source activate oqmd && conda install --yes --quiet scikit-learn lxml cython'
RUN bash -c 'source activate oqmd && pip install -r requirements.txt'
RUN git clone -b api_oqmd_v1 https://github.com/mohanliu/qmpy.git 
RUN echo '/root/qmpy' >> '/root/miniconda2/envs/oqmd/lib/python2.7/site-packages/qmpy.pth'

RUN mkdir /workspace
VOLUME /workspace
WORKDIR /workspace

COPY settings.py /root/qmpy/qmpy/db/settings.py

CMD ["/bin/bash", "-c", "source activate oqmd && ipython -i -c 'from qmpy import *'"]
