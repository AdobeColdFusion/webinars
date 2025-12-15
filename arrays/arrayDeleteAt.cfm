<cfif structKeyExists(session, "myArrayArrayDeleteAt") and isArray(session.myArrayArrayDeleteAt)>
    <cfset arrayClear(session.myArrayArrayDeleteAt)>
    <cfset session.myArrayArrayDeleteAt = session.myArray>
</cfif>
<h1>Array Delete At</h1>
<code>Deletes an element from a specified position in an array. 
When an element is deleted, ColdFusion recalculates index positions. 
For example, in an array that contains the months of the year, deleting the element at position 5 removes the entry for May. 
After this, to delete the entry for June, you would delete the element at position 5 (not 6).</code>
<code>Syntax: <strong>arrayDeleteAt(array, index)</strong></code>
<cfset myArray = session.myArray>
Original array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Position to delete from array (numeric):
<form method="post" action="arrayDeleteAtFunction.cfm">
    <input type="text" name="arrayItemarrayDeleteAt" id="arrayItemarrayDeleteAt">
    <button hx-post="arrayDeleteAtFunction.cfm" hx-target="#arrayDeleteAtItemContainer">Delete</button>
</form>
New array contents:
<cfoutput>  
    <span id="arrayDeleteAtItemContainer">
        (Waiting to delete items...)
    </span>
</cfoutput> 