FROM ubuntu:18.04

# ==============================
# Configuration static variables
# ==============================
ARG WASI_SDK_VERSION=10

# Baseline components
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    make \
    perl \
    ca-certificates \
    wget \
    && rm -rf /var/lib/apt/lists/*


# WASI SDK
WORKDIR /opt
RUN wget --quiet https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_SDK_VERSION}/wasi-sdk-${WASI_SDK_VERSION}.0-linux.tar.gz  && \
    tar xf wasi-sdk-${WASI_SDK_VERSION}.0-linux.tar.gz && \
    rm wasi-sdk-${WASI_SDK_VERSION}.0-linux.tar.gz && \
    mv wasi-sdk-${WASI_SDK_VERSION}.0 wasi-sdk

ENV PATH="$PATH:/opt/wasi-sdk:/opt/wasi-sdk/bin"

ENTRYPOINT [ "/polybench/build.sh" ]