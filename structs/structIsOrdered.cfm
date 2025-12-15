<h1>StructIsOrdered()</h1>
<code>Determines whether a structure is ordered (maintains insertion order). Returns true if the struct is ordered, false otherwise.</code>
<code>Syntax: <strong>StructIsOrdered(struct)</strong></code>
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
Test struct ordering:
<form method="post" action="structIsOrderedFunction.cfm">
    <select name="testStruct" id="testStruct">
        <option value="current">Current Session Struct</option>
        <option value="normal">Normal Struct (default)</option>
        <option value="ordered">Ordered Struct</option>
    </select>
    <button hx-post="structIsOrderedFunction.cfm" hx-target="#structIsOrderedItemContainer">Test</button>
</form>
Result:
<cfoutput>  
    <span id="structIsOrderedItemContainer">
        (Waiting to test...)
    </span>
</cfoutput>


