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
ANNOVAR_DB="${HOME}/References/Annovar/humandb"
HG="${HOME}/References/hg38"
ref="${HG}/hg38.fa"
bwaref="${HG}/hg38_bwa_ref/hg38.fa"
lcbed="${HG}/hg38_lowComplexity.bed"
GRIDSS_REF="${HG}/hg38_gridss_ref/hg38.fa"
BIOD="${HOME}/bin/bio.d"
LUMPYscripts="${BIOD}"/lumpy-sv/scripts
DELLY_EXCL="${BIOD}"/delly.git/excludeTemplates/
GRIDSS_JAR="${BIOD}"/JAR/gridss-2.9.4/gridss-2.9.4-gridss-jar-with-dependencies.jar
