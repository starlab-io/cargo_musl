FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive \
    CARGO_HOME=/usr/local/cargo \
    RUSTUP_HOME=/etc/local/cargo/rustup \
    PATH=/usr/local/cargo/bin:$PATH

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        build-essential \
        curl \
        vim

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    > rustup-install.sh && \
    umask 020 && \
    sh ./rustup-install.sh -y && \
    rustup target add x86_64-unknown-linux-musl

