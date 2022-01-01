#!/bin/bash

if [[ -z $1 ]]
then
    echo "please provide a version"
    exit 1
fi

wget https://github.com/Kitware/CMake/releases/download/v$1/cmake-$1.tar.gz

if [[ $? != 0 ]]
then
    exit 1
fi

tar -xf cmake-$1.tar.gz \
&& cd cmake-$1    \
&& ./bootstrap \
&& make \
&& make install