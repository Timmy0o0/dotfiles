# How to install

## Install Nix

## For Arch

```bash
just hm-init
just hm
```

change shell to zsh

```bash
sudo sh -c "echo '/home/timmy/.nix-profile/bin/zsh' >> /etc/shells"
chsh -s $(which zsh)
```

## For Mac

```bash
# check hostname and username
# scutil --get LocalHostName
# check hostPlatform
# change hostPlatform in configuration.nix | M or intel
just darwin-init
just darwin
```
