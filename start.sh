#!/bin/bash

# Parameters:  none

# PATHS
paths="-pa"
paths=$paths" $PWD/ebin"
paths=$paths" $PWD/deps/*/ebin"

start_opts="$paths"

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
     exename=erl
else
    exename='start //MAX werl.exe'
    #exename='erl.exe'
fi

# DDERL start options
echo "------------------------------------------"
echo "Starting ucpyrl (Opts)"
echo "------------------------------------------"
echo "EBIN Path : $paths"
echo "------------------------------------------"

# Starting ucpyrl
$exename $start_opts -s ucpyrl
