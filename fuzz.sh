#!/bin/bash
echo
echo
echo "Fuzzing on target"
echo
for i in $(cat flipkart.com/recon/test2.txt);do ffuf -u $i/FUZZ  -w /usr/share/wordlists/rockyou.txt -mc 200;done | tee $i.txt
echo "SSLscanning targets"
echo
for d in $(cat flipkart.com/recon/test2.txt);do sslscan $d;done | tee $d.txt
echo
echo
echo "Fuzzing hidden params"
for b in $(cat flipkart.com/recon/test2.txt);do echo e "-----------------URL:$b-----------------"; python3 /root/tools/ParamSpider/paramspider.py --domain $b;done | tee params.txt

