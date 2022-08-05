#!/bin/bash

echo "Scanning target using nuclei"
echo 
echo
nuclei -l flipkart.com/recon/live_subs.txt -s high | tee flipkart.com/nuclei/high.txt
nuclei -l flipkart.com/recon/live_subs.txt -s medium | tee flipkart.com/nuclei/med.txt
nuclei -l flipkart.com/recon/live_subs.txt -s low | tee flipkart.com/nuclei/low.txt
