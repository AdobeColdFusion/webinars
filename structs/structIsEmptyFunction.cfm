<cfscript>
    if (cgi.request_method == "POST") {
        structFunctions = new cfcs.StructIsEmpty();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.testIsEmpty(session.myStruct);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. StructIsEmpty() would return: <strong>true</strong> (struct doesn't exist)"));
        }
    }
</cfscript>
