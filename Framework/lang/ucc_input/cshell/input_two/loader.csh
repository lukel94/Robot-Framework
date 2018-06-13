#!/bin/bash
#
# AUTHOR: N Wheatley (C) vigilent 2015
# DATE: 7/30/2015 - initial script written.
#
# This script takes Customer site backups (Db or logs) and stores them on the # # Ordo server. The database backups are also installed on the facs_viewer.
# Emails are sent out when finished.
# The script is run every 30 minutes (or so) as a cron job. The script uses the # box-linux-sync and WebDAV (davfs2) programs to mount Vigilent's complete # # # # Box.com file set on the drive /nfs 
#
#DESCRIPTION="
This script adds Customer Site databases to the Ordo facs_viewer. It should be run as an hourly cron job. It scans the Vigilent Box.com account for
log and database backup (.tgz) files. The backup files are saved and the originals re-named. Emails are sent out when finished.
Output log files are in ~/facs_viewer4/cron-output-facs_viewer_loader.log and ~/db_FacsViewerArchive/facs_viewer4_posting_logs with format <DATE>-<CUST>-<SITE>.log

The script uses the box-linux-sync and WebDAV (davfs2) programs to mount Vigilent's complete Box.com file set (All Files > Customer> Ordo-upload-files) on
the drive /nfs/box-files-all-vigilent/Ordo-upload-files.
"
#
 
# LOGICAL PSEUDOCODE (can be put in a README file at some stage):
#
# first ensure we're running under sudo ... if not, exit with log msg L4 "must 
# invoke with sudo"
# set working directory - this is needed when it runs in a cron job
# now ensure a previous program is not still running ... if busy exit with log
# msg L1 "busy - try later" 
# if box-linux-sync is up and running (Box folders exist) then
#   continue and write log message L6 - "Box-linux-sync is running ok"
# else
#   if the box-linux-sync password file doesn't exist, exit with log/email msg 
#           M9 - "Box-linux-sync is dead and we cannot find the password file."
#   else try to start box-linux-sync and send log/email msg M12 "Trying to start 
#               box-linux-sync"
#     if ok 
#       sleep for 60 seconds to let files mount
#       continue with log/mail msg M10 - "Box-linux-sync started ok"
#     else
#       exit with log/email msg M11 - "Box-linux-sync didn't start with login 
#                                        file"
# now get the new files *.tgz
# repeat for each *.tgz file found
# extract the customer and site name .... log msg L2 - "got new .tgz file"
# if file is empty ... exit with log/email msg M8 - "file is empty"
# if the file is invalid .. rename file, skip to next, with email/log M6 "file 
#                    is not a valid logs or DB backup - skipping and renaming"
# If the filename contains spaces or brackets then change them to dashes (ie 
#                                  rename the file) .. this is for Reggie :)
# check file integrity  (using tar -tf)
#   if file is corrupt ... rename file and exit with log/email msg M7 - "backup 
#                                                           is corrupt, renamed"
#   if ok then
#     write log msg L3 - "file is good"
#     if log file
#       copy to log repo
#       if ok
#         rename file, skip to next file with email/log msg M4 "logs backup 
#                                                       saved, file renamed" 
#       else
#         rename file, skip to next file with email/log msg M5 "logs backup not 
#                                                        saved, file renamed" 
#     else if db backup
#       write log msg L5 - "installing db on facs_viewer"
#       install file on facs_viewer
#       if ok 
#         copy to Db repo
#         if ok
#           rename file, skip to next, with email/log M1 "DB installed on 
#                                                  facs_viewer and stored ok"
#         else
#           rename file, skip to next, with email/log M2 "DB installed on 
#                                        facs_viewer but failed to store"
#       else
#         rename file, skip to next, with email/log M3 "DB install on 
#                                                   facs_viewer failed"
#
# Assumptions:
#   1. all log file backups will contain the word "log" (in any case)
#   2. All database backups will not contain the word "log" but will contain the 
#                                                                    word "back"
#   3. <CUST>, <SITE> and .tgz folder/file names should not contain spaces or
#                                                             brackets.
#   3. Spaces and braces in .tgz filenames will be changed to dashes "-" 
#   4. Spaces and brackets in <CUST> and <SITE> folders are not changed - their 
#                                            .tgz files will not be processed.
#   5. We create all <CUST>/<SITE> directories before storing the backup .tgz                        
#                                                                    files 
#   6. After copying the files we change owner from root to fc (they're root as 
#                                                             we run in sudo).
#   6. We check whether the program is already running (using ps -ef) 
#   7. send email as CC to Roy and shawna - waiting for 
#                 facs_viewer_admin@vigilent.com email alias to be created.
#
# TO DO
#  1. check that both <SITE> and <CUST> folders are present  
#  2. Create the README file and put it somewhere useful
#
# write out the help info
PROG=$(basename $0)
if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "--h" ]; then
   printf '%s\n' "$DESCRIPTION"
   exit 0
