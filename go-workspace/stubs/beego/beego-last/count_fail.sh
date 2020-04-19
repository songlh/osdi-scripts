#!/usr/bin/env bash
                                                                                                                        # Global
WORKSPACE=/data/suz305/go-workspace/stubs

function check() {
    APP="$1"
    APP_URL="$2"
    HASH="$3"

    RESULT_PATH=${WORKSPACE}/${APP}/${APP}-last/results/
    #RESULT=${RESULT_PATH}/FU.13.detect.result
    RESULT=${RESULT_PATH}/FA.detect.result
    local succ=`grep "^Successful\." $RESULT | wc -l`
    local fail=`grep "^Fail\." $RESULT | wc -l`
    echo "$APP" $succ $fail
#    tail -3 $RESULT
}

echo "APP" "SUCC" "FAIL"
check golang  github.com/golang/go    245409ea86f20fd9f4167223c2339fb238f9e4b6
check kubernetes  github.com/kubernetes/kubernetes    5bfe8fe2b9024f0319c053d5514b491f7c18aad8
check docker  github.com/moby/moby    9c71a2be319371d9ed9ab4429f2f4ddfee732e70
check hugo    github.com/gohugoio/hugo    4a3f2427ed35e304ff72cd0208bf0e4f428d42a4
check gin github.com/gin-gonic/gin    4f208887e1231459672a2a9fc1b2aa40486825d4
check gogs    github.com/gogs/gogs    5753d4cb87388c247e91eaf3ce641d309a45e760
check frp github.com/fatedier/frp 8668fef136baceacf974f7ef4859d108d413a42e
check syncthing   github.com/syncthing/syncthing  046bbdfbd43eb042dc0ce8ff4444ab7d68eedbd3
check etcd    github.com/etcd-io/etcd b62cec9e40d13dd6f795c40155897642420a540e
check prometheus  github.com/prometheus/prometheus    b3cf6ef332a0b41a9ecd2d4a272e339bc3eb740a
check traefik github.com/containous/traefik   f624449ccbf42c56279c594eadc226fed6583993
check fzf github.com/junegunn/fzf 15e2952a2b81cdccec993e1b0e3c5d59d78f8b16
check v2ray-core  github.com/v2ray/v2ray-core 8d75477412e9f88ee9972e36245b9188231ec273
check caddy   github.com/caddyserver/caddy    d3383ced2abb8dfb36e56fa9bbe3136a2a379281
check ethereum    github.com/ethereum/go-ethereum 0851646e480f3fff0d6cdd900fc1034960b993f0
check beego   github.com/astaxie/beego    8f3d1c5f42fce57e83e1c3f7d180477595db7cca
check mkcert  github.com/FiloSottile/mkcert   d58feefc73e728e2abcf84656a0a93d41cb9b167
check tidb    github.com/pingcap/tidb 8891c9d34e08bbcee371432d944a733edbbb3d7d
check grpc    github.com/grpc/grpc-go 7c3fd13027648f7fe3bfc6e16289c65c09493e69
check cockroachdb   github.com/cockroachdb/cockroach    302bb93fdb03588a04c2a962819a6f5ed2695c01
check blotdb github.com/etcd-io/bbolt    6dc724cf03d5792a72f74c73c445c55dc1e2761c