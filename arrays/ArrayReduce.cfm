<cfif structKeyExists(session, "myArrayArrayReduce") and isArray(session.myArrayArrayReduce)>
    <cfset arrayClear(session.myArrayArrayReduce)>
    <cfset session.myArrayArrayReduce = session.myArray>
</cfif>
<h1>Array Reduce</h1>
<code>Reduces an array to a single value by applying a function to each element and accumulating the result.</code>
<code>Syntax: <strong>arrayReduce(array, callback [, initialValue])</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Apply reduction operation:
<form method="post" action="ArrayReduceFunction.cfm">
    <select name="operation" id="operation">
        <option value="sum">Sum all numbers</option>
        <option value="concat">Concatenate all strings</option>
        <option value="max">Find maximum number</option>
        <option value="min">Find minimum number</option>
        <option value="count">Count elements</option>
    </select>
    <input type="text" name="initialValue" id="initialValue" placeholder="Initial value (optional)">
    <button hx-post="ArrayReduceFunction.cfm" hx-target=".arrayReduceItemContainer">Reduce</button>
</form>
Reduced result:
<cfoutput>  
    <span class="arrayReduceItemContainer">
        (Waiting to reduce array...)
    </span>
</cfoutput>
