<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "operation")) {
        structFunctions = new cfcs.StructReduce();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.reduceStruct(session.myStruct, form.operation, form);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. Cannot reduce empty struct."));
        }
    }
</cfscript>


