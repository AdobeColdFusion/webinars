<h1>StructAppend()</h1>
<code>Appends one structure to another, adding all keys from the source struct to the destination struct. If keys already exist, they are overwritten.</code>
<code>Syntax: <strong>StructAppend(destination, source [, overwrite])</strong></code>
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
Append another struct to current struct:
<form method="post" action="structAppendFunction.cfm">
    <select name="appendType" id="appendType">
        <option value="sample">Sample Struct (name, age, city)</option>
        <option value="nested">Nested Struct (address with street, city)</option>
        <option value="numbers">Numbers Struct (x, y, z)</option>
        <option value="custom">Custom (enter keys below)</option>
    </select>
    <input type="text" name="key1" placeholder="Key 1" style="display:none;" id="key1">
    <input type="text" name="value1" placeholder="Value 1" style="display:none;" id="value1">
    <input type="text" name="key2" placeholder="Key 2" style="display:none;" id="key2">
    <input type="text" name="value2" placeholder="Value 2" style="display:none;" id="value2">
    <select name="overwrite" id="overwrite">
        <option value="true">Overwrite existing keys (default)</option>
        <option value="false">Don't overwrite existing keys</option>
    </select>
    <button hx-post="structAppendFunction.cfm" hx-target="#structAppendItemContainer">Append Struct</button>
</form>
Result:
<cfoutput>  
    <span id="structAppendItemContainer">
        (Waiting to append...)
    </span>
</cfoutput>
<script>
document.getElementById("appendType").addEventListener("change", function() {
    var showCustom = this.value === "custom";
    document.getElementById("key1").style.display = showCustom ? "inline" : "none";
    document.getElementById("value1").style.display = showCustom ? "inline" : "none";
    document.getElementById("key2").style.display = showCustom ? "inline" : "none";
    document.getElementById("value2").style.display = showCustom ? "inline" : "none";
});
</script>


