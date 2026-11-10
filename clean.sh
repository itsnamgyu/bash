DIR=$(pwd)
if [ ! -f "$DIR/install.sh" ] || [ ! -d "$DIR/src" ]; then
	echo "clean.sh: run this from the cloned bash repo directory (install.sh and src/ not found in $DIR)"
	return 1 2>/dev/null || exit 1
fi
cd ..
rm -rf "$DIR"
