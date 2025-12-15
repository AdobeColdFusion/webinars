<h1>StructFind()</h1>
<code>Finds a value in a structure by key. Returns the value if found, or throws an error if the key doesn't exist (unless defaultValue is provided).</code>
<code>Syntax: <strong>StructFind(struct, key [, defaultValue])</strong></code>
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
Find a value by key:
<form method="post" action="structFindFunction.cfm">
    <input type="text" name="findKey" id="findKey" placeholder="Key to find">
    <input type="text" name="defaultValue" id="defaultValue" placeholder="Default value (optional)">
    <button hx-post="structFindFunction.cfm" hx-target="#structFindItemContainer">Find</button>
</form>
Result:
<cfoutput>  
    <span id="structFindItemContainer">
        (Waiting to find...)
    </span>
</cfoutput>


