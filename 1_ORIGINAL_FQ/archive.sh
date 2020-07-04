#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")"
. ../head/do_head.sh
for ext in ".gz";do
    if ls *"${ext}"&>>/dev/null;then
        for fn in *"${ext}";do
            echo ${fn}
            fxz=$(echo ${fn}|sed "s;$(echo ${ext});.xz;")
            echo "cat '${fn}' | gzip -dc | xz -9 > '${fxz}' && rm '${fn}'"|"${bsub}"
        done
    fi
done
for ext in ".log" ".conf";do
    if ls *"${ext}"&>>/dev/null;then
	    for fn in *"${ext}";do
	        echo ${fn}
	        xz -9 ${fn}
	    done
    fi
done
