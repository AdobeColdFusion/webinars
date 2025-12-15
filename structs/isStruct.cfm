<h1>isStruct()</h1>
<code>Determines whether a value is a structure (struct). Returns true if the value is a struct, false otherwise.</code>
<code>Syntax: <strong>isStruct(value)</strong></code>
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
Test if various values are structs:
<form method="post" action="isStructFunction.cfm">
    <select name="testValue" id="testValue">
        <option value="current">Current Session Struct</option>
        <option value="empty">Empty Struct {}</option>
        <option value="nested">Nested Struct</option>
        <option value="array">Array Value</option>
        <option value="string">String Value</option>
        <option value="number">Number Value</option>
    </select>
    <button hx-post="isStructFunction.cfm" hx-target="#isStructItemContainer">Test</button>
</form>
Result:
<cfoutput>  
    <span id="isStructItemContainer">
        (Waiting to test...)
    </span>
</cfoutput>


