#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")"
rm -f *.log *.bam *.bai *.sam *.cram *_bqsr *_dupmark_metrics.txt *_intervals.list
