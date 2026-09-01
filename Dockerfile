FROM alpine:3.19
RUN apk add --no-cache openssh-client
ARG BUILD_ENV
RUN echo "build env: $BUILD_ENV"
RUN --mount=type=secret,id=npmrc \
    test -f /run/secrets/npmrc && \
    echo "secret 1 found, sha256: $(sha256sum /run/secrets/npmrc | cut -d' ' -f1)"
RUN --mount=type=secret,id=npmrc2 \
    test -f /run/secrets/npmrc2 && \
    echo "secret 2 found, sha256: $(sha256sum /run/secrets/npmrc2 | cut -d' ' -f1)"
RUN --mount=type=secret,id=repotoken \
    test -f /run/secrets/repotoken && \
    echo "secret 3 (source code) found, sha256: $(sha256sum /run/secrets/repotoken | cut -d' ' -f1)"
RUN --mount=type=ssh,id=deploykey \
    ssh-add -l
CMD ["true"]
