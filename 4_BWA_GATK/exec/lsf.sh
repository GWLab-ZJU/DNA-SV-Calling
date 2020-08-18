fq1="../3_CUTADAPT/${line}_1.fq.gz"
fq2="../3_CUTADAPT/${line}_2.fq.gz"
[ -f "${fq1}" ] && [ -f "${fq2}" ]
id=$(cat ../all.conf|grep ${line}|cut -f 2 -d " ")
LIBDO_LOG_MODE=2
DO bwa mem -R '@RG'\""\tID:${id}\tSM:${id}\tLB:WXS\tPL:Illumina"\" "${bwaref}" "${fq1}" "${fq2}" \| samtools sort -o "${id}".bam -

LIBDO_LOG_MODE=4

DO samtools index "${id}".bam

DO bam dedup --in "${id}".bam --out "${id}"_dupmark.bam --rmDups --verbose

DO samtools index "${id}"_dupmark.bam
