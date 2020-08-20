adap=""
if [ -f ../adapters.conf ]; then
    adap=" -a ../adapters.conf "
fi
fn="${WDIR}/../1_ORIGINAL_FQ/${line}.fq.gz"
[ -f "${fn}" ] && [ ! -f "${line}"_fastqc.zip ]
DO fastqc "${fn}" --outdir ${WDIR} --threads 1 ${adap}
