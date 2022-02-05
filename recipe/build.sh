#!/bin/bash
set -e
set -x

mkdir build
cd build
if [[ "${target_platform}" == "osx-arm64" ]]; then
    sed -ie "s;protoc-gen-grpc.*$;protoc-gen-grpc=\"${BUILD_PREFIX}/bin/grpc_cpp_plugin\";g" ../source/intercept/proto/CMakeLists.txt
    sed -ie "s;\${_PROTOBUF_PROTOC};${BUILD_PREFIX}/bin/protoc;g"  ../source/intercept/proto/CMakeLists.txt
fi
 
cmake -E env CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY" \
cmake .. ${CMAKE_ARGS} \
      -DENABLE_UNIT_TESTS=OFF \
      -DENABLE_FUNC_TESTS=OFF

cmake --build . --target install
