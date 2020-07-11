LIBDO_LOG_MODE=4
tumour="${line}"_DIGIT_FINAL.sam
obj="../4_BWA_GATK/${line}_dupmark.bam"
if  [ -f "${obj}" ];then
    if ! [ -f "${tumour}" ];then
        DO samtools sort -n "${obj}" -o "${tumour}"
    fi
    rm -fr ${line}
    mkdir -p ${line}
    cd ${line}
    DO digit analyse -i ../"${tumour}" -o . -s 2.33 -a false -lc "${lcbed}" -r "${HG}"/Homo_sapiens_assembly38.idx.ChrLen.txt -q 0
    DO digit proxval -T 100 -c 3 -i ../"${tumour}" -o trl_clusters -g "${HG}"/Homo_sapiens_assembly38.fasta -x "${HG}"/Homo_sapiens_assembly38.idx -M -l -t file=mapped_rmd_summary.txt -r "${HG}"/Homo_sapiens_assembly38.idx.ChrLen.txt
fi
