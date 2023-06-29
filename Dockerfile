FROM golang:1.20.5-alpine3.18 as builder
WORKDIR /go/src/app
COPY app .
RUN go mod init main
RUN go build -o main .

FROM scratch
WORKDIR /app
COPY --from=builder /go/src/app .
CMD ["./main"]