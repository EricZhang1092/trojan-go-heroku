#!/bin/sh

# config trojan
install -d /etc/trojan-go/

# run trojan
/usr/local/bin/trojan-go -config $PROGRAM_DIR$/tro/config.json
