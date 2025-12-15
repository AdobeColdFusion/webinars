<cfif structKeyExists(session, "myArray") and isArray(session.myArray)>
    <cfset arrayClear(session.myArray)>
    <cfoutput>Your array has been cleared.</cfoutput>
<cfelse>
    <cfoutput>There was nothing in your array to clear.</cfoutput>
</cfif>