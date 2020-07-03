#!/usr/bin/env bash
{ . $(dirname ${0})/../head/do_head.sh; }||{ echo "Cannot attach head.";exit; }
if [ -d "${1}" ];then
    cd ${1}
fi
for ext in ".gz";do
    if ls *${ext}&>>/dev/null;then
        for fn in *${ext};do
            fxz=$(echo ${fn}|sed "s;$(echo ${ext});.xz;")
            echo "cat ${fn} | gzip -d | xz -9 > ${fxz} && rm ${fn} || touch ${fn}_failed"|${bsub}
        done
    fi
done
for ext in ".bam";do
    if ls *${ext}&>>/dev/null;then
        for fn in *${ext};do
            echo "cat ${fn} | gzip -d | xz -9 > ${fn}.xz && rm ${fn} || touch ${fn}_failed"|${bsub}
        done
    fi
done
for ext in ".log" ".html" "dupmark_metrics.txt" "bqsr" ".bai" ".list" ".idx" ".stats" ".tbi";do
    if ls *${ext}&>>/dev/null;then
	for fn in *${ext};do
	    xz -9 ${fn}
	done
    fi
done
