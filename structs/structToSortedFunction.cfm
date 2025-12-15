<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "sortType")) {
        structFunctions = new cfcs.StructToSorted();
        
        if (structKeyExists(session, "myStruct")) {
            sortOrder = structKeyExists(form, "sortOrder") ? form.sortOrder : "asc";
            result = structFunctions.toSortedStruct(session.myStruct, form.sortType, sortOrder);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. Cannot create sorted copy from empty struct."));
        }
    }
</cfscript>


