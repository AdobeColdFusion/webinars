<cfif structKeyExists(session, "myArrayArraySetMetaData") and isArray(session.myArrayArraySetMetaData)>
    <cfset arrayClear(session.myArrayArraySetMetaData)>
    <cfset session.myArrayArraySetMetaData = session.myArray>
</cfif>
<h1>Array Set Meta Data</h1>
<code>Sets metadata for items of an array. Useful when using serializeJSON with ambiguous data.</code>
<code>Syntax: <strong>arraySetMetadata(array, metadata) → returns void</strong></code>
<cfset myArray = session.myArray>
Sample code:<br />
<code> 
inputs = ["2016.02", 42.0, "Yes", "No", "32830", {"t1": "Yes"}, ["1","yes","3",false,"null","null"]];
<br />
metadata = {items: ["numeric", "integer", "string", "boolean", "string", {t1: {type:"string",ignore:true}}, {items: ["integer","boolean","string","string","string","null"]}]};
arraySetMetadata(inputs,metadata);<br />
writeOutput(serializeJSON(inputs));
</code>
Result:
<i>[2016.02,42.0,"Yes",false,"32830",{},[1,true,"3","false","null","null"]]</i>