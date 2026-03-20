FROM ubuntu:22.04

RUN apt-get update && apt-get install -y tini

WORKDIR /app

COPY app.sh .

RUN chmod +x app.sh

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["./app.sh"]