#!/bin/sh

# config trojan
install -d /etc/trojan-go/

# run trojan
/usr/local/bin/trojan-go -config /usr/local/bin/tro/config.json
