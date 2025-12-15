<cfif structKeyExists(session, "myArrayArraySort") and isArray(session.myArrayArraySort)>
    <cfset arrayClear(session.myArrayArraySort)>
    <cfset session.myArrayArraySort = session.myArray>
</cfif>
<h1>Array Sort</h1>
<code>Sorts array elements. Can sort alphabetically, numerically, or using a custom sort function.</code>
<code>Syntax: <strong>arraySort(array, sortType [, sortOrder] [, callback]) -> Returns boolean</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Sort array:
<form method="post" action="ArraySortFunction.cfm">
    <select name="sortType" id="sortType">
        <option value="text">Text (alphabetical)</option>
        <option value="numeric">Numeric</option>
        <option value="textnocase">Text (case-insensitive)</option>
    </select>
    <select name="sortOrder" id="sortOrder">
        <option value="asc">Ascending</option>
        <option value="desc">Descending</option>
    </select>
    <button hx-post="ArraySortFunction.cfm" hx-target=".arraySortItemContainer">Sort</button>
</form>
Sorted array:
<cfoutput>  
    <span class="arraySortItemContainer">
        (Waiting to sort array...)
    </span>
</cfoutput>
