#!/usr/bin/env bash
{ . $(dirname ${0})/../head/do_head.sh; }||{ echo "Cannot attach head.";exit; }
for ext in ".gz";do
    if ls *${ext}&>>/dev/null;then
        for fn in *${ext};do
            fxz=$(echo ${fn}|sed "s;$(echo ${ext});.xz;")
            echo "cat ${fn} | gzip -dc | xz -9 > ${fxz} && rm ${fn} || touch ${fn}_failed"|${bsub}
        done
    fi
done
for ext in ".log" ".conf";do
    if ls *${ext}&>>/dev/null;then
	    for fn in *${ext};do
	        xz -9 ${fn}
	    done
    fi
done
