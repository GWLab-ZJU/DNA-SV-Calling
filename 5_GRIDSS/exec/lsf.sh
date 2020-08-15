tumour="../4_BWA_GATK/${line}_dupmark.bam"
[ -f "${tumour}" ]
DO gridss.sh --reference "${ref}" --output VCF/"${line}"_gridss.vcf --steps All --labels "${line}" "${tumour}"
