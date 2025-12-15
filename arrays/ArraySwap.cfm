<cfif structKeyExists(session, "myArrayArraySwap") and isArray(session.myArrayArraySwap)>
    <cfset arrayClear(session.myArrayArraySwap)>
    <cfset session.myArrayArraySwap = session.myArray>
</cfif>
<h1>Array Swap</h1>
<code>Swaps two elements in an array at the specified positions.</code>
<code>Syntax: <strong>arraySwap(array, position1, position2)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Swap array elements:
<form method="post" action="ArraySwapFunction.cfm">
    <input type="number" name="position1" id="position1" min="1" placeholder="First position (1-based)">
    <input type="number" name="position2" id="position2" min="1" placeholder="Second position (1-based)">
    <button hx-post="ArraySwapFunction.cfm" hx-target=".arraySwapItemContainer">Swap</button>
</form>
Array after swap:
<cfoutput>  
    <span class="arraySwapItemContainer">
        (Waiting to swap elements...)
    </span>
</cfoutput>
