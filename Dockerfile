# Build
FROM golang:1.8 as build
MAINTAINER Sebastian Doell <sebastian@katallaxie.me>

ARG VERSION
ENV MESOS_DNS_VERSION ${VERSION:-0.6.0}

RUN \
    # Clone
    go-wrapper download github.com/mesosphere/mesos-dns && \
    # Change to version
    cd /go/src/github.com/mesosphere/mesos-dns && \
    git checkout tags/v${MESOS_DNS_VERSION} && \
    # Compile
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o mesos-dns .

# Main 
FROM alpine:3.6

COPY \
    --from=build /go/src/github.com/mesosphere/mesos-dns/mesos-dns /

COPY \
     init.sh /

RUN \
    apk add --no-cache curl ca-certificates openssl && \
    chmod +x /mesos-dns && \
    chmod +x /init.sh

VOLUME /tmp

EXPOSE 53 8053 8123

ENTRYPOINT ["/init.sh"]
