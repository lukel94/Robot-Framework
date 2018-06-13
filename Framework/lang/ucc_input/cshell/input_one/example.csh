
#!/bin/csh -f
# Example 3e
# ex3e.sh [-bell] [-number N] infile
set b = 'not set'
set n = 5
set infile = ''

echo "$#argv parameters found"
while ($#argv > 0)
  switch ($argv[1])
    case -b*:
      set b = 'set'
      breaksw
    case -n*:
      set n = $argv[2]
      shift
      breaksw
    case -*:
      echo "Unknown option '$argv[1]'"
      exit 4
    default: # Not an option, must be file
      set infile = $argv[1]
  endsw
  shift
end
echo "Option b=$b"
echo "Option n=$n"
echo "Infile=$infile"