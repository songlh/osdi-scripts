#!/usr/bin/env bash

# Global
WORKSPACE=/data/suz305/go-workspace/stubs
CHECKER_PATH=/data/suz305/go-workspace/my-tools

# Download the 4/10 version of Go, and install it
cd $WORKSPACE/..
mkdir -p lib/go_4_10/src
cd lib/go_4_10/src
git clone https://github.com/golang/go.git
cd go
git checkout 245409ea86f20fd9f4167223c2339fb238f9e4b6
cd src
./make.bash
cd ../../..
GO_4_10=`pwd`

# Set env to GO_4_10
export OLD_PATH=$PATH
export OLD_ROOT=$GOROOT

export PATH=$GO_4_10/src/go/bin:$PATH
export GOROOT=$GO_4_10/src/go
go version

# Install the checker with GO_4_10
export GOPATH=$CHECKER_PATH
cd $CHECKER_PATH/src/git.gradebot.org/zxl381/goconcurrencychecker/cmd/staticchecker
export CHECK=$CHECKER_PATH/bin/staticchecker_4_10
go build -o $CHECK

export PATH=$OLD_PATH
export ROOT=$OLD_ROOT