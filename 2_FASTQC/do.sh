#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")"
. ../head/do_head.sh
cat ../all.conf|cut -f 1 -d " "|grep -v '^#'|while read line;do
    for fn in "${line}"_1 "${line}"_2;do
        echo ${fn}
        cat ../head/lsf_head.sh exec/lsf.sh|\
        sed "s;^WDIR=.*;WDIR=\"$(echo ${PWD})\";"|\
        sed "s;^line=.*;line=\"$(echo ${fn})\";"|\
        sed "s;\# BSUB -o;\# BSUB -o lsf_$(echo ${fn})_$(date +%Y-%m-%d_%H-%M).log;"|"${bsub}"
    done
done
