<!--- This example produces as many cached files as there are URL parameter permutations. 
You can see that the page is cached when the timestamp doesn't change.---> 
 
<cfcache 
    timespan="#createTimeSpan(0,0,10,0)#"> 
<body> 
 
<h3>This is a test of some simple output</h3> 
 
<cfoutput> 
    This page was generated at #now()#<br> 
</cfoutput> 
 
<cfparam name = "URL.x" default = "no URL parm passed"> 
<cfoutput>The value of URL.x = # URL.x #</cfoutput> 