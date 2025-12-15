<cfif structKeyExists(session, "myArrayArraySet") and isArray(session.myArrayArraySet)>
    <cfset arrayClear(session.myArrayArraySet)>
    <cfset session.myArrayArraySet = session.myArray>
</cfif>
<h1>Array Set</h1>
<code>In a one-dimensional array, sets the elements in a specified
index range to a value. Useful for initializing an array after
a call to arrayNew.</code>
<code>Syntax: <strong>arraySet(array, start, end, value) → returns boolean</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Set array element:
<form method="post" action="ArraySetFunction.cfm">
    <input type="number" name="position_start" id="position_start" min="1" placeholder="Start Position (1-based)">
    <input type="number" name="position_end" id="position_end" min="1" placeholder="End Position (1-based)">
    <input type="text" name="value" id="value" placeholder="Value to set">
    <button hx-post="ArraySetFunction.cfm" hx-target=".arraySetItemContainer">Set</button>
</form>
Modified array:
<cfoutput>  
    <span class="arraySetItemContainer">
        (Waiting to set element...)
    </span>
</cfoutput>
