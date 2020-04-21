#!/usr/bin/env bash

# Global
WORKSPACE=/data/suz305/go-workspace/stubs
# set go version to 1.14.2
#export PATH=/data/suz305/go-workspace/go1.14.2/bin:${PATH}
# set go version to 1.13
export PATH=/data/suz305/go-workspace/go/bin:${PATH}

function download_and_checkout_go() {
    APP="$1"
    APP_URL="$2"
    HASH="$3"

    export GOPATH=${WORKSPACE}/${APP}/${APP}-last
    #rm -rf $GOPATH
    mkdir -p $GOPATH

    go version

    echo ${APP_URL}
    PATH_TO_APP=${GOPATH}/src/${APP_URL}
    rm -rf $PATH_TO_APP
    #GO111MODULE=off go get ${APP_URL} 

    # For Go, we don't use go get
    # go get ${APP_URL} 
    # pushd ${PATH_TO_APP} > /dev/null
    # git checkout master
    # git pull

    # For Go, we use git clone
    mkdir -p $PATH_TO_APP/..
    cd  $PATH_TO_APP/..
    rm -d go
    git clone https://github.com/golang/go.git
    cd go

    git checkout ${HASH}
    #GO111MODULE=off go build
    # popd > /dev/null

    # mv all SDK to $GOPATH/src
    mv ./src/* $GOPATH/src/
    cd $GOPATH
    rm -rf $PATH_TO_APP

    mkdir -p ${GOPATH}/results
    
}

download_and_checkout_go golang  github.com/golang/go    245409ea86f20fd9f4167223c2339fb238f9e4b6