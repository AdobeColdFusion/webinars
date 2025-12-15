<h1>StructCount()</h1>
<code>Returns the number of keys in a structure.</code>
<code>Syntax: <strong>StructCount(struct)</strong></code>
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
Count struct keys:
<form method="post" action="structCountFunction.cfm">
    <button hx-post="structCountFunction.cfm" hx-target="#structCountItemContainer">Count Keys</button>
</form>
Result:
<cfoutput>  
    <span id="structCountItemContainer">
        (Waiting to count...)
    </span>
</cfoutput>


