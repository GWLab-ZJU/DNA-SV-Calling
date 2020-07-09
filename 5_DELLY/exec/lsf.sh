LIBDO_LOG_MODE=4
tumour="../4_BWA_GATK/${line}_dupmark.bam"
if  [ -f "${tumour}" ];then
    DO delly call -g "${ref}" -o "${line}"_call.bcf -x "${DELLY_EXCL}"/human.hg38.excl.tsv "${tumour}"
    DO delly call -g "${ref}" -o "${line}"_gnt.bcf -v "${line}"_call.bcf -x "${DELLY_EXCL}"/human.hg38.excl.tsv "${tumour}"
    DO delly filter -f germline -o "${line}".bcf "${line}"_gnt.bcf
    DO bcftools view "${line}".bcf -o VCF/"${line}".vcf
fi
