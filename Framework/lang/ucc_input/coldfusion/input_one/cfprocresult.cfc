<!--- This example executes a Sybase stored procedure that returns three result sets, two 
of which we want. The stored procedure returns status code and one output parameter, which 
we display. We use named notation for parameters. --->
<!--- cfstoredproc tag --->
<cfstoredproc procedure = "foo_proc"
dataSource = "MY_SYBASE_TEST" username = "sa"
password = "" dbServer = "scup" dbName = "pubs2"
returnCode = "Yes" debug = "Yes"> 
<!--- cfprocresult tags --->
<cfprocresult name = RS1> 
<cfprocresult name = RS3 resultSet = 3> 
<!--- cfprocparam tags --->
<cfprocparam type = "IN" CFSQLType = CF_SQL_INTEGER value = "1"> 
<cfprocparam type = "OUT" CFSQLType = CF_SQL_DATE variable = FOO> 
<!--- Close the cfstoredproc tag. --->
</cfstoredproc> 
<cfoutput> 
The output param value: '#foo#'
</cfoutput> 
<h3>The Results Information</h3> 
<cfoutput query = RS1>#name#,#DATE_COL# 
</cfoutput> 
<p></p> 
<cfoutput> 
<hr> 
<p>Record Count: #RS1.recordCount# <p>Columns: #RS1.columnList#</p> 
<hr> 
</cfoutput> 
<cfoutput query = RS3>#col1#,#col2#,#col3# 
</cfoutput> 
<p></p> 
<cfoutput> 
<hr> 
<p>Record Count: #RS3.recordCount# <p>Columns: #RS3.columnList#</p> 
<hr> 
The return code for the stored procedure is: 
'#cfstoredproc.statusCode#'
</cfoutput> 