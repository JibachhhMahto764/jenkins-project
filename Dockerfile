# Build Stage
FROM golang:1.26.3 AS builder

WORKDIR /application

# Copy dependency files first
COPY go.mod go.sum ./

RUN go mod download

# Copy application source
COPY . .

# Build static binary
RUN CGO_ENABLED=0 GOOS=linux go build -o app .

# Runtime Stage
FROM scratch

COPY --from=builder /application/app /application/app

EXPOSE 8080

ENTRYPOINT ["/application/app"]
