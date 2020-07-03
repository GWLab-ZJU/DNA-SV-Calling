# Readme

This directory performs the step of read quality control. In this step, a read quality report will be generated for each read file.

If you're confident about your file, you can skip this step by linking all `.fq.gz` files from the folder of step 1 to step 3.

## Using LightHttpd Server

To save the time you wasted on downloading the FastQC report, we added the script `start_web_server.sh` which allows you to start a web server (`lighthttpd`) and get access to your reports.

### Pre-Requirements

1. You have a LightHttpd installation on your computer and command `lighthttpd` was added to `$PATH` environment variable.
2. You have got **EXPLICIT PREMISSION** from your sysadmin and got a port number (e. g. 8080).

### Configuration

The configuration file of LightHttpd was `lighthttpd.conf`. What you need to do is to change `8080` in line `server.port = 8080` to allocated port. Other configurations will be updated when executing `start_web_server.sh`.

### Starting the Server

After all reports are correctly generated, execute `start_web_server.sh`. This script will do the following things:

1. Open `lighthttpd.conf` and modify line `server.document-root` and add your working directory.
2. Generate `index.hrml`.
3. Start the server **at the front end**. After finished using the server, use `Ctrl-c` to terminate the server.

## Archiving this Folder

You may archive this folder after performing step 3.

When archiving, what we will do is to decompress all zip archives and recompress them in `tar.xz` format. We'll also archive all logs, web pages and configuration files.

## Special FITF

`start_web_server.sh` This script can start a server (LightHttpd) which allows you to view the results on a browser without downloading them.

`lighthttpd.conf` The configuration file for LightHttpd.

