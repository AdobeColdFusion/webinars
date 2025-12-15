<h1>StructCopy()</h1>
<code>Creates a shallow copy of a structure. Nested structs are copied by reference, not duplicated.</code>
<code>Syntax: <strong>StructCopy(struct)</strong></code>
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
Copy the struct:
<form method="post" action="structCopyFunction.cfm">
    <button hx-post="structCopyFunction.cfm" hx-target="#structCopyItemContainer">Copy Struct</button>
</form>
Copied struct:
<cfoutput>  
    <span id="structCopyItemContainer">
        (Waiting to copy...)
    </span>
</cfoutput>


