mv ~/.bashrc ~/.bashrc.bck
mv ~/.bash_profile ~/.bash_profile.bck

touch ~/.bash_profile
touch ~/.bash_alias
touch ~/.bashrc

echo "source ~/.bash_profile" >> ~/.bashrc

cat src/profile.sh >> ~/.bash_profile
cat src/alias.sh >> ~/.bash_alias.sh

source ~/.bash_profile
