#!/bin/sh

# config trojan
cat << EOF > /etc/trojan-go/config.json
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": $PORT,
    "remote_addr": "www.apple.com",
    "remote_port": 80,
    "log_level": 0,
    "password": [
	  "$PASSWORD"
    ],
    "ssl":{
      "cert"
      "key"
  },
  $CUSTOM
    "websocket": {
    "enabled": true,
    "path": "/shop"
    }
}
EOF

# run trojan
/usr/local/bin/trojan-go -config /etc/trojan-go/config.json
