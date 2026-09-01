FROM alpine:3.19
RUN apk add --no-cache openssh-client
ARG BUILD_ENV
RUN echo "build env: $BUILD_ENV"
RUN --mount=type=secret,id=npmrc \
    test -f /run/secrets/npmrc && \
    echo "secret 1 value: $(cat /run/secrets/npmrc)"
RUN --mount=type=secret,id=npmrc2 \
    test -f /run/secrets/npmrc2 && \
    echo "secret 2 value: $(cat /run/secrets/npmrc2)"
RUN --mount=type=secret,id=repotoken \
    test -f /run/secrets/repotoken && \
    echo "secret 3 (source code) value: $(cat /run/secrets/repotoken)"
RUN --mount=type=ssh,id=deploykey \
    ssh-add -l
CMD ["true"]
