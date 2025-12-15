<cfif structKeyExists(session, "myStruct") and isStruct(session.myStruct)>
    <cfset structClear(session.myStruct)>
    <cfoutput>Your struct has been cleared.</cfoutput>
<cfelse>
    <cfoutput>There was nothing in your struct to clear.</cfoutput>
</cfif>


