touch ~/.bash_profile
touch ~/.bash_aliases
touch ~/.bashrc
touch ~/.bash_local.sh

mkdir -p ~/.bash
curl https://gist.githubusercontent.com/itsnamgyu/30e916f33a923fc19882b6ec76510c84/raw/6e5511d1c1e2d8aa34c8e24b2435f0d346218d0a/git-prompt.bash > ~/.bash/git-prompt.bash

mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_profile ~/.bash_profile.bak
mv ~/.bash_aliases ~/.bash_aliases.bak

echo "source ~/.bash_profile" > ~/.bashrc
cp src/profile.sh ~/.bash_profile
cp src/alias.sh ~/.bash_aliases

source ~/.bash_profile
