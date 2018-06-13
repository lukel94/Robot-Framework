#!/bin/csh -f

set DS = \$

alias lower      tr 'A-Z' 'a-z'
alias upper      tr 'a-z' 'A-Z'
alias rot13     "tr 'A-M N-Z a-m n-z' 'N-Z A-M n-z a-m'"

alias ltrim     "sed 's/^[ \t\n\r]*//'"
alias rtrim     "sed 's/[ \t\n\r]*$DS//'"
alias trim      "sed 's/^[ \t\n\r]*//;s/[ \t\r\n]*$DS//'"


echo Hello | lower 
echo Hello | upper
echo Hello | rot13

echo "  yabba dabba do" | rtrim

set HELLO = " hELLO "
if ( `echo $HELLO | lower | trim` == "hello" ) then
      echo "match"
endif
