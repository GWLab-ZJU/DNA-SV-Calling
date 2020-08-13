tdm="../4_BWA_GATK/${line}_dupmark.bam"
tdc="${line}_LUMPY_discordants.bam"
tds="${line}_LUMPY_splitters.bam"
[ -f "${tdm}" ]

LIBDO_LOG_MODE=2
[ ! -f "${tdc}" ] && DO samtools view -b -F 1294 "${tdm}" \| samtools sort -o "${tdc}" - || true
[ ! -f "${tds}" ] && DO samtools view -h "${tdm}" \| "${LUMPYscripts}"/extractSplitReads_BwaMem -i stdin \| samtools view -Sh -\|samtools sort -o "${tds}" - || true
LIBDO_LOG_MODE=4

DO lumpyexpress -B "${tdm}" -S "${tds}" -D "${tdc}" -o "${line}"_raw.vcf
DO svtyper -i "${line}"_raw.vcf -B "${tdm}" -o VCF/"${line}"_LUMPY-EXPR.vcf
