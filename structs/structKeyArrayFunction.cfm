<cfscript>
    if (cgi.request_method == "POST") {
        structFunctions = new cfcs.StructKeyArray();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.getKeyArray(session.myStruct);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. StructKeyArray() would return an empty array: <strong>[]</strong>"));
        }
    }
</cfscript>
