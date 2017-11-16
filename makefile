mac:
	mv its-bash.sh ~/.its-bash.sh
	mv its-mac-bash.sh ~/.its-local-bash.sh
	echo "source ~/.its-bash.sh" >> ~/.bash_profile
	source ~/.bash_profile
	rm -rf `pwd`
