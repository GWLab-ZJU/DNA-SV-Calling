# Overwrite the defaults.
args=(${line})
fn="../1_ORIGINAL_FQ/${args[0]:-}.fq.gz"
[ -f "${fn}" ]
LIBDO_LOG="${WDIR}/${args[0]}_${thisdate}.log"
! [ -z "${args[2]:-}" ] && DO cutadapt "${fn}" -u "${args[1]}" -u "${args[2]}" -o "${args[0]}.fq.gz" || DO cutadapt "${fn}" -u "${args[1]}" -o "${args[0]}".fq.gz
