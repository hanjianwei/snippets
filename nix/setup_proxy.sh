#!/usr/bin/env bash

mkdir /run/systemd/system/nix-daemon.service.d/
cat <<EOF >/run/systemd/system/nix-daemon.service.d/override.conf
[Service]
Environment="https_proxy=socks5h://$1:7890"
EOF
systemctl daemon-reload
systemctl restart nix-daemon
