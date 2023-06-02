FROM alpine

RUN apk update && apk add gcc && apk add musl-dev

COPY . /app/
WORKDIR /app

RUN gcc -o test test.c

CMD ["./test"]
