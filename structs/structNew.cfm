<h1>StructNew()</h1>
<code>Creates a new structure (struct). You can optionally specify the struct type: 'normal', 'ordered', 'casesensitive', or 'ordered-casesensitive'.</code>
<code>Syntax: <strong>StructNew([type])</strong></code>
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
Create a new struct with different types:
<form method="post" action="structNewFunction.cfm">
    <select name="structType" id="structType">
        <option value="normal">Normal Struct (default)</option>
        <option value="ordered">Ordered Struct</option>
        <option value="casesensitive">Case-Sensitive Struct</option>
        <option value="ordered-casesensitive">Ordered Case-Sensitive Struct</option>
    </select>
    <button hx-post="structNewFunction.cfm" hx-target="#structNewItemContainer">Create</button>
</form>
New struct created:
<cfoutput>  
    <span id="structNewItemContainer">
        (Waiting to create struct...)
    </span>
</cfoutput>


