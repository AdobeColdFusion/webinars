<h1>Array Each</h1>
<code>Iterates over each element in an array and performs a specified action.</code>
<code>Syntax: <strong>arrayEach(array, callback [, parallel] [, maxThreadCount])</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Click to show index position of each item and upcase the value of array:
<form method="post" action="arrayEachFunction.cfm">
    <button hx-post="arrayEachFunction.cfm" hx-target="#arrayEachItemContainer">Process</button>
</form>
Array each value:
<cfoutput>  
    <span id="arrayEachItemContainer">
        (Waiting to process items...)
    </span>
</cfoutput>