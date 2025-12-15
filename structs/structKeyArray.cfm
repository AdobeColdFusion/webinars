<h1>StructKeyArray()</h1>
<code>Returns an array containing all the keys in a structure.</code>
<code>Syntax: <strong>StructKeyArray(struct)</strong></code>
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
Get struct keys as array:
<form method="post" action="structKeyArrayFunction.cfm">
    <button hx-post="structKeyArrayFunction.cfm" hx-target="#structKeyArrayItemContainer">Get Key Array</button>
</form>
Result:
<cfoutput>  
    <span id="structKeyArrayItemContainer">
        (Waiting to get keys...)
    </span>
</cfoutput>


