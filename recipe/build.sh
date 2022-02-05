#!/bin/zsh
set -e
set -x

mkdir build
cd build

cmake -E env CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY" \
cmake .. ${CMAKE_ARGS} \
      -DENABLE_UNIT_TESTS=OFF \
      -DENABLE_FUNC_TESTS=OFF

cmake --build . --verbose --target install
