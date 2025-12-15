<cfif cgi.request_method eq "POST" and structKeyExists(form, "sortType") and structKeyExists(form, "sortOrder")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArraySort")>
        <cfset session.myArrayArraySort = session.myArray>
    </cfif>
    <!--- Sort the array --->
    
    <cfset sortedArray = arraySort(session.myArrayArraySort, form.sortType, form.sortOrder)>
</cfif>

<!--- Display the sorted array --->
<cfoutput>
<cfif structKeyExists(variables, "sortedArray")>
    
    <div class="arrayItemContainer" style="color: green; font-weight: bold;">Array sorted by #form.sortType# in #form.sortOrder# order:</div>
    <cfloop array="#session.myArrayArraySort#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
