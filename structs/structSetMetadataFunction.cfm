<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "metadataType")) {
        structFunctions = new cfcs.StructSetMetadata();
        
        if (structKeyExists(session, "myStruct")) {
            result = structFunctions.setMetadataForStruct(session.myStruct, form.metadataType);
            writeOutput(result.output);
        } else {
            writeOutput(structFunctions.getStructNotFoundError("No struct exists. Cannot set metadata on empty struct."));
        }
    }
</cfscript>


