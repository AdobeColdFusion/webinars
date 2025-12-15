<h1>StructGet()</h1>
<code>Retrieves a value from a structure using dot notation or bracket notation. Supports nested struct access.</code>
<code>Syntax: <strong>StructGet(path)</strong></code>
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
Get value using StructGet (dot notation path):
<form method="post" action="structGetFunction.cfm">
    <input type="text" name="path" id="path" placeholder="e.g., session.myStruct.keyName">
    <button hx-post="structGetFunction.cfm" hx-target="#structGetItemContainer">Get Value</button>
</form>
Result:
<cfoutput>  
    <span id="structGetItemContainer">
        (Waiting to get value...)
    </span>
</cfoutput>


