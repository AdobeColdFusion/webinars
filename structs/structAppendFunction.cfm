<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "appendType")) {
        // Instantiate the StructFunctions component
        structFunctions = new cfcs.StructAppend();
        
        // Ensure session struct exists
        sessionStruct = structFunctions.ensureSessionStruct();
        
        // Determine overwrite setting (defaults to true)
        overwrite = true;
        if (structKeyExists(form, "overwrite") && form.overwrite == "false") {
            overwrite = false;
        }
        
        // Create source struct based on append type
        sourceStruct = structFunctions.createSourceStruct(form.appendType, form);
        
        // Append the struct
        result = structFunctions.appendStruct(sessionStruct, sourceStruct, overwrite);
        
        // Output the result
        writeOutput(result.output);
    }
</cfscript>
