<h1>StructIsCaseSensitive()</h1>
<code>Determines whether a structure is case-sensitive. Returns true if the struct is case-sensitive, false otherwise.</code>
<code>Syntax: <strong>StructIsCaseSensitive(struct)</strong></code>
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
Test struct case sensitivity:
<form method="post" action="structIsCaseSensitiveFunction.cfm">
    <select name="testStruct" id="testStruct">
        <option value="current">Current Session Struct</option>
        <option value="normal">Normal Struct (default)</option>
        <option value="casesensitive">Case-Sensitive Struct</option>
    </select>
    <button hx-post="structIsCaseSensitiveFunction.cfm" hx-target="#structIsCaseSensitiveItemContainer">Test</button>
</form>
Result:
<cfoutput>  
    <span id="structIsCaseSensitiveItemContainer">
        (Waiting to test...)
    </span>
</cfoutput>


