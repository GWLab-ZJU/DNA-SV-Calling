#!/usr/bin/env bash
if ls *.fastq* &>> /dev/null;then
    for fn in *.fastq*;do
        new_fn=$(echo ${fn}|sed 's;\.fastq;\.fq;')
        mv "${fn}" "${new_fn}"
    done
fi
if ls *.fq &>> /dev/null;then
    for fn in *.fq;do
        gzip "${fn}"
    done
    rm -f *.fq
fi
