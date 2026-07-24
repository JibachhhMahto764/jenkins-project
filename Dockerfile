FROM golang:1.26.3 as builder
WORKDIR /application
COPY . .
RUN go mod init application 
RUN go mod tidy
RUN go build -o app

FROM scratch
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /application/app
ENTRYPOINT["/application/app"]
