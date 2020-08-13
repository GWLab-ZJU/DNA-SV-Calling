tumour="../4_BWA_GATK/${line}_dupmark.bam"
[ -f "${tumour}" ]
DO configManta.py --exome \
--bam="${tumour}" \
--referenceFasta="${ref}" \
--runDir="${line}"_manta

DO "${line}"_manta/runWorkflow.py -m local

cd "${line}"_manta/results/variants

gunzip *.vcf.gz

grep -E  '^##' diploidSV.vcf | grep -vE '^((##FILTER)|(##INFO)|(##FORMAT)|(##ALT))' > merged.vcf
echo '##FILTER=<ID=candidateSV,Description="Variant output to candidateSV call set">' >> merged.vcf
echo '##FILTER=<ID=candidateSmallIndels,Description="Variant output to candidateSmallIndels call set">' >> merged.vcf
grep -hE '^((##FILTER)|(##INFO)|(##FORMAT)|(##ALT))' diploidSV.vcf candidateSV.vcf candidateSmallIndels.vcf | sort | uniq >> merged.vcf
grep -vE '^##' diploidSV.vcf >> merged.vcf
grep -vE '^#' candidateSV.vcf | awk 'BEGIN { FS="\t"; OFS="\t" } { $7="candidateSV" ; $10="" ; print }' >> merged.vcf
grep -vE '^#' candidateSmallIndels.vcf  | awk 'BEGIN { FS="\t"; OFS="\t" } { $7="candidateSmallIndels" ; $10="" ; print }' >> merged.vcf
mv merged.vcf ../../../VCF/"${line}"_MANTA.vcf

cd ../../../
tar -f - -cv "${line}"_manta | xz -T0 -9 >"${line}"_manta.txz

rm -rf "${line}"_manta/
