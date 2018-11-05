FROM debian
RUN apt-get update && apt-get install -y curl gzip openssl
ENV VERSION 0.2.0
RUN mkdir /app && \
    curl -L -o /app/pact-stub-server.gz https://github.com/uglyog/pact-stub-server/releases/download/v$VERSION/pact-stub-server-linux-x86_64-$VERSION.gz && \
    gunzip /app/pact-stub-server.gz && \
    chmod +x /app/pact-stub-server
RUN apt-get remove -y curl && apt-get -y autoremove && apt-get clean
WORKDIR /app
ENTRYPOINT ["/app/pact-stub-server"]
EXPOSE 8080
CMD ["--help"]
