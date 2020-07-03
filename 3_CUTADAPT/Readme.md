# Readme

This directory performs the step of  removing low-quality reads.

If you're confident about your file, you can skip this step by linking all `.fq.gz` files from the folder of step 1 to this folder.

## Configuration

The `CUTADAPT.conf` file is a file with 2 or 3 columns separated by a space. Those lines started with `#` will be ignored.

### Example:

````config
#EXAMPLE
#Sample #Param.1 #Param.2
#SRR3182418_1 3
#SRR3182418_2 -4 4
#SRR3182419_1 3
#SRR3182419_2 -4 4
#SRR3182420_1 3
#SRR3182420_2 -4 3
#SRR3182421_1 3
SRR3182446_1 3 -2
SRR3182446_2 3 -2
SRR3182447_1 3 -2
SRR3182447_2 3
````

* The first column indicates the filename.

* The second column and the third column are two parameters which will be passed to `-u` option of `cutadapt`.

## Archiving this Folder

You may archive this folder after performing step 4.

When archiving, what we will do is to decompress all gzip archives and recompress them in xzip format. We'll also archive all logs and configuration files.

