FROM golang:1.14.3-alpine AS build
WORKDIR /app
COPY . .
RUN go build -a -gcflags=all="-l -B -wb=false" -ldflags="-w -s" -o /app/hello .

FROM scratch AS bin
COPY --from=build /app/hello /
CMD ["./hello"]
