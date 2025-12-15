<cfif cgi.request_method eq "POST" and structKeyExists(form, "delimiter")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayToList")>
        <cfset session.myArrayArrayToList = session.myArray>
    </cfif>
    <!--- Convert the array to a list --->
    <cfset listResult = arrayToList(session.myArrayArrayToList, form.delimiter)>
</cfif>

<!--- Display the list result --->
<cfoutput>
<cfif structKeyExists(variables, "listResult")>
    <div class="arrayItemContainer" style="color: purple; font-weight: bold;">List with delimiter '#form.delimiter#':</div>
    <div class="arrayItemContainer" style="background-color: ##f0f0f0; padding: 10px; border: 1px solid ##ccc;">#encodeForHtml(listResult)#</div>
</cfif>
</cfoutput>
