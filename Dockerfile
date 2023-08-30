FROM python:3.12.0rc1

WORKDIR /app

RUN apt update \
    && apt install -y \
        curl \
        autoconf \
        automake \
        libtool \
        pkg-config \
    && apt install -y \
        build-essential \
        cmake \
        wget \
        git \
    && git clone https://github.com/openvenues/libpostal \
    && cd libpostal \
    && ./bootstrap.sh \
    && ./configure --datadir="/app" \
    && make -j4 \
    && make install \
    && ldconfig

RUN pip install \
    setuptools \
    && pip install \
        postal \
        jupyter

EXPOSE 8888
    # && rm -rf /var/lib/apt/lists/* \
    # && apt purge -y --autoremove \
    #     build-essential \
    #     cmake \
    #     wget \
    #     git
