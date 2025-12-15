<h1>StructFindKey()</h1>
<code>Searches for a key in a structure and returns an array of structs containing match information. Useful for finding keys that match a pattern.</code>
<code>Syntax: <strong>StructFindKey(struct, key, scope)</strong></code>
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
Find keys matching a pattern:
<form method="post" action="structFindKeyFunction.cfm">
    <input type="text" name="keyPattern" id="keyPattern" placeholder="Key pattern to search">
    <select name="scope" id="scope">
        <option value="one">One (first match only)</option>
        <option value="all">All (all matches)</option>
    </select>
    <button hx-post="structFindKeyFunction.cfm" hx-target="#structFindKeyItemContainer">Find Keys</button>
</form>
Result:
<cfoutput>  
    <span id="structFindKeyItemContainer">
        (Waiting to find keys...)
    </span>
</cfoutput>


