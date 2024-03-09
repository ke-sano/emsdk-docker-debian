FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    CFLAGS="-std=c++11 -stdlib=libc++ -rtlib=compiler-rt -unwindlib=libunwind -fuse-ld=lld" \
    EMCC_CFLAGS="-std=c++11 -stdlib=libc++ -rtlib=compiler-rt -unwindlib=libunwind -fuse-ld=lld"

RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends \
    clang \
    lld \
    libclang-rt-dev \
    libc++1 \
    libc++-dev \
    libc++abi1 \
    libc++abi-dev \
    libunwind-14-dev \
    python3 \
    cmake \
    git \
    ca-certificates \
    xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone -b 3.1.47 https://github.com/emscripten-core/emsdk.git && chmod +x emsdk && cd emsdk && \
    ./emsdk install 3.1.47 && \
    ./emsdk activate 3.1.47

ENV PATH="${PATH}:/emsdk/upstream/emscripten"

RUN apt-get purge --auto-remove -y \
    cmake \
    git \
    ca-certificates \
    xz-utils

WORKDIR /app