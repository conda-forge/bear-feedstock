#!/bin/bash
set -e

mkdir build
cd build

cmake -E env CXXFLAGS="${CXXFLAGS}" \
cmake .. ${CMAKE_ARGS} \
      -DENABLE_UNIT_TESTS=OFF \
      -DENABLE_FUNC_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_PREFIX_PATH=${PREFIX}

cmake --build . --target install
