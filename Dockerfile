# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake clang

## Add source code to the build stage.
ADD . /minimp3
WORKDIR /minimp3
ENV TRAVIS_COMPILER clang
ENV CC clang
ENV CC_FOR_BUILD clang

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN cd mayhemfuzz && mkdir build && cd build && CC=clang CXX=clang++ cmake .. && make

# Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

##
COPY --from=builder /minimp3/mayhemfuzz/build/fuzz /