<h1>StructSort()</h1>
<code>Sorts a structure in-place by keys or values. The struct is modified directly.</code>
<code>Syntax: <strong>StructSort(struct, sortType [, sortOrder])</strong></code>
<cfif structKeyExists(session, "myStruct")>
    <cfset myStruct = session.myStruct>
<cfelse>
    <cfset myStruct = {}>
</cfif>
Current struct contents:
<cfoutput>  
    <cfif structKeyExists(session, "myStruct")>
        <cfloop collection="#myStruct#" item="key">
            <div class="structItemContainer">
                <span class="structKey">#encodeForHtml(key)#:</span> 
                <span class="structValue">#encodeForHtml(myStruct[key])#</span>
            </div>
        </cfloop>
    </cfif>
</cfoutput>
Sort the struct:
<form method="post" action="structSortFunction.cfm">
    <select name="sortType" id="sortType">
        <option value="text">Text (keys)</option>
        <option value="textnocase">Text No Case (keys)</option>
        <option value="numeric">Numeric (keys)</option>
        <option value="valueText">Value Text</option>
        <option value="valueTextNoCase">Value Text No Case</option>
        <option value="valueNumeric">Value Numeric</option>
    </select>
    <select name="sortOrder" id="sortOrder">
        <option value="asc">Ascending</option>
        <option value="desc">Descending</option>
    </select>
    <button hx-post="structSortFunction.cfm" hx-target="#structSortItemContainer">Sort</button>
</form>
Sorted struct:
<cfoutput>  
    <span id="structSortItemContainer">
        (Waiting to sort...)
    </span>
</cfoutput>


