FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
    cabal-install \
    cpphs \
    zlib1g-dev \
    build-essential \
    locales

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN useradd -ms /bin/bash app \
    && mkdir /workspace \
    && chown app:app /workspace

ENV PATH="~/.cabal/bin:${PATH}"

USER app

RUN cabal update \
    && cabal install happy \
    && cabal install fay fay-base fay-text

WORKDIR /workspace