# Readme

This directory performs (1) the step of alignment, sort and convert and (2) the step of duplicate-removing, indel local realignment and base quality score recalibration. Reads with mapping quality below 30 will be dropped.

## Archiving this Folder

You may archive this folder after performing step 5.

When archiving, what we will do is to decompress all gzip archives (including `bam` files) and recompress them in xzip format. We'll also archive all logs, indexes and configuration files.

## Specific FITF

`${id}.bam` Bam file produced by `samtools`.

`${id}_bqsr` Intermediate file produced by BQSR.

`${id}_bqsr.bam ` BAM file produced by BQSR.

`${id}_dupmark.bam` BAM file produced by duplicate-marking.

`${id}_dupmark_metrics.txt` Intermediate file produced by duplicate-marking.

`${id}_FINAL.bam` Ultimate BAM file.

`${id}_intervals.list` Intermediate file produced by Indel Local Realignment.

`${id}_realigned.bam` BAM file produced by Indel Local Realignment.

