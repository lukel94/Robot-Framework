<h3>Example A: Let the instruction complete itself</h3> 
<!--- first, set a variable ---> 
<cfset myVariable = 3> 
<!--- now, perform a loop that increments this value ---> 
<cfloop from = "1" to = "4" index = "Counter"> 
    <cfset myVariable = myVariable + 1> 
</cfloop> 
 
<cfoutput> 
<p>The value of myVariable after incrementing through the loop #Counter# times is: 
    #myVariable#</p> 
</cfoutput> 
 
<h3>Example B: Use cfabort to halt the instructions with showmessage attribute and 
    cferror</h3> 
<!--- Reset the variable and show the use of cfabort. ---> 
<cfset myVariable = 3> 
<!--- Now, perform a loop that increments this value. ---> 
<cfloop from = "1" to = "4" index = "Counter"> 
<!--- On the second time through the loop, cfabort. ---> 
    <cfif Counter is 2> 
    <!--- Take out the cferror line to see cfabort error processed by CF error page. ---> 
        <cferror type="request" template="request_err.cfm"> 
        <cfabort showerror="CFABORT has been called for no good reason"> 
<!--- Processing is stopped, ---> 
<!--- and subsequent operations are not carried out.---> 
    <cfelse> 
        <cfset myVariable = myVariable + 1> 
    </cfif>  
</cfloop> 
 
<cfoutput> 
<p> The value of myVariable after incrementing through the loop#counter# times is: #myVariable#</p> 
</cfoutput>