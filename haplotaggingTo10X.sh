#!/bin/bash
read=$1
zcat $read |grep "@"|sed -e "s/.*BX:Z://" -e "s/\sRX.*//"|sort -u > barcodes.list
cat barcodes.list|paste - ../../haplotagging/4M-with-alts-february-2016.txt | awk 'NF == 2' > top5M.barcodes.GEM.list

perl your_path/10X_spoof_from_Haplotagging.pl $read ""
