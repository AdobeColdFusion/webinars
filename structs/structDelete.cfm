<h1>StructDelete()</h1>
<code>Deletes a key from a structure. Returns true if the key was deleted, false if the key didn't exist.</code>
<code>Syntax: <strong>StructDelete(struct, key)</strong></code>
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
Delete a key from the struct:
<form method="post" action="structDeleteFunction.cfm">
    <input type="text" name="keyToDelete" id="keyToDelete" placeholder="Enter key to delete">
    <button hx-post="structDeleteFunction.cfm" hx-target="#structDeleteItemContainer">Delete Key</button>
</form>
Result:
<cfoutput>  
    <span id="structDeleteItemContainer">
        (Waiting to delete...)
    </span>
</cfoutput>


