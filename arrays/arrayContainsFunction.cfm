<cfif structKeyExists(form, "arrayItemarrayContains")>
    <!--- Search array for value --->
    <cfif form.arrayItemarrayContains neq "">
        <cfoutput>
        ArrayContains: #arrayContains(session.myArray, form.arrayItemarrayContains)#<br />
        ArrayContainsNoCase: #arrayContainsNoCase(session.myArray, form.arrayItemarrayContains)#
        </cfoutput>
    </cfif>
</cfif>