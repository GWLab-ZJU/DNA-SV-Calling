tumour="${line}"_DIGIT_FINAL.sam
obj="../4_BWA_GATK/${line}_dupmark.bam"
[ -f "${obj}" ]
! [ -f "${tumour}" ] && DO samtools sort -n "${obj}" -o "${tumour}" || true

DO digit analyse -i "${tumour}" -o "${line}" -s 2.33 -a false -lc "${lcbed}" -r "${HG}"/Homo_sapiens_assembly38.idx.ChrLen.txt -q 0

DO digit proxval -T 100 -c 3 -i "${line}"_DIGIT_FINAL_trl.sam -o "${line}"_trl_clusters -g "${HG}"/Homo_sapiens_assembly38.fasta -x "${HG}"/Homo_sapiens_assembly38.idx -M -1 -t file=m"${line}"_summary.txt -r "${HG}"/Homo_sapiens_assembly38.idx.ChrLen.txt
