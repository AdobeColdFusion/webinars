<cfif structKeyExists(session, "myArrayArrayIsEmpty") and isArray(session.myArrayArrayIsEmpty)>
    <cfset arrayClear(session.myArrayArrayIsEmpty)>
    <cfset session.myArrayArrayIsEmpty = session.myArray>
</cfif>
<h1>Array Is Empty</h1>
<code>Determines whether an array has no elements.</code>
<code>Syntax: <strong>arrayIsEmpty(array)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Check if array is empty:
<form method="post" action="ArrayIsEmptyFunction.cfm">
    <button hx-post="ArrayIsEmptyFunction.cfm" hx-target=".arrayIsEmptyItemContainer">Check</button>
</form>
Result:
<cfoutput>  
    <span class="arrayIsEmptyItemContainer">
        (Waiting to check array...)
    </span>
</cfoutput>
