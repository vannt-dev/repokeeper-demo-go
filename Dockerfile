FROM golang:1.25-alpine AS test
WORKDIR /src
COPY . .
RUN go vet ./... && go test ./...

FROM alpine:3.22
COPY --from=test /src/go.mod /fixture/go.mod
USER 10001
CMD ["cat", "/fixture/go.mod"]
