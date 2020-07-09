LIBDO_LOG_MODE=4
tdm="../4_BWA_GATK/${line}_LUMPY_MAIN.bam"
tdc="../4_BWA_GATK/${line}_LUMPY_discordants.bam"
tds="../4_BWA_GATK/${line}_LUMPY_splitters.bam"
if  [ -f "${tdm}" ] && [ -f "${tdc}" ] && [ -f "${tds}" ];then
    DO lumpyexpress -B "${tdm}" -S "${tds}" -D "${tdc}" -o "${line}"_raw.vcf
    DO svtyper -i "${line}"_raw.vcf -B "${tdm}" -o VCF/"${line}".vcf
fi
