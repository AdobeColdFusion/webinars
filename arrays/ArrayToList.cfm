<cfif structKeyExists(session, "myArrayArrayToList") and isArray(session.myArrayArrayToList)>
    <cfset arrayClear(session.myArrayArrayToList)>
    <cfset session.myArrayArrayToList = session.myArray>
</cfif>
<h1>Array To List</h1>
<code>Converts an array to a delimited list string.</code>
<code>Syntax: <strong>arrayToList(array [, delimiter])</strong></code>
<cfset myArray = session.myArray>
Current array contents:
<cfoutput>  
    <cfloop array="#myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfoutput>
Convert array to list:
<form method="post" action="ArrayToListFunction.cfm">
    <select name="delimiter" id="delimiter">
        <option value=",">Comma (,)</option>
        <option value=";">Semicolon (;)</option>
        <option value="|">Pipe (|)</option>
        <option value="-">Dash (-)</option>
        <option value=" ">Space ( )</option>
    </select>
    <button hx-post="ArrayToListFunction.cfm" hx-target=".arrayToListItemContainer">Convert to List</button>
</form>
List result:
<cfoutput>  
    <span class="arrayToListItemContainer">
        (Waiting to convert array...)
    </span>
</cfoutput>
