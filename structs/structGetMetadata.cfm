<h1>StructGetMetadata()</h1>
<code>Retrieves metadata associated with a structure. Returns a struct containing metadata information.</code>
<code>Syntax: <strong>StructGetMetadata(struct)</strong></code>
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
Get struct metadata:
<form method="post" action="structGetMetadataFunction.cfm">
    <select name="testStruct" id="testStruct">
        <option value="current">Current Session Struct</option>
        <option value="normal">Normal Struct</option>
        <option value="ordered">Ordered Struct</option>
        <option value="casesensitive">Case-Sensitive Struct</option>
    </select>
    <button hx-post="structGetMetadataFunction.cfm" hx-target="#structGetMetadataItemContainer">Get Metadata</button>
</form>
Result:
<cfoutput>  
    <span id="structGetMetadataItemContainer">
        (Waiting to get metadata...)
    </span>
</cfoutput>


