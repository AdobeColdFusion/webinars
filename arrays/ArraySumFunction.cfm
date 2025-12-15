<cfif cgi.request_method eq "POST">
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArraySum")>
        <cfset session.myArrayArraySum = session.myArray>
    </cfif>
    <!--- Calculate the sum of the array --->
    <cfset arraySumValue = arraySum(session.myArrayArraySum)>
</cfif>

<!--- Display the result --->
<cfoutput>
<cfif structKeyExists(variables, "arraySumValue")>
    <div class="arrayItemContainer" style="color: green; font-weight: bold;">Array sum: #arraySumValue#</div>
</cfif>
</cfoutput>
