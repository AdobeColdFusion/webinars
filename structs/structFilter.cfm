<h1>StructFilter()</h1>
<code>Creates a new structure containing only the key-value pairs that pass a filter callback function.</code>
<code>Syntax: <strong>StructFilter(struct, callback)</strong></code>
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
Filter struct based on criteria:
<form method="post" action="structFilterFunction.cfm">
    <select name="filterType" id="filterType">
        <option value="numeric">Numeric values only</option>
        <option value="string">String values only</option>
        <option value="length">Values with length > 5</option>
        <option value="keyContains">Keys containing "a"</option>
        <option value="valueContains">Values containing "e"</option>
        <option value="custom">Custom filter (enter value below)</option>
    </select>
    <input type="text" name="customValue" id="customValue" placeholder="Custom filter value" style="display:none;">
    <button hx-post="structFilterFunction.cfm" hx-target="#structFilterItemContainer">Filter</button>
</form>
Filtered struct:
<cfoutput>  
    <span id="structFilterItemContainer">
        (Waiting to filter...)
    </span>
</cfoutput>
<script>
document.getElementById("filterType").addEventListener("change", function() {
    document.getElementById("customValue").style.display = this.value === "custom" ? "inline" : "none";
});
</script>


