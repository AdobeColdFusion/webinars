<cfif structKeyExists(session, "myArrayArrayInsertAt") and isArray(session.myArrayArrayInsertAt)>
    <cfset arrayClear(session.myArrayArrayInsertAt)>
    <cfset session.myArrayArrayInsertAt = session.myArray>
</cfif>
<h1>Array Insert At</h1>
<code>Inserts an element at the specified position in an array. Shifts existing elements to make room for the new element.</code>
<code>Syntax: <strong>arrayInsertAt(array, position, value)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Insert new item at position:
<form method="post" action="ArrayInsertAtFunction.cfm">
    <input type="number" name="position" id="position" min="1" placeholder="Position (1-based)">
    <input type="text" name="arrayItemArrayInsertAt" id="arrayItemArrayInsertAt" placeholder="Item to insert">
    <button hx-post="ArrayInsertAtFunction.cfm" hx-target=".arrayInsertAtItemContainer">Insert</button>
</form>
New array contents:
<cfoutput>  
    <span class="arrayInsertAtItemContainer">
        (Waiting to insert items...)
    </span>
</cfoutput>
