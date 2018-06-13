<!--- CFCONTENT Example 1  
This example shows the use of cfcontent to return the contents of the CF 
Documentation page dynamically to the browser. You might need to change the 
path and/or drive letter depending on how ColdFusion is installed on your 
system. Notice that the graphics do not display and the hyperlinks do not work, 
because the html page uses relative filename references. 
The root of the reference is the ColdFusion page, not the location of the 
html page. ---> 
 
<cfcontent type = "text/html"  
    file = "C:\ColdFusion9\wwwroot\cfdocs\dochome.htm"  
    deleteFile = "no"> 
 
<!--- CFCONTENT Example 2  
This example shows how the Reset attribute changes text output. Notice how the 
first text section ("This example shows how the Reset attribute changes output 
for text reset = "Yes":123) does NOT print out to the screen. ---> 
 
<p>This example shows how the Reset attribute changes output for text.</p> 
<p>reset = "Yes": 123 <BR> <cfcontent type = "text/html" reset = "Yes">456</p> 
<p>This example shows how the Reset attribute changes output for text.</p> 
<p>reset = "No": 123 <BR> <cfcontent type = "text/html" reset = "No">456</p> 
<!--- CFCONTENT Example 3  
This example triggers a download of an Excel file. The user is prompted with an option to save the file or open it in the browser. ---> 
 
<cfheader name="Content-Disposition" value="inline; filename=acmesales03.xls">  
    <cfcontent type="application/vnd.ms-excel" file="c:\temp\acmesales03.xls"> 
 
<!--- CFCONTENT Example 4 
This example triggers a download of a Word document then deletes the original from the "temp" directory. The user is prompted with an option to save the file or open it in the browser. ---> 
 
<cfheader name="Content-Disposition" value="inline; filename=temp.doc"> 
<cfcontent type="application/msword" file="c:\temp\Cable.doc" deletefile="yes">  
 
<!--- CFCONTENT Example 5  
This example causes the browser to treat the HTML table as Excel data.  
Excel interprets the table format. 
Because Excel can include executable code, the browser prompts the user whether 
to save the file or open it in a browser. ---> 
 
<cfheader name="Content-Disposition" value="inline; filename=acmesalesQ1.xls"> 
<cfcontent type="application/vnd.msexcel"> 
 
<table border="2"> 
<tr><td>Month</td><td>Quantity</td><td>$ Sales</td></tr> 
<tr><td>January</td><td>80</td><td >$245</td></tr> 
<tr><td>February</td><td>100</td><td>$699</td></tr> 
<tr><td>March</td><td>230</td><td >$2036</td></tr> 
<tr><td>Total</td><td>=Sum(B2..B4)</td><td>=Sum(C2..C4)</td></tr> 
</table>