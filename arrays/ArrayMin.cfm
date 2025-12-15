<cfif structKeyExists(session, "myArrayArrayMin") and isArray(session.myArrayArrayMin)>
    <cfset arrayClear(session.myArrayArrayMin)>
    <cfset session.myArrayArrayMin = session.myArray>
</cfif>
<h1>Array Min</h1>
<code>Returns the minimum value in an array. All elements must be comparable (numeric or string).</code>
<code>Syntax: <strong>arrayMin(array)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Find minimum value:
<form method="post" action="ArrayMinFunction.cfm">
    <button hx-post="ArrayMinFunction.cfm" hx-target=".arrayMinItemContainer">Find Min</button>
</form>
Minimum value:
<cfoutput>  
    <span class="arrayMinItemContainer">
        (Waiting to find minimum...)
    </span>
</cfoutput>
