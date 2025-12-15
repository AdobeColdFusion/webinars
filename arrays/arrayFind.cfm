<h1>Array Find/Array Find No Case</h1>
<code>Searches an array for the first position of a specified object. 
The function searches for simple objects such as strings and numbers or for complex objects such as structures. When the second parameter is a simple object, string searches are case-sensitive. 
Find No Case is case-insensitive.</code>
<code>Syntax: <strong>arrayFind(array, value)</strong> | <strong>arrayFindNoCase(array, value)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Search for item position in the array:
<form method="post" action="arrayFindFunction.cfm">
    <input type="text" name="arrayItemarrayFind" id="arrayItemarrayFind">
    <button hx-post="arrayFindFunction.cfm" hx-target="#arrayFindItemContainer">Search</button>
</form>
Array contains item?:
<cfoutput>  
    <span id="arrayFindItemContainer">
        (Waiting to search items...)
    </span>
</cfoutput> 