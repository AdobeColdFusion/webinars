<h1>Array Find All</h1>
<code>Searches an array for all positions of a specified object. 
The function searches for simple objects such as strings and numbers or for complex objects such as structures. 
When the second parameter is a simple object, string searches are case-sensitive. ArrayFindAllNoCase is case-insensitive.</code>
<code>Syntax: <strong>arrayFindAll(array, value or callback [, parallel] [, maxThreadCount])</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Search for all item positions in the array:
<form method="post" action="arrayFindAllFunction.cfm">
    <input type="text" name="arrayItemarrayFindAll" id="arrayItemarrayFindAll">
    <button hx-post="arrayFindAllFunction.cfm" hx-target="#arrayFindAllItemContainer">Search</button>
</form>
Array item position index:
<cfoutput>  
    <span id="arrayFindAllItemContainer">
        (Waiting to search items...)
    </span>
</cfoutput> 