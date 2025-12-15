<cfif structKeyExists(session, "myArrayArrayResize") and isArray(session.myArrayArrayResize)>
    <cfset arrayClear(session.myArrayArrayResize)>
    <cfset session.myArrayArrayResize = session.myArray>
</cfif>
<h1>Array Resize</h1>
<code>Resizes an array to the specified size. If the new size is larger, new elements are initialized to empty. If smaller, elements are truncated.</code>
<code>Syntax: <strong>arrayResize(array, size)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Resize array:
<form method="post" action="ArrayResizeFunction.cfm">
    <input type="number" name="newSize" id="newSize" min="0" placeholder="New array size">
    <button hx-post="ArrayResizeFunction.cfm" hx-target=".arrayResizeItemContainer">Resize</button>
</form>
Resized array:
<cfoutput>  
    <span class="arrayResizeItemContainer">
        (Waiting to resize array...)
    </span>
</cfoutput>
