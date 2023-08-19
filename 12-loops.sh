#! /bin/bash

# All args are in $@

for i in $@
do
    yum install $i -y
done