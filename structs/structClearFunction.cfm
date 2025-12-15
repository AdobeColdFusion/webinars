<cfscript>
    if (cgi.request_method == "POST") {
        structFunctions = new cfcs.StructClear();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.clearStruct(session.myStruct);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists to clear. Please add some key-value pairs first."));
        }
    }
</cfscript>
