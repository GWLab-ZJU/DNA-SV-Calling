#!/usr/bin/env bash
{ . ../head/do_head.sh; }||{ echo "Cannot attach head.";exit; }
mkdir -p VCF
cat ../all.conf | grep -v \# | cut -f 2 -d " " | while read line; do
    echo ${line}
    bash exec/vcf2dloc.sh "${line}"_delly.vcf
    Rscript exec/vcf2bedpe.R "${line}"_gridss.vcf
    Rscript exec/vcf2bedpe.R "${line}"_manta.vcf
    cat "${line}"_manta.vcf.bedpe|grep BND|cut -f 2-7 > "${line}"_manta.vcf.bedpe.circos.txt
    cat "${line}"_gridss.vcf|grep 'SVTYPE=BND'|cut -f 3|sort|uniq|while read line;do
        cat n1_gridss.vcf.bedpe|grep "${line}"|cut -f 2-7 >> "${line}"_gridss.vcf.bedpe.circos.txt
    done
done
for fn in *.bedpe.circos.txt;do
    Rscript exec/Circos.R "${fn}"
done
