<h1>StructReduce()</h1>
<code>Reduces a structure to a single value by applying a function to each key-value pair and accumulating the result.</code>
<code>Syntax: <strong>StructReduce(struct, callback [, initialValue])</strong></code>
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
Apply reduction operation:
<form method="post" action="structReduceFunction.cfm">
    <select name="operation" id="operation">
        <option value="sum">Sum all numeric values</option>
        <option value="concat">Concatenate all string values</option>
        <option value="max">Find maximum numeric value</option>
        <option value="min">Find minimum numeric value</option>
        <option value="count">Count all pairs</option>
        <option value="keyList">Create comma-separated key list</option>
    </select>
    <input type="text" name="initialValue" id="initialValue" placeholder="Initial value (optional)">
    <button hx-post="structReduceFunction.cfm" hx-target="#structReduceItemContainer">Reduce</button>
</form>
Reduced result:
<cfoutput>  
    <span id="structReduceItemContainer">
        (Waiting to reduce...)
    </span>
</cfoutput>