fi
#
# Check that we're started as sudo ... needed for build_ordo_db.sh, if not, exit with log msg L4 "must run under sudo"
if (( $EUID != 0 ));
then 
  echo `date +"%Y-%m-%d %T"` "$0 must be run under sudo."; 
  exit 1; 
fi
working_dir=/home/fc/facs_viewer4
search_dir=/nfs/box-files-all-vigilent/Customers/Ordo-upload-files
bosun_keyfile=/places/releases/keys/box.com-userpass 	# bosun's password file for Box.com account
mailTo=facs_viewer_admin@vigilent.com
mailCc="normwheatley@gmail.com"
mailFrom=nwheatley@vigilent.com
logBackupRepo=/places/sitelogs
dbBackupRepo=/home/fc/db_FacsViewerArchive
installLogRepo=/home/fc/db_FacsViewerArchive/facs_viewer4-posting-logs
#
# go into the working directory - this is needed when it runs in a cron job
cd $working_dir
#
#  Send emails - NB: No checking to see if emails work.
# 
function SendEmail(){
  echo "To:$mailTo" > email-msg.mail
  echo "Cc:$mailCc" >> email-msg.mail
  echo "From:$mailFrom" >> email-msg.mail
  echo "Subject:$1"  >> email-msg.mail
  echo -e "$2\n"  >> email-msg.mail
  echo "$3"  >> email-msg.mail
  sendmail -t < email-msg.mail	# -v option also emails fc (so don't use).
  echo "email sent to $mailTo"
}  # end function SendEmail
#
# Main processing starts here
#
# check if we're already working on another .tgz file (exit if we are) (L1)
#
busy_working=`ps -ef | grep facs_viewer_loader.sh | wc -l`
if [ ${busy_working} -gt 4 ];
then
   echo `date +"%Y-%m-%d %T"` "Busy - $0 is already running so we must wait for the current backup file installation to complete";
   exit 1;
fi
#
# If box-linux-sync hasn't been started - try and start it, exit if unable to do so.
#
if [ ! -d $search_dir ];
then
   bosun_login="none"
   bosun_passwd="none"
   if [ -e $bosun_keyfile ] ;
   then
      bosun_login=`awk -F: '{print $1}'  $bosun_keyfile`
      bosun_pwd=`awk -F: '{print $2}' $bosun_keyfile`
   else
#
#     If we can't find the user/pwd file to start box-linux-sync, then exit with log/email msg - M9 
#
      mailBody="`date +"%Y-%m-%d %T"` Box-linux-sync has not started and cannot get login/password file for box-linux-sync, please contact the Admin";
      mailSubject="Cannot see any Box.com files and cannot get login for box-linux-sync";
      echo "$mailBody";
      SendEmail "$mailSubject" "$mailBody";
      exit 1
   fi
#
# Send log/email msg M12 "starting box-linux-sync" if we need to start box-linux-sync (should be a rare event)
#
   mailBody="`date +"%Y-%m-%d %T"` Cannot see any Box.com files. Starting box-linux sync with sudo /home/fc/git/box-linux-sync/bin/box-sync start";
   mailSubject="Cannot see any Box.com files. Attempting to start box-linux-sync";
   echo "$mailBody";
   SendEmail "$mailSubject" "$mailBody";
#
# Now try so start box-linux-sync
#
   echo -e "${bosun_login} \n${bosun_pwd}\n" |  /home/fc/git/box-linux-sync/bin/box-sync start
   if [ $? -eq 0 ];
   then
#
# Send log/email msg if we successfully started box-linux-sync (and sleep for 60 secs to let the files mount)
#
      mailBody="`date +"%Y-%m-%d %T"` Box-linux-sync has been started.";
      mailSubject="Box-linux-sync has been started.";
      echo "$mailBody";
      SendEmail "$mailSubject" "$mailBody";
      sleep 60;
   else
