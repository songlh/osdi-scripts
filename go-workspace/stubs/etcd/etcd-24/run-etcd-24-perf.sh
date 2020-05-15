GOPATH=${PWD}
PATCHER=/data/suz305/go-workspace/my-tools/bin/gl-1-patcher
TMPPATH=${GOPATH}/tmp
OVERSCR=/data/suz305/go-workspace/my-tools/src/github.com/sfzhu93/go-bug-patcher/scripts/overhead.py

PROPATH=${GOPATH}/src/go.etcd.io/etcd
BUGGY_VERSION=fd2dddb39f6afd88878daf140e1573df118eb98a
BUGFILE=${PROPATH}/integration/v3_watch_test.go
BUGLINE=

export GOPATH=$GOPATH
mkdir -p ${TMPPATH}
rm -rf ${TMPPATH}/*.*
rm -rf ${TMPPATH}/*


cd ${PROPATH}

echo 'reseting to the buggy version...'

git reset --hard ${BUGGY_VERSION}

echo 'reseting to the buggy version...'

git reset --hard ${BUGGY_VERSION}

for ((n=0;n<10;n++))
do
        echo 'run the original' integration/V3WatchWithPrevKV '...'
        cd integration
        go test -run V3WatchWithPrevKV >> ${TMPPATH}/buggy.time
        cd ${PROPATH}
done

echo 'patching...'

${PATCHER} ${BUGFILE} ${BUGLINE}

for ((n=0;n<10;n++))
do
        echo 'run the patched' integration/V3WatchWithPrevKV '...'
        cd integration
        go test -run V3WatchWithPrevKV >> ${TMPPATH}/patch.time
        cd ${PROPATH}
done

echo
echo

python ${OVERSCR} ${TMPPATH}/buggy.time ${TMPPATH}/patch.time 10
