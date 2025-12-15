<cfif structKeyExists(session, "myArrayArrayPrepend") and isArray(session.myArrayArrayPrepend)>
    <cfset arrayClear(session.myArrayArrayPrepend)>
    <cfset session.myArrayArrayPrepend = session.myArray>
</cfif>
<h1>Array Prepend</h1>
<code>Inserts an element at the beginning of an array. Shifts existing elements to make room for the new element.</code>
<code>Syntax: <strong>arrayPrepend(array, value)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Prepend new item to the array:
<form method="post" action="ArrayPrependFunction.cfm">
    <input type="text" name="arrayItemArrayPrepend" id="arrayItemArrayPrepend" placeholder="Item to prepend">
    <button hx-post="ArrayPrependFunction.cfm" hx-target=".arrayPrependItemContainer">Prepend</button>
</form>
New array contents:
<cfoutput>  
    <span class="arrayPrependItemContainer">
        (Waiting to prepend items...)
    </span>
</cfoutput>
