echo "BASE_BASH=$BASE_BASH" | cat - src/base.sh > temp && cp temp src/base.sh
cat src/base.sh > $BASE_BASH
rm temp
mkdir ~/.bash
cp src/local.sh ~/.bash
cp src/alias.sh ~/.bash
source $BASE_BASH
