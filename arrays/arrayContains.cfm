<h1>Array Contains/Array Contains No Case</h1>
<code>Searches an array for the presence of a specified object. 
The function searches for simple objects such as strings and numbers or for complex objects such as structures. 
Simple object string searches are case-sensitive. Contains No Case is case-insensitive</code>
<code>Syntax: <strong>arrayContains(array, value)</strong> | <strong>arrayContainsNoCase(array, value)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Search for item in the array:
<form method="post" action="arrayContainsFunction.cfm">
    <input type="text" name="arrayItemarrayContains" id="arrayItemarrayContains">
    <button hx-post="arrayContainsFunction.cfm" hx-target="#arrayContainsItemContainer">Search</button>
</form>
Array contains item?:
<cfoutput>  
    <span id="arrayContainsItemContainer">
        (Waiting to search items...)
    </span>
</cfoutput> 