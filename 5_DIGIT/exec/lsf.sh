LIBDO_LOG_MODE=4
tumour"=../4_BWA_GATK/${line}_FINAL.sam"
if  [ -e "${tumour}" ];then
mkdir ${line}
cd ${line}
    DO digit analyse -i ../"${tumour}" -o . -s 2.33 -a false -lc BED -r $"{HG}"/Homo_sapiens_assembly38.idx.ChrLen.txt -q 0
    DO digit proxval -T 100 -c 3 -i ../"${tumour}" -o trl_clusters -g $"{HG}"/Homo_sapiens_assembly38.fasta -x $"{HG}"/Homo_sapiens_assembly38.idx -M -l -t file=mapped_rmd_summary.txt -r $"{HG}"/Homo_sapiens_assembly38.idx.ChrLen.txt
fi
