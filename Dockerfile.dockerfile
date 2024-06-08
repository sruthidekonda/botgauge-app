# Stage 1
FROM golang:1.20-alpine AS build
WORKDIR /app
COPY . .
RUN go build -o main .

# Stage 2
FROM alpine:latest
WORKDIR /root/
COPY --from=build /app/main .
EXPOSE 8080
CMD ["./main"]
