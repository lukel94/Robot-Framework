
#!/bin/csh -f
#
# Read a file in 3 line chunks and check certain values
# that are less than some threshold.
#
set me = `basename $0`
set threshhold = "0.50" # Show lines < this

# Identify the file to be read
if ( "x$1" == "x-h" ) then
  echo "Usage: $me < infile"
  echo ""
  echo "Read 'infile' in 3 line chunks and show lines"
  echo " with certain values less than some threshhold"
  exit 1
endif

# Read until EOF in three line chunks. If the file is "short"
# the data will come from the terminal.
set eof = "n"
while ( $eof == "n" )
  set line1 = $<
  if ( "x$line1" == "x" ) then
    break
  endif
  set line2 = $< # Not actually used
  if ( "x$line2" == "x" ) then
    echo "$me - Premature end of file"
  exit 3
  endif
  set line3 = $< # E.g. 0.0 cM 0.92 0.96 0.88 0.88 0.87
  if ( "x$line3" == "x" ) then
    echo "$me - Premature end of file"
    exit 3
  endif

  # Check 3rd, 5th ns 7th values against the threshhold
  set l = ( $line3 ) # Tokenize this line
  #echo "==>$l[3] $l[5] $l[7]"
  set rc3 = `expr $threshhold \>= $l[3]`
  set rc5 = `expr $threshhold \>= $l[5]`
  set rc7 = `expr $threshhold \>= $l[7]`
  if ( $rc3 != 0 || $rc5 != 0 || $rc7 != 0 ) then
    echo $line1
    echo $line3
  endif
end