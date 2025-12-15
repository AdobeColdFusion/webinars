<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "keyToCheck")) {
        structFunctions = new cfcs.StructKeyExists();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.checkKeyExists(session.myStruct, form.keyToCheck);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError('No struct exists. Key "' & encodeForHtml(form.keyToCheck) & '" does not exist.'));
        }
    }
</cfscript>


