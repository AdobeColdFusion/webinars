<h1>StructInsert()</h1>
<code>Inserts a key-value pair into a structure. Returns true if successful, false if the key already exists (unless allowOverwrite is true).</code>
<code>Syntax: <strong>StructInsert(struct, key, value [, allowOverwrite])</strong></code>
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
Insert a new key-value pair:
<form method="post" action="structInsertFunction.cfm">
    <input type="text" name="insertKey" id="insertKey" placeholder="Key">
    <input type="text" name="insertValue" id="insertValue" placeholder="Value">
    <select name="allowOverwrite" id="allowOverwrite">
        <option value="false">Don't overwrite if key exists (default)</option>
        <option value="true">Allow overwrite if key exists</option>
    </select>
    <button hx-post="structInsertFunction.cfm" hx-target="#structInsertItemContainer">Insert</button>
</form>
Result:
<cfoutput>  
    <span id="structInsertItemContainer">
        (Waiting to insert...)
    </span>
</cfoutput>


