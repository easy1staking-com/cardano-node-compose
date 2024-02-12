FROM ubuntu:20.04 as builder

RUN apt update && apt install -y curl

WORKDIR /mithril
RUN curl -L https://github.com/input-output-hk/mithril/releases/download/2403.1/mithril-2403.1-linux-x64.tar.gz | \
    tar xzv -C /mithril && \
    chmod +x mithril-*

FROM ubuntu:20.04

ENV AGGREGATOR_ENDPOINT=https://aggregator.release-mainnet.api.mithril.network/aggregator
ENV GENESIS_VERIFICATION_KEY=5b3139312c36362c3134302c3138352c3133382c31312c3233372c3230372c3235302c3134342c32372c322c3138382c33302c31322c38312c3135352c3230342c31302c3137392c37352c32332c3133382c3139362c3231372c352c31342c32302c35372c37392c33392c3137365d

RUN apt update && apt install -y ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root/bin
COPY --from=builder /mithril/mithril-client /usr/local/bin
COPY /init-container/download-cardano-node-db.sh /root/bin

CMD ["/root/bin/download-cardano-node-db.sh"]
