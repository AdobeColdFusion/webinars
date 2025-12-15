<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "valuePattern")) {
        structFunctions = new cfcs.StructFindValue();
        
        if (structKeyExists(session, "myStruct")) {
            scope = structKeyExists(form, "scope") ? form.scope : "all";
            result = structFunctions.findValues(session.myStruct, form.valuePattern, scope);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError('No struct exists. Cannot search for value pattern "' & form.valuePattern & '".'));
        }
    }
</cfscript>
