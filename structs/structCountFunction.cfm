<cfscript>
    if (cgi.request_method == "POST") {
        structFunctions = new cfcs.StructCount();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.countStruct(session.myStruct);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. Count: <strong>0</strong>"));
        }
    }
</cfscript>
