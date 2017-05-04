FROM debian
RUN apt-get update && apt-get install -y curl wget gzip
RUN curl -L -o pact-stub-server.gz $(curl -s https://api.github.com/repos/uglyog/pact-stub-server/releases | grep browser_download_url | head -n 1 | cut -d '"' -f 4) && \
    mkdir /app && \
    gunzip *.gz && \
    chmod +x pact* && \
    mv pact* /app/pact-stub-server

WORKDIR /app
ENTRYPOINT ["/app/pact-stub-server"]
CMD ["--help"]
