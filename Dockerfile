FROM golang:alpine AS builder
WORKDIR /
RUN apk add git make &&\
    git clone https://github.com/p4gefau1t/trojan-go.git &&\
    cd trojan-go &&\
    make &&\
    wget https://github.com/v2fly/domain-list-community/raw/release/dlc.dat -O build/geosite.dat &&\
    wget https://github.com/v2ray/geoip/raw/release/geoip.dat -O build/geoip.dat

FROM alpine
WORKDIR /
COPY --from=builder /trojan-go/build /usr/local/bin/

EXPOSE 3000

ADD /tro/config.json /usr/local/bin/config.json
RUN chmod +x /usr/local/bin/config.json

ADD /tro/cert.crt /usr/local/bin/cert.crt
RUN chmod +x /usr/local/bin/cert.crt

ADD /tro/private.key /usr/local/bin/private.key
RUN chmod +x /usr/local/bin/private.key

ADD trojan.sh /trojan.sh
RUN chmod +x /trojan.sh
CMD /trojan.sh
