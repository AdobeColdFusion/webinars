<h1>StructFindValue()</h1>
<code>Searches for a value in a structure and returns an array of structs containing match information. Useful for finding values that match a pattern.</code>
<code>Syntax: <strong>StructFindValue(struct, value, scope)</strong></code>
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
Find values matching a pattern:
<form method="post" action="structFindValueFunction.cfm">
    <input type="text" name="valuePattern" id="valuePattern" placeholder="Value pattern to search">
    <select name="scope" id="scope">
        <option value="one">One (first match only)</option>
        <option value="all">All (all matches)</option>
    </select>
    <button hx-post="structFindValueFunction.cfm" hx-target="#structFindValueItemContainer">Find Values</button>
</form>
Result:
<cfoutput>  
    <span id="structFindValueItemContainer">
        (Waiting to find values...)
    </span>
</cfoutput>


