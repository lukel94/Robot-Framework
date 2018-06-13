<!--- This shows how to write, read, update, and delete a file using CFFILE. 
This is a view-only example. ---> 
<!---  
<cfif IsDefined("form.formsubmit") is "Yes">  
    <!--- The form has been submitted, now do the action. --->  
    <cfif form.action is "new">  
        <!--- Make a new file. --->  
        <cffile action="Write"  
            file="#GetTempDirectory()#foobar.txt"  
            output="#form.the_text#">  
    </cfif>  
    <cfif form.action is "read">  
        <!--- Read existing file. --->  
        <cffile action="Read"  
            file="#GetTempDirectory()#foobar.txt"  
            variable="readText">  
    </cfif>  
 
    <cfif form.action is "add">  
        <!--- Update existing file. --->  
        <cffile action="Append"  
            file="#GetTempDirectory()#foobar.txt"  
            output="#form.the_text#">  
    </cfif>  
 
    <cfif form.action is "delete">  
        <!--- Delete existing fil. --->  
        <cffile action="Delete"  
            file="#GetTempDirectory()#foobar.txt">  
    </cfif>  
</cfif>  
<!--- Set some variables. --->  
<cfparam     name="fileExists"     default="no">  
<cfparam name="readText" default="">  
<!--- First, check whether canned file exists. --->  
<cfif FileExists("#GetTempDirectory()#foobar.txt") is "Yes">  
    <cfset fileExists="yes">  
</cfif>  
<!--- Now, make the form that runs the example. --->  
<form action="index.cfm" method="POST">  
<h4>Type in some text to include in your file:</h4> <p>  
<cfif fileExists is "yes">  
    <p>A file exists (foobar.txt, in <cfoutput>#GetTempDirectory()#</cfoutput>).  
    You may add to it, read from it, or delete it. </p> 
</cfif>  
<!--- If reading from a form, let that information display in textarea. --->  
<textarea name="the_text" cols="40" rows="5">  
    <cfif readText is not "">  
        <cfoutput>#readText#</cfoutput>  
    </cfif></textarea>  
<!--- Select from the actions depending on whether the file exists. --->  
<select name="action">  
<cfif fileExists is "no">  
    <option value="new">Make new file  
</cfif>  
<cfif fileExists is "yes">  
    <option value="add">Add to existing file  
    <option value="delete">Delete file  
    <option value="read">Read existing file  
</cfif>  
</select>  
<input type="Hidden" name="formsubmit" value="yes">  
<input type="Submit" name="" value="make my changes">  
</form> --->