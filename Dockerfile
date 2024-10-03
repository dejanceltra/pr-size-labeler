FROM alpine:3.15

RUN apk add --no-cache bash curl jq wget
RUN mkdir -p "$HOME/bin" && \
    cd "$HOME/bin" && \
    wget -O docpars.tar.gz https://github.com/denisidoro/docpars/releases/download/v0.3.0/docpars-v0.3.0-aarch64-unknown-linux-gnu.tar.gz && tar xvfz docpars.tar.gz -C ./ && \
    chmod +x docpars

ADD entrypoint.sh /entrypoint.sh
ADD src /src

ENTRYPOINT ["/entrypoint.sh"]
