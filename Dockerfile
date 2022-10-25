# syntax=docker/dockerfile:1
# build stage
FROM golang:1.19-alpine 
#FROM golang:1.19-alpine
#RUN apk add --update --no-cache bash ca-certificates curl git make tzdata
#RUN go install github.com/NightOwl998/random-scheduler@latest 
#RUN apk add --no-cache git
#RUN mkdir -p ./random-scheduler
#ADD Gopkg.* Makefile /go/src/github.com/martonsereg/scheduler/
WORKDIR ./random-scheduler
#RUN make vendor
#ADD . /go/src/github.com/martonsereg/scheduler
#RUN go mod d
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY . .
RUN go build -o /scheduler
CMD [ "./scheduler" ]
#RUN make build

#FROM alpine:3.7
#COPY --from=backend /usr/share/zoneinfo/ /usr/share/zoneinfo/
#COPY --from=backend /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
#COPY --from=backend /go/src/github.com/martonsereg/scheduler/build/scheduler /bin

#ENTRYPOINT ["/bin/scheduler"]

