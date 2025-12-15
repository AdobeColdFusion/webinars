<h1>StructSetMetadata()</h1>
<code>Sets metadata for a structure. Allows you to attach custom metadata information to a struct.</code>
<code>Syntax: <strong>StructSetMetadata(struct, metadata)</strong></code>
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
Set struct metadata:
<form method="post" action="structSetMetadataFunction.cfm">
    <select name="metadataType" id="metadataType">
        <option value="custom">Custom Metadata</option>
        <option value="author">Author Info</option>
        <option value="timestamp">Timestamp</option>
        <option value="version">Version Info</option>
    </select>
    <button hx-post="structSetMetadataFunction.cfm" hx-target="#structSetMetadataItemContainer">Set Metadata</button>
</form>
Result:
<cfoutput>  
    <span id="structSetMetadataItemContainer">
        (Waiting to set metadata...)
    </span>
</cfoutput>


