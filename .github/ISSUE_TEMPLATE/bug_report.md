---
name: Bug report
about: Create a report to help us improve
title: ''
labels: ''
assignees: ''

---

**Version Information:**

```Version
# We will use a script to automatically extract this field.
# Line starting with '#' will be omitted.
# FORMAT: Software; Version
# The following several lines are examples:
CentOS;8
BWA;v0.7.17-r1188
Samtools;v1.10 with htslib v1.10
```

## Introduction

This is the template to help you report bugs of our pipeline to us on Github. We are open to any bug, issue and opinion related to our pipeline. We would like to thank you for raising them to us. Your issue and opinion will help us improve our work better.

## Checklist before Reporting the Bug

Please tick all the following items to let us know how you handle the bug or issue.

- [ ] This problem is **TECHNICAL** and it has nothing to do with racialism, politics, sexism, religion or other non-technical aspects.

    **NOTICE**: If you find any potential bias including but no limit to racialism, political bias, sexism and religion bias, please directly contact with Edison Jianning KANG (e-mail address: jianning.18@intl.zju.edu.cn). We will respond to it rapidly.

- [ ] I have read all the documentation, wiki pages and issues of this project, and confirm that it is a new issue.
- [ ] I have searched Google, StackOverflow and BioStars to solve the problem.
- [ ] I have run the codes at least twice, and confirm that I run it as the **README** instructed.

## Describe the Bug

Please organize this section of your bug report by answering the following questions:

1. Which step does the error raises (e. g. `2_FASTQC `)?
2. Does the raw data (i.e. FASTA file) come from a public database or your own research? 
    - [ ] Public dataset with accession number (e. g. `SRR3182419`):
    - [ ] Unpublished data.

3. If your raw data comes from a public dataset, please paste your `lsf*.log` and `[step].log` in following boxes. If you're not using LSF, please paste logs produced by Bash in the first box. If you use the unpublished data, please mark private information in '\*'.

   ```lsf.log
   #lsf.log here. Log produced by LSF.
   ```

   ```[step].log
   #[step].log here. Log produced by YuZJLab LibDO.
   ```

## Potential Problem

Tick one of the following to tell us what you think has gone wrong.

- [ ] Incompatible operating system. e. g. You're using Scientific Linux and find incompatibilities (This program is developed under Windown10 and CentOS).
- [ ] Obsolete program. e. g. You're using bash 5.0 and find incompatibilities (This program is developed under bash 4.4).
- [ ] Codes bug.
- [ ] Others

## Expected Behaviour

A clear and concise description of what you expected us to react to this issue.

## Additional Information

Any other information. 
