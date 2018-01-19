mac:
	cp its-bash.sh ~/.its-bash.sh
	cp its-mac-bash.sh ~/.its-local-bash.sh
	echo ". ~/.its-bash.sh" >> ~/.bash_profile
	. ~/.bash_profile

linux:
	cp its-bash.sh ~/.its-bash.sh
	touch ~/.its-local-bash.sh
	echo ". ~/.its-bash.sh" >> ~/.bashrc
	. ~/.bashrc

clean:
	rm -rf `pwd`
