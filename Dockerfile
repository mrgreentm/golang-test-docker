FROM golang:alpine AS builder

WORKDIR /src

COPY . .

# COMPILANDO O CODIGO FONTE
RUN go build -ldflags '-s -w' main.go

FROM scratch
WORKDIR /src
COPY --from=builder /src /src

CMD ["./main"]
