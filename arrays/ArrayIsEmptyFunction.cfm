<cfif cgi.request_method eq "POST">
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayIsEmpty")>
        <cfset session.myArrayArrayIsEmpty = session.myArray>
    </cfif>
    <!--- Check if the array is empty --->
    <cfset isEmpty = arrayIsEmpty(session.myArrayArrayIsEmpty)>
</cfif>

<!--- Display the result --->
<cfoutput>
<cfif structKeyExists(variables, "isEmpty")>
    <cfif isEmpty>
        <div class="arrayItemContainer" style="color: orange;">Array is EMPTY</div>
    <cfelse>
        <div class="arrayItemContainer" style="color: green;">Array is NOT EMPTY (has #arrayLen(session.myArrayArrayIsEmpty)# elements)</div>
    </cfif>
</cfif>
</cfoutput>
