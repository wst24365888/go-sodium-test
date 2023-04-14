FROM golang:1.20-bullseye AS builder

WORKDIR /go/src/github.com/wst24365888/go-sodium-test

RUN apt update && apt install -y libsodium-dev

COPY . .

RUN go mod download

RUN go build -o /go/bin/go-sodium-test

FROM debian:bullseye-slim

RUN apt update && apt install -y libsodium23

COPY --from=builder /go/bin/go-sodium-test /go/bin/go-sodium-test

ENTRYPOINT ["/go/bin/go-sodium-test"]