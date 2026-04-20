FROM debian:stable-slim AS builder
RUN apt-get update && apt-get install -y --no-install-recommends \
        git build-essential ca-certificates \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /src
RUN git clone --depth 1 https://github.com/jhallen/exorsim.git
WORKDIR /src/exorsim/exorsim
RUN make && make install

FROM debian:stable-slim
COPY --from=builder /usr/local/bin/  /usr/local/bin/
COPY --from=builder /usr/local/share/exorsim/  /usr/local/share/exorsim/
WORKDIR /work
