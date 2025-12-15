<cfif structKeyExists(session, "myArrayArraySum") and isArray(session.myArrayArraySum)>
    <cfset arrayClear(session.myArrayArraySum)>
    <cfset session.myArrayArraySum = session.myArray>
</cfif>
<h1>Array Sum</h1>
<code>Calculates the sum of the values in an array. Supports parallel processing. All members must have type numeric.</code>
<code>Syntax: <strong>arraySum(array [, parallel] [, maxThreadCount])</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Calculate sum of array:
<form method="post" action="ArraySumFunction.cfm">
    <button hx-post="ArraySumFunction.cfm" hx-target=".arraySumItemContainer">Calculate Sum</button>
</form>
Array sum:
<cfoutput>  
    <span class="arraySumItemContainer">
        (Waiting to calculate sum...)
    </span>
</cfoutput>
