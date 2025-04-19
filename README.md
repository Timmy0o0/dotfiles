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
# need full disk access
just darwin-init
just darwin
```

## Secret Keys

```bash
# add ai api key in secrets
# ignore secrets git changes
git update-index --skip-worktree nix/home-manager/apps/common/zsh/secrets.nix
# create ssh key
ssh-keygen -t ed25519 -C "yangtmeco@outlook.com"
```
