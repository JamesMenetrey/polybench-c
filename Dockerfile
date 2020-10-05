FROM ubuntu:18.04


# Baseline components
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    gcc \
    make \
    perl \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/polybench/build.sh" ]