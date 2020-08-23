adap=""
! [ -f ../adapters.conf ] || adap=" -a ../adapters.conf "
fn="${WDIR}/../1_ORIGINAL_FQ/${line}.fq.gz"
[ -f "${fn}" ] && [ ! -f "${line}"_fastqc.zip ]
DO fastqc "${fn}" --outdir ${WDIR} --threads 1 ${adap}
