<cfif cgi.request_method eq "POST">
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayPop")>
        <cfset session.myArrayArrayPop = session.myArray>
    </cfif>
    <!--- Pop the last element from the session array --->
    <cfif arrayLen(session.myArrayArrayPop) gt 0>
        <cfset poppedElement = arrayPop(session.myArrayArrayPop)>
    </cfif>
</cfif>

<!--- Display the popped element and remaining array --->
<cfoutput>
<cfif structKeyExists(variables, "poppedElement")>
    <div class="arrayItemContainer" style="color: red; font-weight: bold;">Popped element: #encodeForHtml(poppedElement)#</div>
    <div class="arrayItemContainer" style="color: blue; font-weight: bold;">Remaining array (#arrayLen(session.myArrayArrayPop)# elements):</div>
    <cfif arrayLen(session.myArrayArrayPop) gt 0>
        <cfloop array="#session.myArrayArrayPop#" index="element">
            <div class="arrayItemContainer">#encodeForHtml(element)#</div>
        </cfloop>
    <cfelse>
        <div class="arrayItemContainer" style="color: orange;">Array is now empty</div>
    </cfif>
</cfif>
</cfoutput>

