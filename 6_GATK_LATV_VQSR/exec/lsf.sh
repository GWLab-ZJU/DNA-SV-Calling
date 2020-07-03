LIBDO_LOG_MODE=4

DO gatk3 -T LeftAlignAndTrimVariants -R "${ref}" --variant "${line}".vcf -o "${line}"_aln.vcf

#DO vcftools --remove-indels --vcf "${line}"_aln.vcf --out "${line}"_snp --recode --recode-INFO-all

#DO vcftools --keep-only-indels --vcf "${line}"_aln.vcf --out "${line}"_indel --recode --recode-INFO-all

#DO gatk VariantRecalibrator -R "${ref}" -V "${line}"_snp.recode.vcf \
#--resource:hapmap,known=false,training=true,truth=true,prior=15.0 "${hapmap}" \
#--resource:omini,known=false,training=true,truth=false,prior=12.0 "${omni}" \
#--resource:1000G,known=false,training=true,truth=false,prior=10.0 "${onekg_snp}" \
#--resource:dbsnp,known=true,training=false,truth=false,prior=2.0 "${dbsnp}" \
#--an DP --an QD --an FS --an SOR --an ReadPosRankSum --an MQRankSum --mode SNP \
#--tranche 100.0 --tranche 99.9 --tranche 99.0 --tranche 95.0 --tranche 90.0 \
#--rscript-file "${line}"_vqsr.snps.plots.R --tranches-file "${line}"_vqsr.snps.tranches -O "${line}"_vqsr.snps.recal

#if [ ${LIBDO_PRIV} -eq 0 ];then
#    DO gatk ApplyVQSR -R "${ref}" -V "${line}"_snp.recode.vcf --ts_filter_level 99.0 -mode SNP \
#    --tranches-file "${line}"_vqsr.snps.tranches -recalFile "${line}"_vqsr.snps.recal -O "${line}"_snp_VQSR.vcf
#else
#    DO cp "${line}"_snp.recode.vcf "${line}"_snp_VQSR.vcf
#fi

#DO gatk VariantRecalibrator -R "${ref}" -V "${line}"_indel.recode.vcf \
#--resource:mills,known=true,training=true,truth=true,prior=12.0 "${mills}" \
#--resource:dbsnp,known=true,training=false,truth=false,prior=2.0  "${dbsnp}" \
#--an DP --an QD --an FS --an SOR --an ReadPosRankSum --an MQRankSum --mode INDEL --max-gaussians 6 \
#--rscript-file "${line}"_vqsr.indels.plots.R --tranches-file "${line}"_vqsr.indels.tranches -O "${line}"_vqsr.indels.recal

#if [ ${LIBDO_PRIV} -eq 0 ];then
#    DO gatk ApplyVQSR -R "${ref}" -V "${line}"_indel.recode.vcf --ts_filter_level 99.0 -mode INDEL \
#    --tranches-file "${line}"_vqsr.indels.tranches -recalFile "${line}"_vqsr.indels.recal -O "${line}"_indel_VQSR.vcf
#else
#    DO cp "${line}"_indel.recode.vcf "${line}"_indel_VQSR.vcf
#fi

#DO bgzip "${line}"_snp_VQSR.vcf

#DO bgzip "${line}"_indel_VQSR.vcf

#DO tabix "${line}"_indel_VQSR.vcf.gz

#DO tabix "${line}"_snp_VQSR.vcf.gz

LIBDO_LOG_MODE=2

#DO vcf-merge "${line}"_snp_VQSR.vcf.gz "${line}"_indel_VQSR.vcf.gz \>"${line}"_VQSR.vcf

mv "${line}"_aln.vcf "${line}"_VQSR.vcf

cat "${line}"_VQSR.vcf|grep -v \#| gawk '{RS="\n";FS="\t";if ($7 ~ /PASS/) { print $0 }}' "${line}_VQSR.vcf" > VCF/"${line}".vcf
