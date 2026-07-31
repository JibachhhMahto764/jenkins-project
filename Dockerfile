FROM golang:1.26.3 as builder
WORKDIR /application
COPY . .
RUN go mod init application 
RUN go mod tidy
RUN go build -o app ./cmd/app

FROM scratch
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=builder /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
COPY --from=builder  /application/app  /application/app 
ENTRYPOINT ["/application/app"]
