<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "insertKey")) {
        structFunctions = new cfcs.StructInsert();
        
        // Ensure session struct exists
        sessionStruct = structFunctions.ensureSessionStruct();
        
        // Determine allowOverwrite setting
        allowOverwrite = false;
        if (structKeyExists(form, "allowOverwrite") && form.allowOverwrite == "true") {
            allowOverwrite = true;
        }
        
        insertValue = structKeyExists(form, "insertValue") ? form.insertValue : "";
        
        result = structFunctions.insertKey(sessionStruct, form.insertKey, insertValue, allowOverwrite);
        writeOutput(result.output);
    }
</cfscript>
