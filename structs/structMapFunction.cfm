<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "transformation")) {
        structFunctions = new cfcs.StructMap();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.mapStruct(session.myStruct, form.transformation, form);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. Cannot transform empty struct."));
        }
    }
</cfscript>


