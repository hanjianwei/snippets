#!/usr/bin/env zsh

export DEPLOY_SSH_USER="admin"
export DEPLOY_SSH_KEYFILE="/etc/stunnel/stunnel.pem"
export DEPLOY_SSH_CERTFILE="/etc/stunnel/stunnel.pem"
export DEPLOY_SSH_CAFILE="/etc/stunnel/uca.pem"
export DEPLOY_SSH_REMOTE_CMD="/etc/init.d/stunnel.sh restart"

~/.acme.sh/acme.sh --deploy -d q.hjw.ink --deploy-hook ssh