#
# If we can't start box-linux-sync maybe the login or password is wrong so exit with log/email msg M11 "cannot start box-linux-sync"
#
      mailBody="`date +"%Y-%m-%d %T"` Cannot start Box-linux-sync even with the user/password file. Has something changed? Contact the Admin";
      mailSubject="Cannot start Box-linux-sync. Please contact the Admin";
      echo "$mailBody";
      SendEmail "$mailSubject" "$mailBody";
      exit 1;
   fi
fi
# 
#  Box-linux-sync is up and running nicely - log msg L6
   echo `date +"%Y-%m-%d %T"` "Box-linux-sync is up and we can see all of Vigilent's Box.com files ok in /nfs/box-files-all-vigilent";
#
# Now get the list of .tgz files
# Set the Internal field Separator to null so we can get the whole filename inicluding spaces
#
OIFS="$IFS"
IFS=$'\n'
for latest_file in `find $search_dir/ -name "*.tgz" -type f -print`
do
# 
# Found new file, log message (L2) and save <CUST> and <SITE> of the file
  cust=`echo "$latest_file" | awk -F"/" '{print $6}'`
  site=`echo "$latest_file" | awk -F"/" '{print $7}'`
  echo "`date +"%Y-%m-%d %T"` Found new .tgz file to install ... $latest_file"
#
# if file is empty, rename to .empty send log/email msg (M8) "empty file" and go to next file
  if [ ! -s $latest_file ];
  then
    mailBody="`date +"%Y-%m-%d %T"` File $latest_file is empty and will be renamed to  $latest_file.empty";
    mailSubject="Empty $cust $site backup .tgz file!";
    echo "$mailBody";
    SendEmail "$mailSubject" "$mailBody";
    mv $latest_file $latest_file.empty;
    continue;
  fi
#
# If file is not a log or db backup then skip to next file with log/email msg (M6) "invalid .tgz file"
#
  if [[ ! ${latest_file^^} =~ "LOG"  &&  ! ${latest_file^^} =~ "BACK" ]];
  then 
    mv $latest_file $latest_file.invalid_name
    mailBody="`date +"%Y-%m-%d %T"` $latest_file is not a log or Db backup so rename it to .invalid_name and skip to next backup file.";
    echo "$mailBody";
    mailSubject="Invalid .tgz file for $cust $site, renaming it!";
    SendEmail "$mailSubject" "$mailBody";
    continue;
  fi
#
# Replace spaces and brackets in .tgz filenames (not in <CUST>, <SITE> folder names) with dashes ... this is for Reggie :)
#
  fixed_latest_file=`echo $latest_file | tr ' ' '-'`
  fixed_latest_file=`echo $fixed_latest_file | tr '(' '-'`
  fixed_latest_file=`echo $fixed_latest_file | tr ')' '-'`
  if [ "${latest_file}" != "${fixed_latest_file}" ]
  then
    echo "Replace spaces and brackets in the filename ... rename $latest_file to $fixed_latest_file";
   `mv $latest_file $fixed_latest_file`;
    latest_file=$fixed_latest_file;
  fi
#
# if file is corrupt rename to .corrupt and exit with log/email msg (M7) else write log msg (L3)
  tar -tf "$latest_file"
  if [ $? -eq 0 ];
  then
    echo "`date +"%Y-%m-%d %T"` File $latest_file is not corrupt";
  else
    mailBody="`date +"%Y-%m-%d %T"` File $latest_file is corrupt and will be renamed to  $latest_file.corrupt";
    mailSubject="Corrupt $cust $site backup .tgz file!";
    echo "$mailBody";
    SendEmail "$mailSubject" "$mailBody";
    mv $latest_file $latest_file.corrupt;
    continue;
  fi
#
# if the file is a log file then copy it to the repository and rename it.
  if [[ ${latest_file^^} =~ "LOG" ]]
  then
     echo `date +"%Y-%m-%d %T"` "copying the logs backup file $latest_file to $logBackupRepo/$cust/$site/"
     `mkdir -p $logBackupRepo/$cust/$site/`;
     `cp $latest_file $logBackupRepo/$cust/$site/`;
     `chown -R fc:fc $logBackupRepo/`;
