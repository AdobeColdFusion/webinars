<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "operation")) {
        structFunctions = new cfcs.StructEach();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.eachStruct(session.myStruct, form.operation, form);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. Cannot iterate over empty struct."));
        }
    }
</cfscript>
