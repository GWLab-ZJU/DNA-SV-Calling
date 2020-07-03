# Readme

This directory should be considered "read-only". It contains original sequence reads in FASTQ format with extension name `fq.gz`. You can use `rename.sh` to compress `fq` or `fastq` files.

## Preparing Input

The input should be consisting of several set of samples.

A **SET OF SAMPLE** should consist of **ONE** normal ("germline"/"normal blood") sample with the name of `case_${num}_gremline` and several tumour sample with the name of `case_${num}_tumour*`.

A **SAMPLE** should consist of 2 `fastq` file named `${sample_name}_1.fq.gz` and `${sample_name}_2.fq.gz`.

There should be a file named `all.conf` in the root directory of this pipeline indicating the relationship between filenames and sample names. For example,

```config
#FQ ID
#SRR3182418 case5_germline
SRR3182419 case2_germline
SRR3182420 case4_germline
SRR3182421 case3_germline
SRR3182422 case6_germline
SRR3182423 case1_germline
```

The extension name of each file can be one of `*.fq *.fastq *.gq.gz *.fastq.gz`. Please execute `rename.sh` before proceeding into further steps to rename and compress them properly.

### Downloading Files from Online Databases

We also provide a script for downloading files online by `ascp` in script `dload.sh`. You should prepare a file named`ENA_FQ.conf` which lists all Aspera URLs for the file you want to download. For example,

```
#EXAMPLE
#fasp.sra.ebi.ac.uk:/vol1/fastq/SRR318/003/SRR3182423/SRR3182423_1.fastq.gz
#fasp.sra.ebi.ac.uk:/vol1/fastq/SRR318/003/SRR3182423/SRR3182423_2.fastq.gz
#fasp.sra.ebi.ac.uk:/vol1/fastq/SRR318/009/SRR3182419/SRR3182419_1.fastq.gz
#fasp.sra.ebi.ac.uk:/vol1/fastq/SRR318/009/SRR3182419/SRR3182419_2.fastq.gz
#fasp.sra.ebi.ac.uk:/vol1/fastq/SRR318/003/SRR3182433/SRR3182433_1.fastq.gz
#fasp.sra.ebi.ac.uk:/vol1/fastq/SRR318/003/SRR3182433/SRR3182433_2.fastq.gz
fasp.sra.ebi.ac.uk:/vol1/fastq/SRR318/007/SRR3182437/SRR3182437_1.fastq.gz
fasp.sra.ebi.ac.uk:/vol1/fastq/SRR318/007/SRR3182437/SRR3182437_2.fastq.gz
```

Lines starting with a `#` or not specified in `all.conf` will be ignored.

### Uploading Raw Sequencing Data

For raw sequencing data, please be aware that we currently do **NOT** support adapters. So you may remove the adapters by `cutadapt` before moving them to this folder. However, you may add `adapters.conf` in the root directory of this program to allow `fastqc` detect the adapters. Please rename properly and register them in file `all.conf`.

## Archiving this Folder

You may archive this folder after performing step 2 and 3.

When archiving, what we will do is to decompress all gzip archives and recompress them in xzip format. We'll also archive all logs and configuration files.

## Special FITF

`*.fq *.fastq *.fq.gz *.fastq.gz` Read files in FASTQ format.

`dload.sh` Download files from ENA database by Aspera.

`ENAFA` A configuration file for `dload.sh`.

`rename.sh` Rename and compress read files properly.

