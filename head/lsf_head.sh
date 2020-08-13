#!/usr/bin/env bash
# BSUB -R "span[ptile=1]"
# BSUB -o
# BSUB -n 1
set -ue
WDIR=
cd "${WDIR}"
line=
thisdate="$(date +%Y-%m-%d_%H-%M)"
. "${HOME}"/lib/libdo
LIBDO_LOG="${WDIR}/${line}_${thisdate}.log"
LIBDO_LOG_MODE=4
HG="${HOME}/References/hg38"
ref="${HG}/hg38.fa"
ANNOVAR_DB="$HOME/References/Annovar/humandb"
bwaref="${HOME}/References/hg38/hg38_bwa_ref/hg38.fa"
lcbed="${HOME}/References/DIGIT/lowComplexity.bed"
LUMPYscripts="${HOME}"/bin/bio.d/lumpy-sv.git/scripts
DELLY_EXCL="${HOME}"/bin/bio.d/delly.git/excludeTemplates/
