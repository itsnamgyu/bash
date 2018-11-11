# bash-man
It's my bash profile stuff

## Usage
Currently supported operating systems: mac, ubuntu
```bash
source <os>_install.sh
make clean
```

### To Edit Aliases

This automatically `source`s your changes.

```bash
rba
```

### To Edit Local Bash Profile Stuff

This also automatically `source`s your changes.

```bash
rbl
```

## Better ls: exa

This automatically aliases ls to [exa](https://the.exa.website): a modern replacement for ls.
Install like this:

### macOS

```bash
brew install exa
```

### ubuntu

```bash
sudo apt install unzip
wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
rm exa-linux-x86_64*.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa
```
