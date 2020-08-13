adap=""
if [ -f ../adapters.conf ]; then
    adap=" -a ../adapters.conf "
fi
fn="${WDIR}/../1_ORIGINAL_FQ/${line}.fq.gz"
if [ -f "${fn}" ]; then
    DO fastqc "${fn}" --outdir ${WDIR} --threads 1 ${adap}
else
    echo "${fn} not exist!"
fi
