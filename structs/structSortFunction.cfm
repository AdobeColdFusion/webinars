<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "sortType")) {
        structFunctions = new cfcs.StructSort();
        
        if (structKeyExists(session, "myStruct")) {
            sortOrder = structKeyExists(form, "sortOrder") ? form.sortOrder : "asc";
            result = structFunctions.sortStruct(session.myStruct, form.sortType, sortOrder);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. Cannot sort empty struct."));
        }
    }
</cfscript>


