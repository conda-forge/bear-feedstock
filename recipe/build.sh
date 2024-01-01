#!/bin/bash
set -e
set -x

mkdir build
cd build

pkg-config  grpc++ --libs
pkg-config  zlib --libs
 
cmake -E env CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY" \
cmake ${CMAKE_ARGS} \
    -G Ninja \
    -DCMAKE_CXX_STANDARD=17 \
    -DENABLE_UNIT_TESTS=OFF \
    -DENABLE_FUNC_TESTS=OFF \
    ..

cmake --build . --target install
