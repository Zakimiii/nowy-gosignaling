FROM golang:latest as builder

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR /app/main
COPY . .
EXPOSE $PORT
ENV PORT $PORT
RUN go get -u github.com/gorilla/websocket && \
    go get -u github.com/comail/colog && \
    go get -u github.com/gorilla/mux

RUN cp docker-server-entrypoint.sh /usr/local/bin/ && \
  chmod +x /usr/local/bin/docker-server-entrypoint.sh
ENTRYPOINT /usr/local/bin/docker-server-entrypoint.sh
