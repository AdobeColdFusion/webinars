<cfscript>
    if (cgi.request_method == "POST") {
        structFunctions = new cfcs.StructCopy();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.copyStruct(session.myStruct);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists to copy. Please add some key-value pairs first."));
        }
    }
</cfscript>
