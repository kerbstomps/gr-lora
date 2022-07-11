# use the latest ubuntu 20.04 LTS image
from ubuntu:20.04

# change to the /lib directory within the docker image
workdir /lib

# Install required dependencies
run apt-get update \
    && apt-get -y install software-properties-common \ 
    && add-apt-repository ppa:gnuradio/gnuradio-releases-3.9 \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
        gnuradio vim git cmake build-essential libboost-all-dev libgmp-dev swig doxygen python3-numpy \
        python3-mako python3-sphinx python3-lxml libfftw3-dev \
        libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 python-wxgtk3.0 \
        liblog4cpp5-dev libzmq3-dev python3-yaml python3-click python3-click-plugins \
        python3-zmq python3-scipy python3-gi python3-gi-cairo gir1.2-gtk-3.0 \
        libiio-dev libad9361-dev libspdlog-dev python3-packaging python3-jsonschema \
        libcodec2-dev libgsm1-dev pybind11-dev python3-matplotlib libsndfile1-dev \
        python3-pip libsoapysdr-dev soapysdr-tools \
        libcppunit-dev libuhd-dev \ 
        hackrf \
    && rm -rf /var/lib/apt/lists/* \
    && pip install pygccxml pyqtgraph packaging

# Manual liquid-dsp install
workdir /liquid
run git clone https://github.com/jgaeddert/liquid-dsp.git . && \
    sh ./bootstrap.sh && \
    sh ./configure --prefix=/usr && \
    make && \
    make install

# Install gr-lora
workdir /src
arg CACHEBUST
run git clone https://github.com/kerbstomps/gr-lora.git . && \
    mkdir build && \
    cd build && \
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr && \
    make && \
    make install && \
    ldconfig

workdir /src/apps

# expose port 40868 as UDP LoRa message receive port
expose 40868/udp