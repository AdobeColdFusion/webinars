<h1>StructToSorted()</h1>
<code>Creates a new sorted structure from an existing struct without modifying the original. Returns a new struct sorted by keys or values.</code>
<code>Syntax: <strong>StructToSorted(struct, sortType [, sortOrder])</strong></code>
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
Create a sorted copy:
<form method="post" action="structToSortedFunction.cfm">
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
    <button hx-post="structToSortedFunction.cfm" hx-target="#structToSortedItemContainer">Create Sorted Copy</button>
</form>
Sorted copy:
<cfoutput>  
    <span id="structToSortedItemContainer">
        (Waiting to create sorted copy...)
    </span>
</cfoutput>


