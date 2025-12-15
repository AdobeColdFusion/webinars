<cfif cgi.request_method eq "POST">
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayMax")>
        <cfset session.myArrayArrayMax = session.myArray>
    </cfif>
    <!--- Find the maximum value --->
    <cfset maxValue = arrayMax(session.myArrayArrayMax)>
</cfif>

<!--- Display the result --->
<cfoutput>
<cfif structKeyExists(variables, "maxValue")>
    <div class="arrayItemContainer" style="color: green; font-weight: bold;">Maximum value: #encodeForHtml(maxValue)#</div>
</cfif>
</cfoutput>
