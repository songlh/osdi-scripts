#!/usr/bin/env bash

# Global
WORKSPACE=/data/suz305/go-workspace/stubs
# set go version to 1.14.2
#export PATH=/data/suz305/go-workspace/go1.14.2/bin:${PATH}
# set check path
#export CHECK=/data/suz305/go-workspace/my-tools/bin/FU
# set go version to 1.13
#export PATH=/data/suz305/go-workspace/go/bin:${PATH}
# set check path
#export CHECK=/data/suz305/go-workspace/my-tools/bin/FU-13
export CHECK=/data/suz305/go-workspace/my-tools/bin/staticchecker
# set go version to 1.12.9
#export PATH=/data/suz305/go-workspace/go1.12.9/bin:${PATH}
# set check path
#export CHECK=/data/suz305/go-workspace/my-tools/bin/FU-12

function check() {
    APP="$1"
    APP_URL="$2"

    export GOPATH=${WORKSPACE}/${APP}/${APP}-last

    export OLD_PATH=$PATH

    export PATH=$GOPATH/bin:$PATH

    PATH_TO_APP=${GOPATH}/src/${APP_URL}

    mkdir -p ${GOPATH}/results

    pushd ${PATH_TO_APP} > /dev/null
    $CHECK -path=${PATH_TO_APP} -include=${APP_URL} -r=true  > ${GOPATH}/results/FU.detect.result; echo "${APP} done" &
    popd > /dev/null

    export PATH=$OLD_PATH
}

function check_go() {
    APP="$1"
    APP_URL="$2"
    HASH="$3"

    export GOPATH=${WORKSPACE}/${APP}/${APP}-last
    mkdir -p $GOPATH

    export OLD_PATH=$PATH

    export PATH=$GOPATH/bin:$PATH

    PATH_TO_APP=${GOPATH}/src/${APP_URL}

    mkdir -p ${GOPATH}/results

    pushd ${PATH_TO_APP} > /dev/null
    $CHECK -path=${PATH_TO_APP} -include=${APP_URL} -go -r > ${GOPATH}/results/FU.S.detect.result; echo "${APP} done" &
    popd > /dev/null

    export PATH=$OLD_PATH
}

#check golang  /   
check kubernetes k8s.io/kubernetes 
#check docker  github.com/moby/moby    9c71a2be319371d9ed9ab4429f2f4ddfee732e70    &
check hugo    github.com/gohugoio/hugo    
check gin github.com/gin-gonic/gin    
check gogs    github.com/gogs/gogs  
check frp github.com/fatedier/frp 
check syncthing   github.com/syncthing/syncthing 
check etcd    go.etcd.io/etcd
check prometheus  github.com/prometheus/prometheus 
#check traefik github.com/containous/traefik   f624449ccbf42c56279c594eadc226fed6583993   &
check fzf github.com/junegunn/fzf
#check v2ray-core  github.com/v2ray/v2ray-core 8d75477412e9f88ee9972e36245b9188231ec273   &
check caddy   github.com/caddyserver/caddy 
check ethereum    github.com/ethereum/go-ethereum
check beego   github.com/astaxie/beego   
check mkcert  github.com/FiloSottile/mkcert
#check tidb    github.com/pingcap/tidb 8891c9d34e08bbcee371432d944a733edbbb3d7d   &
check grpc    google.golang.org/grpc 
check cockroachdb   github.com/cockroachdb/cockroach
check blotdb go.etcd.io/bbolt
