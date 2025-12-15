<cfif structKeyExists(session, "myArrayArrayPop") and isArray(session.myArrayArrayPop)>
    <cfset arrayClear(session.myArrayArrayPop)>
    <cfset session.myArrayArrayPop = session.myArray>
</cfif>
<h1>Array Pop</h1>
<code>Removes and returns the last element from an array.</code>
<code>Syntax: <strong>arrayPop(array)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Pop the last element from array:
<form method="post" action="ArrayPopFunction.cfm">
    <button hx-post="ArrayPopFunction.cfm" hx-target=".arrayPopItemContainer">Pop</button>
</form>
Popped element and remaining array:
<cfoutput>  
    <span class="arrayPopItemContainer">
        (Waiting to pop element...)
    </span>
</cfoutput>

