#!/bin/bash

echo "1.Recon"
echo "2.Pingsweep"
echo "3.Nuclei"
echo "4.Web Exploit"

echo -n "choice: "
read choice
echo $choice

case $choice in 
      1) ./recon.sh;;
      2) ./pingsweep.sh;;
      3) ./nuclei.sh;;
      4) ./web_exploit.sh;;
      5) echo "Are you kidding me bro??"
esac
      

