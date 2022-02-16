ARG UBUNTU_VERSION=18.04
ARG APP_PATH=/opt/dnsseed

FROM ubuntu:$UBUNTU_VERSION

LABEL maintainer="Sven Skender (@sskender)"

RUN apt-get update -y
RUN apt-get install git build-essential libboost-all-dev libssl-dev libcurl4-openssl-dev libconfig++-dev -y
RUN apt-get install python3 python3-pip -y

RUN pip3 install cloudflare

ARG APP_PATH
ENV APP_PATH=$APP_PATH

WORKDIR $APP_PATH

COPY . .

RUN make

ENTRYPOINT ["./dnsseed"]
