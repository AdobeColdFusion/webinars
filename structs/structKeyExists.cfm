<h1>StructKeyExists()</h1>
<code>Checks whether a key exists in a structure. Returns true if the key exists, false otherwise.</code>
<code>Syntax: <strong>StructKeyExists(struct, key)</strong></code>
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
Check if a key exists:
<form method="post" action="structKeyExistsFunction.cfm">
    <input type="text" name="keyToCheck" id="keyToCheck" placeholder="Enter key to check">
    <button hx-post="structKeyExistsFunction.cfm" hx-target="#structKeyExistsItemContainer">Check Key</button>
</form>
Result:
<cfoutput>  
    <span id="structKeyExistsItemContainer">
        (Waiting to check key...)
    </span>
</cfoutput>


