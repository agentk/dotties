# dotfiles

## Bootstrap

### LXC Additional Setup

```bash
# Create the LXC container
bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/docker.sh)"
ssh-copy-id -i ~/.ssh/id_ed25519 root@hostname
ssh root@hostname
adduser karl
usermod -aG docker karl
echo 'Acquire::http::Proxy "http://192.168.0.11:3142";' | sudo tee /etc/apt/apt.conf.d/00cacher
```

```
lxc.idmap: u 0 100000 1000
lxc.idmap: u 1000 1000 1
lxc.idmap: u 1001 101001 64535
lxc.idmap: g 0 100000 44
lxc.idmap: g 44 44 1
lxc.idmap: g 45 100045 59
lxc.idmap: g 104 104 1
lxc.idmap: g 105 100105 895
lxc.idmap: g 1000 1000 1
lxc.idmap: g 1001 101001 64535
```

### Prerequisites

- Remove the installer CD ROM line if needed
- As root:

```bash
nano /etc/apt/sources.list
apt update && apt upgrade -y && apt install -y git sudo vim zsh
```

### Setup

- Copy a public ssh key fingerprint to the host
- Ssh into the host
- Generate a new ssh key for the host
- Copy the public key to Gitea authorised keys [https://gitea.bowden.zone/user/settings/keys](https://gitea.bowden.zone/user/settings/keys)
- Clone dotfiles
- Run bootstrap

```bash
ssh-copy-id -i ~/.ssh/id_ed25519 karl@192.168.64.13
ssh karl@192.168.64.13
ssh-keygen
cat ~/.ssh/id_rsa.pub
git clone ssh://git@docker.bvd.zone:10022/karl/dotfiles.git ~/.dotfiles
mkdir -p ~/.config/sops/age
# Copy private age key into ~/.config/sops/age/keys.txt
vim ~/.config/sops/age/keys.txt
cd ~/.dotfiles
mv ~/.bashrc ~/.bashrc.bak
./bootstrap

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

