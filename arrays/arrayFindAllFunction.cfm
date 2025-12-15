<cfif structKeyExists(form, "arrayItemarrayFindAll")>
    <!--- Search array for value --->
    <cfif form.arrayItemarrayFindAll neq "">
        <cfoutput>
        <cfscript>
            itemPositions = arrayFindAll(session.myArray, form.arrayItemarrayFindAll);
            writeOutput("ArrayFindAll: <br />");
            writeDump(itemPositions);
            writeOutput("<br />");
            itemPositionsNoCase = arrayFindAllNoCase(session.myArray, form.arrayItemarrayFindAll);
            writeOutput("ArrayFindAllNoCase: <br />");
            writeDump(itemPositionsNoCase);
        </cfscript>
        </cfoutput>
    </cfif>
</cfif>