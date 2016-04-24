#!/bin/bash
set -x

if [ $# -eq 1 ]
then
	local=$1
else
	echo "arg error" >&2
	echo "usage: bash ./shell/mapper 1(local)|0(cluster)" >&2
	exit 1
fi

if [ $local -eq 1 ]
then
	conf="./conf/"
	bin="./bin/"
	shell="./shell/"
else
	conf="./"
	bin="./"
	shell="./"
fi

source $conf/common.conf || exit 1
source $conf/func.sh || exit 1

if [ $local -eq 1 ]
then
	hadoop_fs="$local_hadoop dfs"
else
	hadoop_fs="$cluster_hadoop_fs"
fi

chmod +x $bin/*

cat - > input.reducer
wc -l input.reducer >&2
ls -l input.reducer >&2
head input.reducer >&2

exit 0

