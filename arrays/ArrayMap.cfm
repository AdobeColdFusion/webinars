<cfif structKeyExists(session, "myArrayArrayMap") and isArray(session.myArrayArrayMap)>
    <cfset arrayClear(session.myArrayArrayMap)>
    <cfset session.myArrayArrayMap = session.myArray>
</cfif>
<h1>Array Map</h1>
<code>Creates a new array by applying a function to each element of an existing array.</code>
<code>Syntax: <strong>arrayMap(array, callback)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Apply transformation to array:
<form method="post" action="ArrayMapFunction.cfm">
    <select name="transformation" id="transformation">
        <option value="uppercase">Convert to UPPERCASE</option>
        <option value="lowercase">Convert to lowercase</option>
        <option value="length">Get string length</option>
        <option value="reverse">Reverse string</option>
        <option value="double">Double numeric values</option>
    </select>
    <button hx-post="ArrayMapFunction.cfm" hx-target=".arrayMapItemContainer">Transform</button>
</form>
Transformed array:
<cfoutput>  
    <span class="arrayMapItemContainer">
        (Waiting to transform array...)
    </span>
</cfoutput>
