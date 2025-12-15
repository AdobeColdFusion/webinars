<cfif structKeyExists(session, "myArrayArrayLen") and isArray(session.myArrayArrayLen)>
    <cfset arrayClear(session.myArrayArrayLen)>
    <cfset session.myArrayArrayLen = session.myArray>
</cfif>
<h1>Array Length</h1>
<code>Returns the number of elements in an array.</code>
<code>Syntax: <strong>arrayLen(array)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Get array length:
<form method="post" action="ArrayLenFunction.cfm">
    <button hx-post="ArrayLenFunction.cfm" hx-target=".arrayLenItemContainer">Get Length</button>
</form>
Array length:
<cfoutput>  
    <span class="arrayLenItemContainer">
        (Waiting to get length...)
    </span>
</cfoutput>
