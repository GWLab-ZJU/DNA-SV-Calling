args=(${line})
fn="../1_ORIGINAL_FQ/${args[0]:-}.fq.gz"
[ -f "${fn}" ] && [ ! -f "${args[0]}.fq.gz" ]
LIBDO_LOG="${WDIR}/${args[0]}_${thisdate}.log"
if [ -n "${args[2]:-}" ];then
    DO cutadapt "${fn}" -u "${args[1]}" -u "${args[2]}" -o "${args[0]}.fq.gz"
else
    DO cutadapt "${fn}" -u "${args[1]}" -o "${args[0]}".fq.gz
fi
