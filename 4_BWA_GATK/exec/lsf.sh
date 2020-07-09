fq1="../3_CUTADAPT/${line}_1.fq.gz"
fq2="../3_CUTADAPT/${line}_2.fq.gz"
if [ -f "${fq1}" ] && [ -f "${fq2}" ];then
    id=$(cat ../all.conf|grep ${line}|cut -f 2 -d " ")
    #LIBDO_LOG_MODE=2
    #DO bwa mem -M -R '@RG'\""\tID:${id}\tSM:${id}\tLB:WXS\tPL:Illumina"\" "${bwaref}" "${fq1}" "${fq2}" \| samtools sort -o "${id}".bam -

    LIBDO_LOG_MODE=4

    #DO samtools index "${id}".bam

    #DO gatk MarkDuplicates \
    #-I "${id}".bam \
    #-O "${id}"_dupmark.bam \
    #--REMOVE_SEQUENCING_DUPLICATES true \
    #-M "${id}"_dupmark_metrics.txt

    ln -s "${id}"_dupmark.bam "${id}"_LUMPY_MAIN.bam

    LIBDO_LOG_MODE=2
    
    DO samtools view -b -F 1294 "${id}"_dupmark.bam \| samtools sort "${id}"_LUMPY_discordants.bam -

    DO samtools view -h "${id}"_dupmark.bam \| "${LUMPYscripts}"/extractSplitReads_BwaMem -i stdin \| samtools view -S -\|samtools sort -o "${id}"_LUMPY_splitters.bam -
    
    DO samtools sort -n "${id}"_dupmark.bam -o "${id}"_nmsort.bam
    
    DO samtools view "${id}"_nmsort.bam -o "${id}"_DIGIT_FINAL.sam
fi
