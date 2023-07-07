FROM golang:latest AS build

WORKDIR /app

COPY go.*  *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /app/app


FROM scratch

COPY --from=build /app/app .

EXPOSE 8080

CMD ["./app"]