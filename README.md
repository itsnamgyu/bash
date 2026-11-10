# bash
My bash profile and aliases, kept in sync across machines.

## Usage
Currently supported operating systems: mac, debian linux
```bash
source install.sh
source clean.sh
```

`install.sh` replaces `~/.bash_profile` and `~/.bash_aliases` with the versions in `src/`, makes `~/.bashrc` source the profile, and keeps `.bak` copies. Machine-specific settings go in `~/.bash_local.sh`, which the profile sources last.

### To Edit the Profile

```bash
rb
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
