FROM golang:1.22.5 AS base

WORKDIR /app

COPY . .

RUN go mod download && go build -o main

FROM gcr.io/distroless/base

COPY --from=base /app/main .

COPY --from=base /app/static ./static

EXPOSE 8080

CMD ["./main"]




