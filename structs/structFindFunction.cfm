<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "findKey")) {
        structFunctions = new cfcs.StructFind();
        
        if (structKeyExists(session, "myStruct")) {
            defaultValue = structKeyExists(form, "defaultValue") && form.defaultValue != "" ? form.defaultValue : "";
            result = structFunctions.findInStruct(session.myStruct, form.findKey, defaultValue);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError('No struct exists. Cannot find key "' & form.findKey & '".'));
        }
    }
</cfscript>
