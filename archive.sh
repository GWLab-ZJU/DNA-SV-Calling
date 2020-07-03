#!/usr/bin/env bash
echo -e "\e[033PLEASE BE AWARE: This will compress all your files!"
echo -e "If so, please press Enter. If not, Ctrl-C.\e[0m"
ls -F -1|grep /$|while read line;do
    if [ -e ${line}/archive.sh ];then
        cd ${line}
        bash archive.sh
        cd ..
    fi
done
