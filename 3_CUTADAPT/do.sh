#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")"
. ../head/do_head.sh
cat ../all.conf | grep -v '^#' | cut -f 1 -d " " | while read id; do
    cat CUTADAPT.conf | grep -v '^#' | while read line; do
        if [[ "${line}" =~ .*"${id}"_[12].* ]]; then
            echo ${line}
            fns=(${line})
            cat ../head/lsf_head.sh exec/lsf.sh |\
            sed "s;^WDIR=.*;WDIR=\"$(echo ${PWD})\";" |\
            sed "s;^line=;line=\"$(echo ${line})\";" |\
            sed "s;\# BSUB -o;\# BSUB -o lsf_$(echo ${fns[0]})_$(date +%Y-%m-%d_%H-%M).log;" | "${bsub}"
        fi
    done
done
