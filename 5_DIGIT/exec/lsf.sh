tumour="${line}"_DIGIT_FINAL.sam
obj="../4_BWA_GATK/${line}_dupmark.bam"
[ -f "${obj}" ]
if ! [ -f "${tumour}" ];then
	DO samtools sort -n "${obj}" -o "${line}"_nmsorted.bam
	DO samtools view -F 256 -F 2048 "${line}"_nmsorted.bam -o "${tumour}"
fi

DO digit analyse -i "${PWD}/${tumour}" -o "${PWD}/${line}" -s 2.33 -a false -lc "${lcbed}" -r "${ref}".idx.ChrLen.txt -q 0

DO digit proxval -T 100 -c 3 -i "${PWD}/${line}_DIGIT_FINAL_trl.sam" -o "${PWD}/${line}_trl_clusters" -g "${ref}" -x "${ref}".idx -M -1 -t file=m"${line}"_summary.txt -r "${ref}".idx.ChrLen.txt
