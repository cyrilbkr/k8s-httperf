FROM debian:stretch-slim

RUN apt-get update && apt-get install -y httperf && rm -rf /var/lib/apt/lists/*    

WORKDIR /root

