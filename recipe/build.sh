#!/bin/bash
set -e

mkdir build
cd build

cmake -E env CXXFLAGS="${CXXFLAGS} \
cmake .. ${CMAKE_ARGS} \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_PREFIX_PATH=${PREFIX} \
      -DENABLE_UNIT_TESTS=OFF \
      -DENABLE_FUNC_TESTS=OFF

cmake --build . --target install
