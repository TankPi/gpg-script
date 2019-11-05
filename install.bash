#! /usr/bin/env bash
sudo apt update
sudo apt install scdaemon haveged

gpg --import <(wget -O - https://keys.openpgp.org/vks/v1/by-fingerprint/B9D414F2F2C307E284396DA96823D93F4C18E78B)

if ! grep -q 'enable-ssh-support' ~/.gnupg/gpg-agent.conf; then
    echo 'enable-ssh-support' >> ~/.gnupg/gpg-agent.conf
fi

if ! grep -q '1B75455B5E2C0A4B607951ABEE8F3C78D75F3CFA' ~/.gnupg/sshcontrol; then
    echo '1B75455B5E2C0A4B607951ABEE8F3C78D75F3CFA' >> ~/.gnupg/sshcontrol
fi

if ! grep -q '~/.gpg-eversf/setup.bash' ~/.bashrc; then
    echo '
# Load gpg ssh 
source ~/.gpg-eversf/setup.bash' >> ~/.bashrc
fi
