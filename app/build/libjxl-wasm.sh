apt-get -q update && \
apt-get -q install -y --no-install-recommends \
git \
cmake \
pkg-config \
ninja-build \
doxygen \
graphviz \
default-jre \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

export -n CFLAGS

git clone -b v0.10.1 https://github.com/libjxl/libjxl.git --recursive --shallow-submodules

cd libjxl

BUILD_TARGET=wasm32 ENABLE_WASM_SIMD=1 emconfigure ./ci.sh release

export CFLAGS="-stdlib=libc++ -rtlib=compiler-rt -unwindlib=libunwind -fuse-ld=lld"

apt-get purge --auto-remove -y \
git \
cmake \
pkg-config \
ninja-build \
doxygen \
graphviz \
default-jre