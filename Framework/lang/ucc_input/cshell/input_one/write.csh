% cat /bin/SEARCH
  #!/bin/csh -f
  # SEARCH: searches for patterns in requested files.
  #         Uses grep to look for specified patterns in each file.
  #         Reports filename and line number where pattern is found.
  # Usage:  SEARCH pattern(s)
                                                  
  set com = $0                                    #
  if ($#argv == 0) then                           # must have at least
   echo "Usage: $com:t pattern(s)"                # 1 argument
   exit 1                                         #
  endif                                           #
                                                  #
  set flist =  " "                                #
  set plain = `ls -a | grep '^\.*[#0-9a-zA-Z].*'` # get list of plain files
  foreach file ($plain)                           #
   file $file | grep "text" > /dev/null || \      # get list of ASCII files
   file $file | grep "script" > /dev/null || \    #
   file $file | grep "command" > /dev/null        #
   set ok = $status                               #
   if ($ok == '0') set flist = "$flist $file"     # add text-file
  end                                             #
                                                  #
  foreach pattern ($argv[*]:q)                    # loop over quoted patterns
   echo " "                                       # extra line for read-
   echo "$pattern":                               # ability; display pattern
   echo '-------------------------------'         #
   grep -n "$pattern" $flist                      # search all files for pattern
  end
  % cat /bin/SHOW_FILES
  #!/bin/csh -f
  # to display plain files (links)
  # usage: SF (pattern)
  #
  ls -l $* | grep ^- | tee '.file(s)' | more      # display plain files and
  echo '       ---------------'                   # write them to '.file(s)'
  mv '.file(s)' 'file(s)'                         # rename '.file(s)'
  echo -n '           '                           #
  wc -l 'file(s)'                                 # count lines in 'file(s)'
  rm 'file(s)'                                    #
  ls -l $* | grep ^l | tee '.link(s)' | more      # display links and write them
  set num = `wc -l '.link(s)' | awk '{print $1}'` # to '.link(s)', count lines
  mv '.link(s)' 'link(s)'                         # rename '.link(s)'
  if ($num != '0') then                           # if number of links > 0 then
   echo '       ---------------'                  # write number to screen
   echo -n '           '
   wc -l 'link(s)'
  endif
  rm 'link(s)'
  % cd /F90
  % SHOW_FILES
  -rwxr-----   1   peter  edvz   3340  libf90.a
  -rwxr--r--   1   peter  edvz  67862  program
  -rw-rw-r--   1    root  edvz   2346  program.f90
  -rw-rw----   1   peter  edvz  25478  program.o
         ---------------
             4 file(s)
  %
  