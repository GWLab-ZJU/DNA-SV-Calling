#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")"
. ../head/do_head.sh
cat ../all.conf|grep -v '^#'|cut -f 1 -d " "|while read line;do
    echo ${line}
    cat ../head/lsf_head.sh exec/lsf.sh|\
    sed "s;^WDIR=.*;WDIR=\"$(echo ${PWD})\";"|\
    sed "s;^line=;line=\"$(echo ${line})\";"|\
    sed "s;\# BSUB -o;\# BSUB -o lsf_$(echo $line)_$(date +%Y-%m-%d_%H-%M).log;"|"${bsub}"
done
