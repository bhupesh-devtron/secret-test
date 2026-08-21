FROM alpine:3.19
ARG BUILD_ENV
RUN echo "build env: $BUILD_ENV"
RUN --mount=type=secret,id=npmrc \
    test -f /run/secrets/npmrc && \
    echo "secret found, sha256: $(sha256sum /run/secrets/npmrc | cut -d' ' -f1)"
CMD ["true"]
