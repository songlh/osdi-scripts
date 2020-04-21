#!/usr/bin/env bash

# Global
WORKSPACE=/data/suz305/go-workspace/stubs
export CHECK=/data/suz305/go-workspace/my-tools/bin/staticchecker_4_10
GO_4_10=/data/suz305/go-workspace/lib/go_4_10

function check_go() {
    APP="$1"
    APP_URL="$2"

    export GOPATH=${WORKSPACE}/${APP}/${APP}-last

    export OLD_PATH=$PATH
    export OLD_ROOT=$GOROOT

    export PATH=$GO_4_10/src/go/bin:$PATH
    export GOROOT=$GO_4_10/src/go
    go version

    PATH_TO_APP=${GOPATH}/src/

    pushd ${PATH_TO_APP} > /dev/null
    $CHECK -path=${PATH_TO_APP} -include=${APP_URL} -r > ${GOPATH}/results/FU.S.detect.result; echo "${APP} done" &
    popd > /dev/null

    export PATH=$OLD_PATH
    export ROOT=$OLD_ROOT
}

check_go golang  /