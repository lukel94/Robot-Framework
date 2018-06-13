#!/bin/bash
# This script is facs_viewer_cleanup.sh.
# Purpose: This script lets you remove many Customer Site databases from the Ordo facs_viewer using a file that lists 
#          the sites to be removed.
# 
# Author: Norm Wheatley (C) Vigilent August 2015
#
DESCRIPTION="
This script removes Customer databases from the Ordo facs_viewer. Several questions are asked :-
1) Do you just want a list of the current customer sites? (you can create the removals list from this) 
2) Username ... you cannot remove customer sites anonymously.
3) Reason ... why are the sites being removed
4) Removals file ... this is a list of the sites to be removed, the format is
<CUST>-<SITE>-<VERSION> ... and you can use comments eg
# 
# This is a sample Removals.list file
#
IBM-NC-3
IBM-NC-4
VERIZON-RESTON-11
VERIZON-RESTON-13
NOTE: A log file will be created in the format fviewer-removals-<DATE>-<User>.log
      Any incorrect listings in the Removals file will be skipped.
"
#  TO DO
#  1.  
#
# write out the help
PROG=$(basename $0)
if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "--h" ]; then
    printf '%s\n' "$DESCRIPTION"
    exit 0
fi
#
# make sure the script is started under sudo
if (( $EUID != 0 ));
then
  echo "$0 must be run under sudo.";
  exit 1;
fi
#
# set up the directories exepected
#
working_dir=/home/fc/facs_viewer4
working_web_dir=/home/fc/viewer4/vigs/Web/
sites_dir=/etc/apache2/sites-available/
cd $working_dir
#
# If the user only wants a list of what Customer sites are currently on ordo , make current_sites.list and exit
# 
read -p "Do you want a list of the current Customer Sites on the facs_viewer? (def is yes) " list_given
if [ ! ${list_given} ]; then
  num_sites=`ls --hide=def* ${sites_dir} | wc -l`;
  current_sites=`ls --hide=def* $sites_dir`;
  echo "$current_sites" > current_sites.list;
  echo "";
  echo "There are ${num_sites} sites and they're listed in the current_sites.list file";
  exit 0;
fi
#
# Ask user for their name, the reason for removals and the name of the removals list file.
#
echo "You must give your name, reason and a list of sites to be removed."
while [ "${user_name}" == "" ]
do
  read -p "What is your name please? " user_name
done
while [ "${removal_reason}" == "" ]
do
  read -p "Please explain why you are removing Customer Sites from facs_viewer (in one line) " removal_reason
done
#
#  Ask the user for the name of the removals file (this lists all the Customer sites to be removed). 
#  If the file is empty or non-existent, just exit with a message.
#
read -p "What's the Site Removals file? (def is removals.list) " removals_file
if [ ! ${removals_file} ]; then
  removals_file=removals.list;
fi
if [ ! -s ${removals_file} ] || [ ! -f ${removals_file} ];
then
   echo "Sorry, $removals_file is either empty or non-existent. Please start again."
   exit 1;
fi
echo ""
echo "Ok, $user_name, you want to remove Customer sites using $removals_file because \"$removal_reason\""
echo "The sites you want to remove are ..."
cat ${removals_file}
#
# Are you serious? Give the user a chance to stop now.
#
echo ""
read -p "Ordo facs_viewer will be disabled - are you sure you want to do this? (yes/no def=no)" carry_on
if  [ ! ${carry_on} ] || [ $carry_on != "yes" ];
then
  echo "Ok, have a think ... maybe you can do it later :)";
  exit;
fi
#
# Ok, the user is serious .. so now do the removals
#
# First build the log file name
#
user_name=`echo "${user_name}" | tr ' ' '-'`
log_file=fviewer-removals-`date +"%Y-%m-%d-%T"`-${user_name}.log
echo "We're going to log exactly what happens in the log file ${log_file}"
echo ""
echo "Please wait ....."
echo ""
exec 3>&1 4>&2 >${log_file} 2>&1
echo "Date: `date +"%Y-%m-%d-%T"`"
echo "User: ${user_name}"
echo "Reason for removing Customer sites from Ordo's Facs_viewer: ${removal_reason}"
echo ""
echo "Customer Sites that will (hopefully) be removed (these are in the file ${removals_file})"
echo ""
cat ${removals_file}
echo ""
echo "Stopping the facs_viewer" 
echo "Working in `pwd`"
#
# stopping ordo
sudo ./ordo_control.sh stop
#
# Read the removals file, grab each site's details then uninstall them.
#
while read line;
do
   if [ "${line:0:1}" != "#" ];
   then
     cust=`echo "$line" | awk -F"-" '{print $1}'` ;
     site=`echo "$line" | awk -F"-" '{print $2}'`;
     version=`echo "$line" | awk -F"-" '{print $3}'`;
     site_exists=`ls  --hide=def* /etc/apache2/sites-available/ | grep "${cust}-${site}-${version}"`;
     if [ "${site_exists}" != "" ];
     then
       echo "cust = ${cust}, site=${site}, version=${version}";
       cd ${working_dir};
       sudo ./uninstall.sh ${cust} ${site} ${version};
       cd ${working_web_dir};
       sudo make uninstall SITE=${cust}-${site}-${version};
     else
       echo "site ${cust}-${site}-${version} does not exist!";
     fi
   fi
done < ${removals_file}
#
# Ok, the Customer sites are all deleted so now restart ordo facs_viewer.
#
echo "Restarting the facs_viewer"
cd ${working_dir}
sudo ./update_active_sites.sh
sudo ./ordo_control.sh start