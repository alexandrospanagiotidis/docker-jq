ARG JQ_VERSION=1.6


FROM alpine:latest AS jq-build

ADD https://github.com/stedolan/jq/releases/download/jq-$JQ_VERSION/jq-linux64 /usr/local/bin/jq

RUN chmod +x /usr/local/bin/jq


FROM gcr.io/distroless/static-debian10:latest AS jq

COPY --from=jq-build /usr/local/bin/jq /usr/local/bin/jq

ENTRYPOINT [ "/usr/local/bin/jq" ]
