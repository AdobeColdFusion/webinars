<cfif structKeyExists(session, "myArrayArraySlice") and isArray(session.myArrayArraySlice)>
    <cfset arrayClear(session.myArrayArraySlice)>
    <cfset session.myArrayArraySlice = session.myArray>
</cfif>
<h1>Array Slice</h1>
<code>Returns a portion of an array from the specified start position to the specified end position.</code>
<code>Syntax: <strong>arraySlice(array, start, end)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Extract slice from array:
<form method="post" action="ArraySliceFunction.cfm">
    <input type="number" name="start" id="start" min="1" placeholder="Start position (1-based)">
    <input type="number" name="end" id="end" min="1" placeholder="End position (1-based)">
    <button hx-post="ArraySliceFunction.cfm" hx-target=".arraySliceItemContainer">Extract Slice</button>
</form>
Array slice:
<cfoutput>  
    <span class="arraySliceItemContainer">
        (Waiting to extract slice...)
    </span>
</cfoutput>
