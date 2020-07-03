#!/usr/bin/env bash
{ . ../head/do_head.sh; }||{ echo "Cannot attach head.";exit; }
mkdir -p VCF
rm -rf *.vcf
cp ../5_*/VCF/*.vcf .
for fn in *.vcf;do
    echo ${fn}
    line="${fn:0:-4}"
    cat ../head/lsf_head.sh exec/lsf.sh|\
    sed "s;^WDIR=.*;WDIR=\"$(echo ${PWD})\";"|\
    sed "s;^line=;line=\"$(echo ${line})\";" |\
    sed "s;\# BSUB -o;\# BSUB -o lsf_$(echo ${line})_$(date +%Y-%m-%d_%H-%M).log;" | ${bsub}
done
