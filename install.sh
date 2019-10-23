touch ~/.bash_profile
touch ~/.bash_aliases
touch ~/.bashrc
touch ~/.bash_local.sh

mkdir ~/.bash
curl https://raw.githubusercontent.com/itsnamgyu/git/master/contrib/completion/git-prompt.sh > ~/.bash/git-prompt.sh

mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_profile ~/.bash_profile.bak
mv ~/.bash_aliases ~/.bash_aliases.bak

echo "source ~/.bash_profile" > ~/.bashrc
cp src/profile.sh ~/.bash_profile
cp src/alias.sh ~/.bash_aliases

source ~/.bash_profile
