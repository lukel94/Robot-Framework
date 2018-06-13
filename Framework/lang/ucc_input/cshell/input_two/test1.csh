
#!/bin/csh  
echo "beginning.."  

set fline = `grep -n 'wire' $1 | sed 's/:.*$//g'`  
foreach line ( $fline )  

   set i = $line  
   echo "$i"  
   set flag = 0  
   sed -n "${i}p" ${1} | grep ';$' >& /dev/null   
  if ( $status ) set flag = 1  
   while ( $flag == 1 )  
      @ i = $i + 1  
      set flag = 0  
      sed -n "${i}p" ${1} | grep ';$' >& /dev/null  
      if ( $status ) set flag = 1  
   end  
   sed -i -r "${line},${i}s/n_Logic(0|1)_[[:blank:]]*,[[:blank:]]*|,[[:blank:]]*n_Logic(0|1)_[[:blank:]]*|wire[[:blank:]]*n_Logic(0|1)_[[:blank:]]*;//g" ${1}  
end #end of foreach；