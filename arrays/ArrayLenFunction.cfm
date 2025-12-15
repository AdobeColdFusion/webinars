<cfif cgi.request_method eq "POST">
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayLen")>
        <cfset session.myArrayArrayLen = session.myArray>
    </cfif>
    <!--- Get the array length --->
    <cfset arrayLength = arrayLen(session.myArrayArrayLen)>
</cfif>

<!--- Display the result --->
<cfoutput>
<cfif structKeyExists(variables, "arrayLength")>
    <div class="arrayItemContainer" style="color: blue; font-weight: bold;">Array length: #arrayLength#</div>
</cfif>
</cfoutput>
