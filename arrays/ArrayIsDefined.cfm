<cfif structKeyExists(session, "myArrayArrayIsDefined") and isArray(session.myArrayArrayIsDefined)>
    <cfset arrayClear(session.myArrayArrayIsDefined)>
    <cfset session.myArrayArrayIsDefined = session.myArray>
</cfif>
<h1>Array Is Defined</h1>
<code>Determines whether an array element exists at the specified index.</code>
<code>Syntax: <strong>arrayIsDefined(array, index)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Check if element exists at position:
<form method="post" action="ArrayIsDefinedFunction.cfm">
    <input type="number" name="checkIndex" id="checkIndex" min="1" placeholder="Index to check (1-based)">
    <button hx-post="ArrayIsDefinedFunction.cfm" hx-target=".arrayIsDefinedItemContainer">Check</button>
</form>
Result:
<cfoutput>  
    <span class="arrayIsDefinedItemContainer">
        (Waiting to check index...)
    </span>
</cfoutput>
