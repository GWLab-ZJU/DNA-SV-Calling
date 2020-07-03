#!/usr/bin/env bash
. ~/lib/libdo
LIBDO_LOG="dl.$(date +%Y-%m-%d_%H-%M).log"
LIBDO_LOG_MODE=4
cat ../all.conf | grep -v \# | cut -f 1 -d " " | while read line; do
    cat ENA_FQ.conf|grep -v \# | while read id;do
	if [[ "${id}" =~ .*"${line}"_[12].* ]];then
	    if ! [ -f "${id##*/}" ];then
		DO ascp -QT -l 300m -P33001 -i asperaweb_id_dsa.openssh era-fasp@${id} .
	    fi    
	fi
    done
done
