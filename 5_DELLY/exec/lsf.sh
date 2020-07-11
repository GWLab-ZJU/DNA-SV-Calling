LIBDO_LOG_MODE=4
tumour="../4_BWA_GATK/${line}_dupmark.bam"
if  [ -f "${tumour}" ];then
    DO delly call -g "${ref}" -o "${line}"_call.bcf -x "${DELLY_EXCL}"/human.hg38.excl.tsv "${tumour}"
    DO delly call -g "${ref}" -o "${line}"_gnt.bcf -v "${line}"_call.bcf -x "${DELLY_EXCL}"/human.hg38.excl.tsv "${tumour}"
    DO bcftools view "${line}"_gnt.bcf -o VCF/"${line}".vcf
fi
