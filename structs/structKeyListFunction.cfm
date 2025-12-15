<cfscript>
    if (cgi.request_method == "POST") {
        structFunctions = new cfcs.StructKeyList();
        
        if (structKeyExists(session, "myStruct")) {
            delimiter = structKeyExists(form, "delimiter") ? form.delimiter : ",";
            result = structFunctions.getKeyList(session.myStruct, delimiter);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. StructKeyList() would return an empty string."));
        }
    }
</cfscript>


