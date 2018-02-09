BASE_BASH=~/.bash_profile
echo 'BASE_BASH=$BASE_BASH' | cat - base.sh > temp && cp temp base.sh
cat base.sh > $BASE_BASH
mkdir ~/.bash
cp local.sh ~/.bash
cp alias.sh ~/.bash
source $BASE_BASH
