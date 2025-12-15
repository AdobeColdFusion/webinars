<cfif structKeyExists(form, "arrayItemarrayFind")>
    <!--- Search array for value --->
    <cfif form.arrayItemarrayFind neq "">
        <cfoutput>
        ArrayFind: #arrayFind(session.myArray, form.arrayItemarrayFind)#<br />
        ArrayFindNoCase: #arrayFindNoCase(session.myArray, form.arrayItemarrayFind)#
        </cfoutput>
    </cfif>
</cfif>