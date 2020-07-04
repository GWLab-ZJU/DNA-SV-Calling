# Overwrite the defaults.
LIBDO_LOG_MODE=4
args=(${line})
fn="../1_ORIGINAL_FQ/${args[0]:-}.fq.gz"
if ! [ -f "${fn}" ]; then
    echo "File ${fn} not found!"
    exit 1
fi
LIBDO_LOG="${WDIR}/${args[0]}_${thisdate}.log"
if ! [ -z "${args[2]:-}" ]; then
    DO cutadapt "${fn}" -u "${args[1]}" -u "${args[2]}" -o "${args[0]}.fq.gz"
else
    DO cutadapt "${fn}" -u "${args[1]}" -o "${args[0]}".fq.gz
fi
