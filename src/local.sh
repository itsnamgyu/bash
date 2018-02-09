function so-gang {
	mkdir ~/Downloads/cspro`date +%y%m%d`
	scp -r cse20161662@cspro.sogang.ac.kr:. ~/Downloads/cspro`date +%y%m%d`
	open ~/Downloads/cspro`date +%y%m%d`
}
