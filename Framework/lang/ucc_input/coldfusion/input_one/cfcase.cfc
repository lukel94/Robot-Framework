<cfset score="7"> 
<cfswitch expression="#score#"> 
    <cfcase value="10"> 
        <cfset grade="A"> 
    </cfcase> 
    <cfcase value="9;8" delimiters=";"> 
        <cfset grade="B"> 
    </cfcase> 
    <cfcase value="7;6" delimiters=";"> 
        <cfset grade="C"> 
    </cfcase> 
    <cfcase value="5;4;" delimiters=";"> 
        <cfset grade="D"> 
    </cfcase> 
    <cfdefaultcase> 
        <cfset grade="F"> 
    </cfdefaultcase> 
</cfswitch> 
<cfoutput> 
    Your grade is #grade# 
</cfoutput>