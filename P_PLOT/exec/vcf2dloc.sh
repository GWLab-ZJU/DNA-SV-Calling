#!/usr/bin/env bash
# This shell script will be deprecated.
[ -f "${1}" ]
cat "${1}"|grep -v '^#'|grep BND|gawk '{RS="\n";FS="\t";if ($7 ~ /PASS/) { print $0 }}' |gawk '{RS="\n";FS="\t";OFS="\t";{ print $1,$2,$2,$5,$5 }}'|tr ':' '\t'|sed 's;[AGCT];;g'|sed 's;\[;;g'|sed 's;\];;g' |grep -vE 'chr[0-9xyXY]+_.*' > "${1}.bedpe.circos.txt"
