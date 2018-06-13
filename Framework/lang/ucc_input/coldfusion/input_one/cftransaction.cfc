<!--- This example performs batch processing of withdrawals ---> 
<!--- from a bank account. The withdrawal amounts are stored ---> 
<!--- in an array. ---> 
<!--- There is a CFC named bank.cfc whose contains appear ---> 
<!--- after the example. ---> 
 
<cftransaction> 
    <!--- Get the account balance. ---> 
    <cfinvoke component="bank" method="getBalance"  
        returnvariable="getacctbalance" accountnum=1> 
 
<cfloop index="withdrawnum" from="1" to="#ArrayLen(withdrawals)#"> 
    <!--- Set a savepoint before making the withdrawal. ---> 
    <cfset noxfer = "point" & #withdrawnum#> 
    <cftransaction action = "setsavepoint" savepoint = "#noxfer#"/> 
 
    <!--- Make the withdrawal. ---> 
    <cfinvoke component="bank" method="makewithdrawal"  
        returnvariable="getacctbalance" accountnum=1  
        withdrawamount="#withdrawals[withdrawnum]#">     
 
    <!--- Get the account balance. ---> 
    <cfinvoke component="bank" method="getBalance"  
        returnvariable="getacctbalance" accountnum=1> 
     
    <!--- If the balance is negative, roll back the transaction. ---> 
    <cfif getacctbalance.balance lt 0> 
        <cftransaction action="rollback" savepoint="#noxfer#" /> 
    </cfif> 
    </cfloop> 
</cftransaction> 
 
<!--- The bank.cfc contains the following: 
 
cfcomponent> 
    <cffunction name="getBalance" access="public" returntype="query"> 
        <cfargument name="accountnum" type="numeric" required="yes"> 
            <cfquery name="getacctbalance" datasource="testsqlserver"> 
                SELECT * FROM dbo.mybank  
                WHERE accountid = #accountnum# 
            </cfquery> 
        <cfreturn getacctbalance> 
    </cffunction> 
     
    <cffunction name="makewithdrawal" access="public" returntype="query"> 
        <cfargument name="accountnum" type="numeric" required="yes"> 
        <cfargument name="withdrawamount" type="numeric" required="yes">         
            <cfquery name="withdrawfromacct" datasource="testsqlserver"> 
                UPDATE dbo.mybank SET balance = balance - #withdrawamount# 
                WHERE accountid = 1 
            </cfquery> 
            <cfinvoke method="getBalance" returnvariable="getacctbalance"  
        accountnum=1> 
        <cfreturn getacctbalance>     
    </cffunction> 
</cfcomponent> 
--->