#
#    if the log file backup copy failed, send log/email msg (M5) and go to the next file
     if [ $? -ne 0 ];
     then
        mailBody="`date +"%Y-%m-%d %T"` Failed to copy $latest_file $logBackupRepo/$cust/$site/";
        mailSubject="Failed to store backup logs for $cust $site in logs repository!";
        echo "$mailBody";
        SendEmail "$mailSubject" "$mailBody";
        continue;
     fi
#
#    the copy succeeded so rename the file to .copied_ok with log/email msg (M4)
     mailBody="`date +"%Y-%m-%d %T"` Stored logs backup $latest_file in $logBackupRepo/$cust/$site/"
     mailSubject="Stored backup logs for $cust $site in backup logs repository.";
     echo "$mailBody";
     SendEmail "$mailSubject" "$mailBody";
     mv $latest_file $latest_file.stored_ok
#
#  the .tgz file is not a LOG file backup so see if it's a DB backup file (it should be!) and write log msg (L5)
#
   elif [[ ${latest_file^^} =~ "BACK" ]]
   then
      install_log=`date +"%Y-%m-%d-%T"`-$cust-$site.log
      echo `date +"%Y-%m-%d %T"` "Installing the DB backup for $cust $site from backup file $latest_file logging to $install_log";
      echo "Running command  ./build_ordo_db.sh $cust $site $latest_file > $install_log"
      ./build_ordo_db.sh $cust $site $latest_file > $install_log;
      install_passed=$?
      echo "install_passed=$install_passed"
#
#     copy the install_log file and check if install succeeded
      if [ $install_passed -eq 0 ];
      then
#        if installed ok, move the install log (assume this works ... no big deal if not) ... log the move
         echo `date +"%Y-%m-%d %T"` "Successfully installed $latest_file, now move the install log $install_log to $installLogRepo";
         `mv $install_log $installLogRepo`;
         `chown -R fc:fc $installLogRepo/`;
#
#        copy the database backup file to the DB repository and rename it (change owner from root to fc) send log/email msg (M1)
         `mkdir -p $dbBackupRepo/$cust/$site/`;
 	 `cp $latest_file $dbBackupRepo/$cust/$site/`;
         `chown -R fc:fc $dbBackupRepo/`
         if [ $? -eq 0 ];
         then
           `mv $latest_file $latest_file.installed_and_stored_ok`
            mailBody="`date +"%Y-%m-%d %T"` Installed $latest_file on the facs_viewer and stored the .tgz file in the repo $dbBackupRepo/$cust/$site/";
	    mailBody2="Renaming the database backup file to $latest_file.installed_and_stored_ok";
	    echo "$mailBody";
            mailSubject="Successfully installed DB for $cust $site on the facs_viewer and stored the .tgz file in the Db repository!";
            SendEmail "$mailSubject" "$mailBody" "$mailBody2";
            continue;
         else
#
#          failed to store the DB in the repo, but it was installed ok, so write log/email msg (M2) and skip to next file
           `mv $latest_file $latest_file.installed_but_not_saved`;
            mailBody="`date +"%Y-%m-%d %T"` Successfully installed $latest_file on the facs_viewer but failed to store the .tgz file in the repo $dbBackupRepo/$cust/$site/";
	    mailBody2=$mailBody "Renaming the database backup file to $latest_file.installed_but_not_stored";
	    echo "$mailBody";
            mailSubject="Successfully installed DB for $cust $site on the facs_viewer but failed to store the .tgz file in the Db repository!";
            SendEmail "$mailSubject" "$mailBody" "$mailBody2";
   	    continue;
         fi
      else
# 
#     the install to facs_viewer failed so rename it, send log/email msg (M3) and go to next file
        `mv $latest_file $latest_file.install_failed`;
         mailBody="`date +"%Y-%m-%d %T"` Failed to install $latest_file on the facs_viewer, renaming the file to .install_failed and skipping to next backup file.";
         echo "$mailBody";
         mailSubject="Failed to install DB backup file for $cust $site on the facs_viewer, renaming it!";
         SendEmail "$mailSubject" "$mailBody";
   	 continue;
      fi
   fi
done
#
# finally delete the busy_working flag and reset the IFS
IFS=$OIFS
rm $busy_working 2>/dev/null
     