sogang="cspro.sogang.ac.kr"
mysogang="cse20161662@$sogang"
release="163.239.26.104"
myrelease="honamgyu@$release"

alias sgce="cd ~/src/sgce"
alias release="cd ~/src/release"
alias ssai="cd ~/src/samsung-go"
alias sgds="cd ~/src/sgds"
alias tetris="cd ~/src/sg-tetris"
alias django="cd ~/src/django"

function rl {
	ssh $myrelease
}

function ho {
	ssh $mysogang
}

function hoho {
	mkdir ~/Downloads/cspro`date +%y%m%d`
	scp -r $mysogang:. ~/Downloads/cspro`date +%y%m%d`
	open ~/Downloads/cspro`date +%y%m%d`
}

function aws {
	ssh aws
}
