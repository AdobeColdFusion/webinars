<h1>Array Clear</h1>
<code>Clears all elements from an array.</code>
<code>Syntax: <strong>arrayClear(array)</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<span id="inputSpanArrayClear">
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
</span>
<br />
Click to clear contents of array:
<form method="post" action="arrayClearFunction.cfm">
    <button hx-post="arrayClearFunction.cfm" hx-target=".arrayClearItemContainer">Clear</button>
</form>
Array clear status:
<cfoutput>  
    <span class="arrayClearItemContainer">
        (Waiting to clear items...)
    </span>
</cfoutput>