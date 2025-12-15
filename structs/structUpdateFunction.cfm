<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "updateKey")) {
        structFunctions = new cfcs.StructUpdate();
        
        if (structKeyExists(session, "myStruct")) {
            updateValue = structKeyExists(form, "updateValue") ? form.updateValue : "";
            result = structFunctions.updateKey(session.myStruct, form.updateKey, updateValue);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError('No struct exists. Cannot update key "' & encodeForHtml(form.updateKey) & '".'));
        }
    }
</cfscript>


