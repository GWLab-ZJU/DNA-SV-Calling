# DNA SV Calling Pipeline

This is the pipeline for DNA SV calling. All codes are stored here. 

If you get any question about the pipeline, you can directly contact Edison Jianning KANG (e-mail address: <jianning.18@intl.zju.edu.cn>).


# Outline

<!-- TOC -->

- [DNA Mutation Calling Pipeline](#dna-mutation-calling-pipeline)
- [Outline](#outline)
- [Copyright](#copyright)
    - [Introduction](#introduction)
    - [Installation](#installation)
        - [Dependencies](#dependencies)
        - [Install Core Components](#install-core-components)
        - [Configuration](configuration)
    - [Usage](usage)
    - [Naming Specifications](#naming-specifications)
        - [Logs](#logs)
        - [Failed Trials](#failed-trials)
        - [Archives](#archives)
    - [General FITF (File In The Folder)](#general-fitf-file-in-the-folder)
    - [Specific FITF](#specific-fitf)

<!-- /TOC -->

# Copyright

Copyright (C) 2020 Edison Jianning KANG & YU Zhejian

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

![ [Large GPLv3 logo with “Free as in Freedom”] ](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)

## Introduction

This will be filled latter.

## Installation

### Dependencies

The server feature in `2_FASTQC` depends on `lighthttpd` which is available from <http://www.lighttpd.net/>.

YuZJLab LinuxMiniPrograms can be found at <https://github.com/YuZJLab/LinuxMiniPrograms>.

Other dependencies can be found in project <https://github.com/YuZJLab/SoftInstall>. Including:

1. FastQC >=0.11.9

2. CutAdapt >=2.10

3. BWA >=0.7.17-r1188

4. GATK v4

   The output of `gatk --version`:

   ```
   The Genome Analysis Toolkit (GATK) v4.1.4.1
   HTSJDK Version: 2.21.0
   Picard Version: 2.21.2
   ```

5. IBM Aspera

   ```
   Aspera Connect version 3.9.8.176272
   ascp version 3.9.1.168302
   ```

11. gzip>=1.10

16. Unzip>=6.00

8. XZ Utils>=5.2.5

9. Samtools>=v1.10

10. DIGIT

### Install Core Components

1. Install all the dependencies. Add the following command to the `$PATH` environment variable:

   ```
   fastqc
   cutadapt
   bwa
   gatk
   ascp
   lighthttpd
   Rscript
   R
   digit
   tabix
   bgzip
   xz
   unzip
   gzip
   ```
   
   Those application distributed in a `JAR` package should be wrapped as follows (we'll use `SnpEff` in example.):
   
   ```
   #!/usr/bin/env bash
   java -jar $(dirname ${0})/snpEff/snpEff.jar ${@}
   ```
   
   It would be a good idea to use **ABSOLUTE PATH** to your `java` executable if multiple versions of Java were installed.

2. Clone this repository to your working directory and remove the remote repository by `git remove origin`. You can add your own remote repositories by `git remote add <name> <url>`.

### Global Configuration

1. Go to the root directory of the pipeline and execute command `. bashrc`. This will add `bin` folder to your `$PATH` environment variable. Remember to re-execute it every time you log in.
2. We assume your machine have IBM LSF systems. If not, change `head/do_head.sh` and add line `bsub="bash"`.
3. Enter `head` folder and edit `lsf_head.sh`. 
   1. Line `. "${HOME}"/lib/libdo` loads LibDO in YuZJLab MiniPrograms. Please change the path after `. ` to the actual path of `libdo` or soft-link the `lib` directory of your YuZJLab MiniPrograms installation to `"${HOME}"/lib`.
   2. The references we use in human are `hg38` provided by GATK bundle available from <ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/>. Please change the line starting with `HG=` to the correct path of `GATKBUNDLE/hg38`.

4. The files ignored by Git is recorded in `.gitignore` under the root directory and its sub-directories. You can manipulate them as your wish.

## Usage

The complete guide of this pipeline is distributed in each steps. Each folder starting by a number and a unserline represents a step and the numbers indicates the order of steps. You can find specific guidance in each folder and please be aware that:

1. Those steps with same order can be executed parallelly.

2. **NEVER PERFORM A SPECIFIC STEP BEFORE THE PREVIOUS STEP FINISHES**.

## Naming Specifications

### Logs

`lsf_${sample}_${date}.log` are logs produced by LSF.

`${sample}_${date}.log` are logs produced by LibDO. You can use `libdoman` from YuZJLab LinuxMiniPrograms to get a user-friendly interface of manipulating log files produced by LibDO.

The format of `${date}` should be `YYYY-MM-DD_HH-MM`. e.g., `2020-03-12,16-32`. This can be generated by 

````bash
date +%Y-%m-%d,%H-%M
````

### Failed Trials

Those collapsed files or files generated by incorrect commands should be placed under `attemp${trial}` folder of each step.

### Archives

All used logs, read files and intermediate files should be compressed and archived by XZ Utils in level 9. Those `bam` files should be re-compressed.

## General FITF (File In The Folder)

This section lists the special files in the subfolders.

`Readme.md` A Markdown file indicates what is in this folder and some comments about the commands

`.gitignore` Files and folders which should be ignored by Git under its folder and sub-folders.

`do.sh` Shell script which commit jobs to LSF. **YOU SHOULD EXECUTE THIS FILE**.

`exec/lsf.sh` What will be done by LSF.  **YOU SHOULD NOT EXECUTE THIS FILE**.

`config` Configure file for a single step.

`/all.conf` Configure file for the entire system.

`clean.sh` Clean unarchived files under each path.

`archive.sh` Archive the project.

## Specific FITF

`BeforeCommit.sh` The script which converts Windows' line endings (CRLF) to GNU/Linux line endings (LF).

`head/` The scripts inside defines variables which may be used in multiple procedures.

`doc/` Documentations for the developers.

`INSTALL.md` A blank file.

`VERSION.md` Current version and version history.

`TODO.md` Improvements available in further versions.