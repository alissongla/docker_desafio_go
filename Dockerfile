FROM golang:1.16-alpine AS builder

WORKDIR $GOPATH/src/github.com/alissongla/docker_desafio_go

COPY hello .

RUN go mod download

RUN go build -o /hello

FROM scratch

WORKDIR /

COPY --from=builder /hello /hello

CMD [ "/hello" ]