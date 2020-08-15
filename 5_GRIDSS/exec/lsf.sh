tumour="../4_BWA_GATK/${line}_dupmark.bam"
[ -f "${tumour}" ]
DO gridss.sh --reference "${bwaref}" --output VCF/"${line}"_gridss.vcf --assembly "${line}"_assembly.bam --jar "${GRIDSS_JAR}" --steps preprocess,assemble,call --labels "${line}" "${tumour}"
