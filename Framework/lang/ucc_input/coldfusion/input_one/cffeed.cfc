<!--- Generate the feed when the user submits a filled in form. ---> 
<cfif isDefined("Form.Submit")> 
    <cfscript> 
 
        // Create the feed data structure and add the metadata. 
        myStruct = StructNew(); 
        mystruct.link = form.link; 
        myStruct.title = form.title; 
        mystruct.description = form.description; 
        mystruct.pubDate = Now(); 
        mystruct.version = "rss_2.0"; 
 
        /* Add the feed items. A more sophisticated application would use dynamic variables 
            and support varying numbers of items. */ 
        myStruct.item = ArrayNew(1); 
        myStruct.item[1] = StructNew(); 
        myStruct.item[1].description = StructNew(); 
        myStruct.item[1].description.value = form.item1text; 
        myStruct.item[1].link = form.item1link; 
        myStruct.item[1].pubDate = Now(); 
        myStruct.item[1].title = form.item1title; 
        myStruct.item[2] = StructNew(); 
        myStruct.item[2].description = StructNew(); 
        myStruct.item[2].description.value = form.item2text; 
        myStruct.item[2].link = form.item2link; 
        myStruct.item[2].pubDate = Now(); 
        myStruct.item[2].title = form.item2title; 
 
    </cfscript> 
 
    <!--- Generate the feed and save it to a file and variable. ---> 
    <cffeed action = "create" 
        name = "#myStruct#" 
        outputFile = "feedTest/createRSSOutput.xml"  
        overwrite = "yes" 
        xmlVar = "myXML"> 
 
</cfif> 
 
<!--- The user input form. ---> 
<cfform format="xml" preservedata="yes" style="width:500" height="700"> 
    <cfformitem type = "text"> Enter The Feed Metadata</cfformitem> 
    <cfinput type = "text" label = "title" name = "title"  
        style = "width:435" required = "yes"> <br /> 
    <cfinput type = "text" label = "link" name = "link"  
        style = "width:435" required = "yes" validate = "url"> <br /> 
    <cftextarea name = "description"  
        style = "width:435; height:70" required = "yes" /> 
 
    <cfformitem type = "text"> Enter Item 1</cfformitem> 
    <cfinput type="text" label="title" name="item1title"  
        style="width:435" required="yes"> <br /> 
    <cfinput type="text" label="link" name="item1link"  
        style="width:435" required="yes" validate="url"> <br /> 
    <cftextarea name = "item1text"  
        style = "width:435; height:70" required = "yes" /> <br /> 
 
    <cfformitem type = "text"> Enter Item 2</cfformitem> 
    <cfinput type = "text" label = "title" name = "item2title" style = "width:435"> <br /> 
    <cfinput type = "text" label = "link" name = "item2link" style = "width:435"  
        validate = "url"> <br /> 
    <cftextarea name = "item2text" style = "width:435; height:70" /> <br /> 
     
    <cfinput type = "Submit" name = "submit" value = "Submit" > 
</cfform> 