<cfif structKeyExists(session, "myArrayArrayDelete") and isArray(session.myArrayArrayDelete)>
    <cfset arrayClear(session.myArrayArrayDelete)>
    <cfset session.myArrayArrayDelete = session.myArray>
    <cfset arrayClear(session.myArrayArrayDeleteNoCase)>
    <cfset session.myArrayArrayDeleteNoCase = session.myArray>
</cfif>
<h1>Array Delete/Array Delete No Case</h1>
<code>Searches an array for the first position of a specified object and deletes it. 
The function searches for simple objects such as strings and numbers or for complex objects such as structures. 
Simple object string searches are case-sensitive. Contains No Case is case-insensitive</code>
<code>Syntax: <strong>arrayDelete(array, value)</strong> | <strong>arrayDeleteNoCase(array, value)</strong></code>
<cfset myArray = session.myArray>
Original array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Value to delete from array:
<form method="post" action="arrayDeleteFunction.cfm">
    <input type="text" name="arrayItemarrayDelete" id="arrayItemarrayDelete">
    <button hx-post="arrayDeleteFunction.cfm" hx-target="#arrayDeleteItemContainer">Delete</button>
</form>
New array contents:
<cfoutput>  
    <span id="arrayDeleteItemContainer">
        (Waiting to delete items...)
    </span>
</cfoutput> 