touch ~/.bash_profile
touch ~/.bash_aliases
touch ~/.bashrc
touch ~/.bash_local.sh

mkdir -p ~/.bash
curl -fsSL https://raw.githubusercontent.com/git/git/v2.50.1/contrib/completion/git-prompt.sh -o ~/.bash/git-prompt.bash || echo "warning: git-prompt download failed, prompt will have no git info"

mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_profile ~/.bash_profile.bak
mv ~/.bash_aliases ~/.bash_aliases.bak

echo "source ~/.bash_profile" > ~/.bashrc
cp src/profile.sh ~/.bash_profile
cp src/alias.sh ~/.bash_aliases

source ~/.bash_profile
