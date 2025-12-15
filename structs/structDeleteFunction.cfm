<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "keyToDelete")) {
        structFunctions = new cfcs.StructDelete();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.deleteKey(session.myStruct, form.keyToDelete);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError('No struct exists. Cannot delete key "' & form.keyToDelete & '".'));
        }
    }
</cfscript>
