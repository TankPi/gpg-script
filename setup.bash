#! /usr/bin/env bash
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socketi)
gpgconf --launch gpg-agent
