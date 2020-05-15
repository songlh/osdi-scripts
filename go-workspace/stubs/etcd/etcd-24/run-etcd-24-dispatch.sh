GOPATH=${PWD}
BUGFILE=integration/v3_watch_test.go
LINENO=123
COMMITNO=fd2dddb39f6afd88878daf140e1573df118eb98a

PROJ_REL_PATH=go.etcd.io/etcd
EXE=/data/suz305/go-workspace/my-tools/bin/staticchecker

cd ${GOPATH}/src/${PROJ_REL_PATH}
git reset --hard $COMMITNO
cd ${GOPATH}

#${EXE} -path=${GOPATH}/src/${PROJ_REL_PATH}/${BUGFILE} -include=${PROJ_REL_PATH} -r -lineno=${LINENO}
${EXE} -path=${GOPATH}/src/${PROJ_REL_PATH}/${BUGFILE} -lineno=${LINENO}
