<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "filterType")) {
        structFunctions = new cfcs.StructFilter();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.filterStruct(session.myStruct, form.filterType, form);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. Cannot filter empty struct."));
        }
    }
</cfscript>
