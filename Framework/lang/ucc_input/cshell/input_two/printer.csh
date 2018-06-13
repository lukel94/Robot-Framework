#!/bin/bash
# This script is print-configs.sh.
# Purpose: This script reads the configs.json file and prints out the Config params one per line ) and their defvalue, data, visibilty and obsolete flag.
#          It can be used for testing eg for checking that the Configuration Paramters are implemented as per the specs (eg in QATS Config tests jira-3239)
#
# Author: Norm Wheatley (C) Vigilent September 2015
#
#
DESCRIPTION="
This is print-configs.sh, it reads the configs.json file and prints out the Config params one per line with their defvalue, data, visibilty and obsolete flag.
It can be used for testing eg for checking that the Configuration Paramters are implemented as per the specs.
The output is the file configs.json.parsed and a temporary file configs.json.trimmed. 
"
#
# write out the help
PROG=$(basename $0)
if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "--h" ]; then
    printf '%s\n' "$DESCRIPTION"
    exit 0
fi
#
# set the files and make sure they're fresh.
#
config_file=configs.json
trimmed_file=configs.json.trimmed
outfile=configs.json.parsed
if [ -e ${trimmed_file} ]; then rm ${trimmed_file}; fi;
if [ -e ${outfile} ]; then rm ${outfile}; fi;
touch ${trimmed_file}
touch ${outfile}
#
# first strip the "s from the config file
#
while read line;
do
   if [ "${line:0:1}" != "#" ];
   then
      outline=`echo $line | tr -d \"`;
     echo "$outline" >> ${trimmed_file};
   fi;
done < ${config_file}
#
#  Now parse out the configs names, data lines, defval and visibility lines 
# 
while read line;
do
   if [ "${line:0:1}" != "#" ];
   then
     if [ "${got_data}" == "T" ];
     then 
        outbuf=`echo "${outbuf} data: ${line}"`;
        got_data="";
     else  
       first_word=`echo $line | awk '{print $1}'`
       second_word=`echo "$line" | awk '{print $2}'` 
       if [ "${second_word}" == "{" ]; 
       then 
         if [ "${first_word}" == "data:" ]; 
         then 
           got_data="T";
         else
          echo "${outbuf}" >> ${outfile};
          outbuf=`echo "Got config ${first_word}"`;
         fi; 
       else
	 if [ "${first_word}" == "defval:" ] || [ "${first_word}" == "visibility:" ] || [ "${first_word}" == "obsolete:" ];
         then
           outbuf=`echo "${outbuf} ${line}"`;
         fi;
       fi;  
     fi;
   fi;
done < ${trimmed_file}