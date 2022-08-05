#!/bin/bash
echo "Testing for zone transfer"
echo
echo
for i in $(cat domain.txt);do fierce --domian $i;done | tee $1.txt
