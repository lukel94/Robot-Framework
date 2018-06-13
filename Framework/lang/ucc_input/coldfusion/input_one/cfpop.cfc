<!--- This view-only example shows the use of cfpop. ---> 
<h3>cfpop Example</h3> 
<p>cfpop lets you retrieve and manipulate mail in a POP3 mailbox.  
    This view-only example shows how to create one feature of  
    a mail client, to display the mail headers in a POP3 mailbox. 
<p>To execute this, un-comment this code and run with a mail-enabled CF Server. 
<!---  
<cfif IsDefined("form.server")> 
    <!--- Make sure server, username are not empty. ---> 
    <cfif form.server is not "" and form.username is not ""> 
        <cfpop server = "#form.popserver# " username = #form.username# password = #form.pwd# 
        action = "getHeaderOnly" name = "GetHeaders "> 
        <h3>Message Headers in Your Inbox</h3> 
        <p>Number of Records:  
        <cfoutput>#GetHeaders.recordCount#</cfoutput></p> 
 
        <ul> 
            <cfoutput query = "GetHeaders"> 
            <li>Row: #currentRow#: From: #From# -- Subject: #Subject# 
            </cfoutput> 
        </ul> 
    </cfif> 
</cfif> 
 
<form action = "cfpop.cfm " method = "post"> 
    <p>Enter your mail server:</p> 
    <p><input type = "Text" name = "popserver"></p> 
    <p>Enter your username:</p> 
    <p><input type = "Text" name = "username"></p> 
    <p>Enter your password:</p> 
    <p><input type = "password" name = "pwd"></p> 
    <p><input type = "Submit" name = "get message headers"></p> 
</form>  
--->