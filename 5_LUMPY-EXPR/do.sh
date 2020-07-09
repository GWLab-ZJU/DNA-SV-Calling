#!/usr/bin/env bash
{ . ../head/do_head.sh; }||{ echo "Cannot attach head.";exit; }
mkdir -p VCF
cat ../all.conf | grep -v \# | cut -f 2 -d " " | while read line; do
    echo ${line}
    cat ../head/lsf_head.sh exec/lsf.sh|\
    sed "s;^WDIR=.*;WDIR=\"$(echo ${PWD})\";"|\
    sed "s;^line=;line=\"$(echo ${line})\";" |\
    sed "s;\# BSUB -o;\# BSUB -o lsf_$(echo $line)_$(date +%Y-%m-%d_%H-%M).log;" | ${bsub}
exit
done
