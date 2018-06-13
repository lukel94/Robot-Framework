<!--- type="inline"> --->
<cftimer label="Query and Loop Time Inline" type="inline">
<cfquery name="empquery" datasource="cfdocexamples">
SELECT *
FROM Employees
</cfquery>
 
<cfloop query="empquery">
<cfoutput>#lastname#, #firstname#</cfoutput>
</cfloop>
</cftimer>
<hr>
 
<!--- type="outline" --->
<cftimer label="Query and CFOUTPUT Time with Outline" type="outline">
<cfquery name="coursequery" datasource="cfdocexamples">
SELECT *
FROM CourseList
</cfquery>
<table border="1" width="100%">
<cfoutput query="coursequery">
<tr>
<td>#Course_ID#</td>
<td>#CorName#</td>
<td>#CorLevel#</td>
</tr>
</cfoutput>
</table>
</cftimer>
<hr>
 
<!--- type="comment" --->
<cftimer label="Query and CFOUTPUT Time in Comment" type="comment">
<cfquery name="parkquery" datasource="cfdocexamples">
SELECT *
FROM Parks
</cfquery>
<p>Select View &gt; Source to see timing information</p>
<table border="1" width="100%">
<cfoutput query="parkquery">
<tr>
<td>#Parkname#</td>
</tr>
</cfoutput>
</table>
</cftimer>
<hr>
 
<!--- type="debug" --->
<cftimer label="Query and CFOUTPUT Time in Debug Output" type="debug">
<cfquery name="deptquery" datasource="cfdocexamples">
SELECT *
FROM Departments
</cfquery>
<p>Scroll down to CFTimer Times heading to see timing information</p>
<table border="1" width="100%">
<cfoutput query="deptquery">
<tr>
<td>#Dept_ID#</td>
<td>#Dept_Name#</td>
</tr>
</cfoutput>
</table>
</cftimer>