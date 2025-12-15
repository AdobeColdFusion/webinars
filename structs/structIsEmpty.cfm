<h1>StructIsEmpty()</h1>
<code>Determines whether a structure is empty (has no keys). Returns true if empty, false otherwise.</code>
<code>Syntax: <strong>StructIsEmpty(struct)</strong></code>
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
Test if struct is empty:
<form method="post" action="structIsEmptyFunction.cfm">
    <button hx-post="structIsEmptyFunction.cfm" hx-target="#structIsEmptyItemContainer">Check if Empty</button>
</form>
Result:
<cfoutput>  
    <span id="structIsEmptyItemContainer">
        (Waiting to check...)
    </span>
</cfoutput>


