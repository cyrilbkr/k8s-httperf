FROM debian:stretch-slim


ENV SERVER=localhost
ENV URI=/
ENV PORT=443
ENV CONNECTIONS=1000
ENV RATE=10
ENV TIMEOUT=2

RUN apt-get update && apt-get install -y httperf

ENTRYPOINT httperf --server $SERVER --port $PORT --num-conns $CONNECTIONS --rate $RATE --uri $URI  --timeout $TIMEOUT 
