#!/bin/bash
set -e
set -x

echo $(uname -a)
echo $(which protoc)
echo $(file $(which protoc))

mkdir build
cd build

cmake -E env CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY" \
cmake .. ${CMAKE_ARGS} \
      -DENABLE_UNIT_TESTS=OFF \
      -DENABLE_FUNC_TESTS=OFF

cmake --build . --verbose --target install
