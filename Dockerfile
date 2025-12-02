# Use Ubuntu 16.04 as base
FROM ubuntu:16.04 AS builder

# Install required packages: build-essential, cmake, gcc-5
RUN apt-get update && \
    apt-get install -y build-essential cmake gcc-5 g++-5 && \
    rm -rf /var/libdocker buildx ls/apt/lists/*

# Set GCC 5 as default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 60 \
    && update-alternatives --config gcc \
    && update-alternatives --config g++

# Copy local Chipmunk2D directory into container
COPY . /opt/Chipmunk2D

# Set working directory
WORKDIR /opt/Chipmunk2D

# Create build directory and build with CMake
RUN mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --config Release

# Final stage: just keep the artifact
FROM scratch AS artifact
COPY --from=builder /opt/Chipmunk2D/build/lib64/libchipmunk.so /