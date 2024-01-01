#!/bin/bash
set -e
set -x

mkdir build
cd build
uname -a
export PKG_CONFIG_PATH=${CONDA_PREFIX}/lib/pkgconfig
file $(which protoc)
cmake -E env CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY" \
cmake ${CMAKE_ARGS} \
    -G Ninja \
    -DCMAKE_CXX_STANDARD=17 \
    -DENABLE_UNIT_TESTS=OFF \
    -DENABLE_FUNC_TESTS=OFF \
    ..

cmake --build . --target install
