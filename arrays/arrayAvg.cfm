<cfif structKeyExists(session, "myArrayArrayAppend") and isArray(session.myArrayArrayAppend)>
    <cfset arrayClear(session.myArrayArrayAppend)>
    <cfset session.myArrayArrayAppend = session.myArray>
</cfif>
<h1>Array Average</h1>
<code>Calculates the average of the values in an array. Supports parallel processing. All members must have type numeric.</code>
<code>Syntax: <strong>arrayAvg(array [, parallel] [, maxThreadCount])</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Click to calculate average contents of array:
<form method="post" action="arrayAvgFunction.cfm">
    <button hx-post="arrayAvgFunction.cfm" hx-target=".arrayAvgItemContainer">Average</button>
</form>
Array average value:
<cfoutput>  
    <span class="arrayAvgItemContainer">
        (Waiting to average items...)
    </span>
</cfoutput>