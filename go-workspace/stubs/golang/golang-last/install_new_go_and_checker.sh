#!/usr/bin/env bash

# Global
STUBS=/data/suz305/go-workspace/stubs
CHECKER_PATH=/data/suz305/go-workspace/my-tools

GO_4_10=/data/suz305/go-workspace/go-4.10

# Download the 4/10 version of Go, and install it

install_go() {
	cd $STUBS/..
	mkdir -p go-4.10/src
	cd go-4.10/src
	git clone https://github.com/golang/go.git
	cd go
	git checkout 245409ea86f20fd9f4167223c2339fb238f9e4b6
	cd src
	./make.bash
	cd ../../..
	GO_4_10=`pwd`
}

# Set env to GO_4_10
export OLD_PATH=$PATH
export OLD_ROOT=$GOROOT

export PATH=$GO_4_10/src/go/bin:$PATH
export GOROOT=$GO_4_10/src/go
go version

# Install the checker with GO_4_10
export GOPATH=$CHECKER_PATH

install_checker_ziheng() {
	cd $CHECKER_PATH/src/git.gradebot.org/zxl381/goconcurrencychecker/cmd/staticchecker
	export CHECK=$CHECKER_PATH/bin/staticchecker_4_10
	go build -o $CHECK
}

cd $CHECKER_PATH/src/github.com/system-pclub/gochecker/cmd/gochecker
export CHECK=$CHECKER_PATH/bin/gochecker_4_10
go build -o $CHECK


export PATH=$OLD_PATH
export ROOT=$OLD_ROOT
