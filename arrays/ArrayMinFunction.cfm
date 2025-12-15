<cfif cgi.request_method eq "POST">
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayMin")>
        <cfset session.myArrayArrayMin = session.myArray>
    </cfif>
    <!--- Find the minimum value --->
    <cfset minValue = arrayMin(session.myArrayArrayMin)>
</cfif>

<!--- Display the result --->
<cfoutput>
<cfif structKeyExists(variables, "minValue")>
    <div class="arrayItemContainer" style="color: red; font-weight: bold;">Minimum value: #encodeForHtml(minValue)#</div>
</cfif>
</cfoutput>
