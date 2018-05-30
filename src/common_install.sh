cat src/base.sh > $BASE_BASH
echo "export BASE_BASH=$BASE_BASH" | cat - $BASE_BASH > temp
mv temp $BASE_BASH
mkdir -p ~/.bash
cp src/local.sh ~/.bash
cp src/alias.sh ~/.bash
source $BASE_BASH
