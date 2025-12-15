<h1>StructEach()</h1>
<code>Iterates over each key-value pair in a structure, executing a callback function for each pair.</code>
<code>Syntax: <strong>StructEach(struct, callback [, parallel])</strong></code>
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
Iterate over struct with different operations:
<form method="post" action="structEachFunction.cfm">
    <select name="operation" id="operation">
        <option value="display">Display all key-value pairs</option>
        <option value="uppercase">Convert values to uppercase</option>
        <option value="length">Get length of string values</option>
        <option value="numeric">Filter numeric values</option>
        <option value="sum">Sum numeric values</option>
        <option value="count">Count all pairs</option>
    </select>
    <button hx-post="structEachFunction.cfm" hx-target="#structEachItemContainer">Iterate</button>
</form>
Result:
<cfoutput>  
    <span id="structEachItemContainer">
        (Waiting to iterate...)
    </span>
</cfoutput>


