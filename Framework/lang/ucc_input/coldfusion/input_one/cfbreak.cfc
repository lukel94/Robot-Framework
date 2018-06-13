<!--- This shows the use of cfbreak to return processing to the top of a loop.---> 
<!--- Select courses; use cfloop to find a condition; then break the loop. ---> 
<!--- Check that number is numeric. ---> 
<cfif IsDefined("form.course_number")> 
    <cfif Not IsNumeric(form.course_number)> 
        <cfabort>  
    </cfif>  
</cfif>  
<cfquery name="GetCourses" datasource="cfdocexamples"> 
    SELECT *  
    FROM COURSES  
    ORDER by NUMBER  
</cfquery> 
 
<p> This example uses CFLOOP to cycle through a query to find a value. 
(In our example, a list of values corresponding to courses in the cfdocexamples 
datasource). When the conditions of the query are met, CFBREAK stops the loop. </p> 
<p> Please enter a Course Number, and hit the "submit" button: </p> 
<cfform>  
    <cfselect name="courseNum">  
        <cfoutput query="GetCourses">  
            <option value="#NUMBER#">#NUMBER# 
        </cfoutput>  
    </cfselect>  
    <cfinput type="Submit" name="" value="Search on my Number">  
</cfform>  
<!--- If the courseNum variable is not defined, don't loop through the query.---> 
<cfif IsDefined ("form.courseNum") IS "True"> 
<!--- Loop through query until value found, then use CFBREAK to exit query.---> 
    <cfloop query="GetCourses">  
        <cfif GetCourses.NUMBER IS form.courseNum>  
            <cfoutput>  
                <h4>Your Desired Course was found:</h4>  
                <pre>#NUMBER# #DESCRIPT#</pre> 
            </cfoutput>  
            <cfbreak>  
        <cfelse>  
            <br> Searching...  
        </cfif>  
    </cfloop>  
</cfif> 