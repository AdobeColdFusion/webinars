<cfif structKeyExists(session, "myArrayArrayAppend") and isArray(session.myArrayArrayAppend)>
    <cfset arrayClear(session.myArrayArrayAppend)>
    <cfset session.myArrayArrayAppend = session.myArray>
</cfif>
<h1>Array Append</h1>
<code>Appends an array element to an array.  Concatenates arrays when the merge argument is set to true and the value argument is an array.</code>
<code>Syntax: <strong>arrayAppend(array, value, merge)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Add new item to the array:
<form method="post" action="arrayAppendFunction.cfm">
    <input type="text" name="arrayItemarrayAppend" id="arrayItemarrayAppend">
    <button hx-post="arrayAppendFunction.cfm" hx-target=".arrayAppendItemContainer">Add</button>
</form>
New array contents:
<cfoutput>  
    <span class="arrayAppendItemContainer">
        (Waiting to add items...)
    </span>
</cfoutput>