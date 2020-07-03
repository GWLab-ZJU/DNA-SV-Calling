#!/usr/bin/env bash
{ . $(dirname ${0})/../head/do_head.sh; }||{ echo "Cannot attach head.";exit; }
for ext in ".bam";do
    if ls *${ext}&>>/dev/null;then
        for fn in *${ext};do
            echo "cat ${fn} | gzip -d | xz -9 > ${fn}.xz && rm ${fn} || touch ${fn}_failed"|${bsub}
        done
    fi
done
for ext in ".log" "dupmark_metrics.txt" "bqsr" ".bai" ".list" ".idx";do
    if ls *${ext}&>>/dev/null;then
	for fn in *${ext};do
	    xz -9 ${fn}
	done
    fi
done
