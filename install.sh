touch ~/.bash_profile
touch ~/.bash_alias.sh
touch ~/.bashrc

mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_profile ~/.bash_profile.bak
mv ~/.bash_alias.sh ~/.bash_alias.bak

echo "source ~/.bash_profile" > ~/.bashrc
cp src/profile.sh ~/.bash_profile
cp src/alias.sh ~/.bash_alias.sh

source ~/.bash_profile
