#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")"
. ../head/do_head.sh
for ext in ".bam";do
    if ls *"${ext}"&>>/dev/null;then
        for fn in *"${ext}";do
            echo ${fn}
            echo "cat ${fn} | gzip -d | xz -9 > ${fn}.extracted.xz && rm ${fn} || touch ${fn}_failed"|"${bsub}"
        done
    fi
done
for ext in ".log" "dupmark_metrics.txt" "bqsr" ".bai" ".list" ".idx";do
    if ls *"${ext}"&>>/dev/null;then
	for fn in *"${ext}";do
	    echo ${fn}
	    xz -9 "${fn}"
	done
    fi
done
