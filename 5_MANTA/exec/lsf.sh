tumour="../4_BWA_GATK/${line}_dupmark.bam"
[ -f "${tumour}" ]
DO configManta.py --exome \
--bam="${tumour}" \
--referenceFasta="${ref}" \
--runDir="${line}"_manta

DO "${line}"_manta/runWorkflow.py -m local

tar -f - -cv "${line}"_manta | xz -T0 -9 >"${line}"_manta.txz

rm -rf "${line}"_manta/
