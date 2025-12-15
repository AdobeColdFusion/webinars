<cfif structKeyExists(session, "myArrayArrayPush") and isArray(session.myArrayArrayPush)>
    <cfset arrayClear(session.myArrayArrayPush)>
    <cfset session.myArrayArrayPush = session.myArray>
</cfif>
<h1>Array Push</h1>
<code>Adds one or more elements to the end of an array and returns the new length of the array.</code>
<code>Syntax: <strong>arrayPush(array, element1 [, element2, ...])</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Push new items to the array:
<form method="post" action="ArrayPushFunction.cfm">
    <input type="text" name="arrayItemArrayPush" id="arrayItemArrayPush" placeholder="Item to push">
    <button hx-post="ArrayPushFunction.cfm" hx-target=".arrayPushItemContainer">Push</button>
</form>
New array contents:
<cfoutput>  
    <span class="arrayPushItemContainer">
        (Waiting to push items...)
    </span>
</cfoutput>

