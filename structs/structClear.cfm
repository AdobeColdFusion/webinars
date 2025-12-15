<h1>StructClear()</h1>
<code>Removes all keys from a structure, leaving it empty but still a struct.</code>
<code>Syntax: <strong>StructClear(struct)</strong></code>
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
        <div style="margin-top: 10px;">Struct Count: <strong>#structCount(myStruct)#</strong></div>
    <cfelse>
        <div class="structItemContainer">Struct is empty or doesn't exist</div>
    </cfif>
</cfoutput>
Clear the struct:
<form method="post" action="structClearFunction.cfm">
    <button hx-post="structClearFunction.cfm" hx-target="#structClearItemContainer">Clear Struct</button>
</form>
Result:
<cfoutput>  
    <span id="structClearItemContainer">
        (Waiting to clear...)
    </span>
</cfoutput>


