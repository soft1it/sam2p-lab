FROM aflplusplus/aflplusplus:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    make \
    gcc \
    g++ \
    autoconf \
    automake \
    libtool \
    pkg-config \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libtiff-dev \
    git \
    perl \
    lcov \
    gcovr \    
    netpbm \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
