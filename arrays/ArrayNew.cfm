<cfif structKeyExists(session, "myArrayArrayNew") and isArray(session.myArrayArrayNew)>
    <cfset arrayClear(session.myArrayArrayNew)>
    <cfset session.myArrayArrayNew = session.myArray>
</cfif>
<h1>Array New</h1>
<code>Creates a new array. Optionally specifies the dimension (1-3) and initial value.</code>
<code>Syntax: <strong>arrayNew(dimension [, isSynchronized])</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Create new array:
<form method="post" action="ArrayNewFunction.cfm">
    <select name="dimension" id="dimension">
        <option value="1">1-dimensional array</option>
        <option value="2">2-dimensional array</option>
        <option value="3">3-dimensional array</option>
    </select>
    <button hx-post="ArrayNewFunction.cfm" hx-target=".arrayNewItemContainer">Create Array</button>
</form>
New array:
<cfoutput>  
    <span class="arrayNewItemContainer">
        (Waiting to create array...)
    </span>
</cfoutput>
