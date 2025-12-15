<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "keyPattern")) {
        structFunctions = new cfcs.StructFindKey();
        
        if (structKeyExists(session, "myStruct")) {
            scope = structKeyExists(form, "scope") ? form.scope : "all";
            result = structFunctions.findKeys(session.myStruct, form.keyPattern, scope);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError('No struct exists. Cannot search for key pattern "' & form.keyPattern & '".'));
        }
    }
</cfscript>
