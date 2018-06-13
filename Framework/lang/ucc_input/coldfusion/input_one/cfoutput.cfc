<!--- This example lets you update a person's telephone number in the employee table. ---> 
<cfif isDefined("form.phone")> 
    <cfupdate datasource="cfdocexamples" tablename="EMPLOYEES"> 
</cfif> 
 
<cfquery name="empTable" datasource="cfdocexamples"> 
    SELECT * FROM EMPLOYEES 
</cfquery> 
 
<!--- This code shows the contents of the employee table and allows you to choose a row for updating. ---> 
<table border="1"> 
<cfoutput query="empTable"> 
    <tr> 
        <td>#firstName#</td> 
        <td>#lastName#</td> 
        <td>#phone#</td> 
        <td><a href="cfupdate.cfm?id=#emp_id#">Edit</a></td> 
    </tr> 
</cfoutput> 
</table> 
 
<cfif isDefined("url.id")> 
    <cfquery name="phoneQuery" datasource="cfdocexamples"> 
        SELECT * FROM employees WHERE emp_id=#url.id# 
    </cfquery> 
<!--- This code displays the row to edit for update. ---> 
    <cfoutput query="phoneQuery"> 
        <form action="cfupdate.cfm" method="post"> 
        #phoneQuery.firstName# #phoneQuery.lastName#  
        <input name="phone" type="text" value="#phone#" size="12">  
        <input type="submit" value="Update"> 
        <input name="emp_id" type="hidden" value="#emp_id#"> 
        <!--- The emp_id is passed as a hidden field to be used as a primary  
            key in the CFUPDATE. ---> 
        </form> 
    </cfoutput> 
</cfif>