GOPATH=${PWD}
export GOPATH=${GOPATH}
#export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'getting leak test tool...'
go get github.com/system-pclub/leaktest
go version

PATCHER=/data/suz305/go-workspace/my-tools/bin/gl-1-patcher
TMPPATH=${GOPATH}/tmp


PROPATH=${GOPATH}/src/go.etcd.io/etcd/integration
BUGGY_VERSION=fd2dddb39f6afd88878daf140e1573df118eb98a
BUGFILE=${GOPATH}/src/go.etcd.io/etcd/integration/v3_watch_test.go

echo 'bugfile: ' $BUGFILE

INJECTBUGFILE=${GOPATH}/inject.go
echo 'inject file: ' $INJECTBUGFILE