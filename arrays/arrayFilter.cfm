<h1>Array Filter</h1>
<code>Uses a callback to filter the elements of an array.</code>
<code>Syntax: <strong>arrayFilter(array, callback)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Search for items in the array with length greater than the number specified:
<form method="post" action="arrayFilterFunction.cfm">
    <input type="number" name="arrayItemarrayFilter" id="arrayItemarrayFilter" value="1">
    <button hx-post="arrayFilterFunction.cfm" hx-target="#arrayFilterItemContainer">Search</button>
</form>
Returned items:
<cfoutput>  
    <span id="arrayFilterItemContainer">
        (Waiting to search items...)
    </span>
</cfoutput> 