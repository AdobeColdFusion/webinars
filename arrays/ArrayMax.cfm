<cfif structKeyExists(session, "myArrayArrayMax") and isArray(session.myArrayArrayMax)>
    <cfset arrayClear(session.myArrayArrayMax)>
    <cfset session.myArrayArrayMax = session.myArray>
</cfif>
<h1>Array Max</h1>
<code>Returns the maximum value in an array. All elements must be comparable (numeric or string).</code>
<code>Syntax: <strong>arrayMax(array)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Find maximum value:
<form method="post" action="ArrayMaxFunction.cfm">
    <button hx-post="ArrayMaxFunction.cfm" hx-target=".arrayMaxItemContainer">Find Max</button>
</form>
Maximum value:
<cfoutput>  
    <span class="arrayMaxItemContainer">
        (Waiting to find maximum...)
    </span>
</cfoutput>
