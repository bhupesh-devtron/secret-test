FROM alpine:3.19
RUN --mount=type=secret,id=test_secret \
    test -f /run/secrets/test_secret && \
    echo "secret found, sha256: $(sha256sum /run/secrets/test_secret | cut -d' ' -f1)"
CMD ["true"]
