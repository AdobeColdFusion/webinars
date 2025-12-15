<h1>StructUpdate()</h1>
<code>Updates a key-value pair in a structure. Returns true if the key was updated, false if the key didn't exist.</code>
<code>Syntax: <strong>StructUpdate(struct, key, value)</strong></code>
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
Update a key-value pair:
<form method="post" action="structUpdateFunction.cfm">
    <input type="text" name="updateKey" id="updateKey" placeholder="Key to update">
    <input type="text" name="updateValue" id="updateValue" placeholder="New value">
    <button hx-post="structUpdateFunction.cfm" hx-target="#structUpdateItemContainer">Update</button>
</form>
Result:
<cfoutput>  
    <span id="structUpdateItemContainer">
        (Waiting to update...)
    </span>
</cfoutput>


