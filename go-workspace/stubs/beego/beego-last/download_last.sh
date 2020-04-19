#!/usr/bin/env bash

# Global
WORKSPACE=/data/suz305/go-workspace/stubs
# set go version to 1.14.2
#export PATH=/data/suz305/go-workspace/go1.14.2/bin:${PATH}
# set go version to 1.13
export PATH=/data/suz305/go-workspace/go/bin:${PATH}

function download_and_checkout() {
    APP="$1"
    APP_URL="$2"
    HASH="$3"

    export GOPATH=${WORKSPACE}/${APP}/${APP}-last
    #rm -rf $GOPATH
    mkdir -p $GOPATH

    export OLD_PATH=$PATH

    export PATH=$GOPATH/bin:$PATH
    go version

    echo ${APP_URL}
    PATH_TO_APP=${GOPATH}/src/${APP_URL}
    rm -rf $PATH_TO_APP
    #GO111MODULE=off go get ${APP_URL} 
    go get ${APP_URL}
    pushd ${PATH_TO_APP} > /dev/null
    git checkout master
    git pull
    git checkout ${HASH}
    #GO111MODULE=off go build
    popd > /dev/null

    mkdir -p ${GOPATH}/results
    export PATH=$OLD_PATH
}

download_and_checkout golang  github.com/golang/go    245409ea86f20fd9f4167223c2339fb238f9e4b6
download_and_checkout kubernetes  github.com/kubernetes/kubernetes    5bfe8fe2b9024f0319c053d5514b491f7c18aad8
download_and_checkout docker  github.com/moby/moby    9c71a2be319371d9ed9ab4429f2f4ddfee732e70
download_and_checkout hugo    github.com/gohugoio/hugo    4a3f2427ed35e304ff72cd0208bf0e4f428d42a4
download_and_checkout gin github.com/gin-gonic/gin    4f208887e1231459672a2a9fc1b2aa40486825d4
download_and_checkout gogs    github.com/gogs/gogs    5753d4cb87388c247e91eaf3ce641d309a45e760
download_and_checkout frp github.com/fatedier/frp 8668fef136baceacf974f7ef4859d108d413a42e
download_and_checkout syncthing   github.com/syncthing/syncthing  046bbdfbd43eb042dc0ce8ff4444ab7d68eedbd3
download_and_checkout etcd    github.com/etcd-io/etcd b62cec9e40d13dd6f795c40155897642420a540e
download_and_checkout prometheus  github.com/prometheus/prometheus    b3cf6ef332a0b41a9ecd2d4a272e339bc3eb740a
download_and_checkout traefik github.com/containous/traefik   f624449ccbf42c56279c594eadc226fed6583993
download_and_checkout fzf github.com/junegunn/fzf 15e2952a2b81cdccec993e1b0e3c5d59d78f8b16
download_and_checkout v2ray-core  github.com/v2ray/v2ray-core 8d75477412e9f88ee9972e36245b9188231ec273
download_and_checkout caddy   github.com/caddyserver/caddy    d3383ced2abb8dfb36e56fa9bbe3136a2a379281
download_and_checkout ethereum    github.com/ethereum/go-ethereum 0851646e480f3fff0d6cdd900fc1034960b993f0
download_and_checkout beego   github.com/astaxie/beego    8f3d1c5f42fce57e83e1c3f7d180477595db7cca
download_and_checkout mkcert  github.com/FiloSottile/mkcert   d58feefc73e728e2abcf84656a0a93d41cb9b167
download_and_checkout tidb    github.com/pingcap/tidb 8891c9d34e08bbcee371432d944a733edbbb3d7d
download_and_checkout grpc    github.com/grpc/grpc-go 7c3fd13027648f7fe3bfc6e16289c65c09493e69
download_and_checkout cockroachdb   github.com/cockroachdb/cockroach    302bb93fdb03588a04c2a962819a6f5ed2695c01
download_and_checkout blotdb github.com/etcd-io/bbolt    6dc724cf03d5792a72f74c73c445c55dc1e2761c