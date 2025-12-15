<h1>StructKeyList()</h1>
<code>Returns a comma-delimited list of all keys in a structure. You can optionally specify a delimiter.</code>
<code>Syntax: <strong>StructKeyList(struct [, delimiter])</strong></code>
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
Get struct keys as list:
<form method="post" action="structKeyListFunction.cfm">
    <select name="delimiter" id="delimiter">
        <option value=",">Comma (default)</option>
        <option value="|">Pipe</option>
        <option value=";">Semicolon</option>
        <option value=":">Colon</option>
        <option value=" ">Space</option>
        <option value="-">Dash</option>
    </select>
    <button hx-post="structKeyListFunction.cfm" hx-target="#structKeyListItemContainer">Get Key List</button>
</form>
Result:
<cfoutput>  
    <span id="structKeyListItemContainer">
        (Waiting to get keys...)
    </span>
</cfoutput>


