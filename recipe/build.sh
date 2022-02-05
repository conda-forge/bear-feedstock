#!/bin/bash
set -e

mkdir build
cd build

if [[ "${target_platform}" == "osx-arm64" ]]; then
    sed -ie "s;protoc-gen-grpc.*$;protoc-gen-grpc=\"${BUILD_PREFIX}/bin/grpc_cpp_plugin\";g" ../source/intercept/proto/CMakeLists.txt
fi

cmake -E env CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY" \
cmake .. ${CMAKE_ARGS} \
      -DENABLE_UNIT_TESTS=OFF \
      -DENABLE_FUNC_TESTS=OFF

cmake --build . --target install
