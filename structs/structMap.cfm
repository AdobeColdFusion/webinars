<h1>StructMap()</h1>
<code>Creates a new structure by applying a transformation function to each key-value pair in the original struct.</code>
<code>Syntax: <strong>StructMap(struct, callback)</strong></code>
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
Transform struct with different operations:
<form method="post" action="structMapFunction.cfm">
    <select name="transformation" id="transformation">
        <option value="uppercase">Convert values to UPPERCASE</option>
        <option value="lowercase">Convert values to lowercase</option>
        <option value="double">Double numeric values</option>
        <option value="prefix">Add prefix to keys</option>
        <option value="suffix">Add suffix to values</option>
        <option value="length">Replace values with their length</option>
    </select>
    <input type="text" name="customText" id="customText" placeholder="Custom text" style="display:none;">
    <button hx-post="structMapFunction.cfm" hx-target="#structMapItemContainer">Transform</button>
</form>
Transformed struct:
<cfoutput>  
    <span id="structMapItemContainer">
        (Waiting to transform...)
    </span>
</cfoutput>
<script>
document.getElementById("transformation").addEventListener("change", function() {
    var showCustom = this.value === "prefix" || this.value === "suffix";
    document.getElementById("customText").style.display = showCustom ? "inline" : "none";
});
</script>


