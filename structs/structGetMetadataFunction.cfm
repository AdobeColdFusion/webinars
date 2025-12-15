<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "testStruct")) {
        structFunctions = new cfcs.StructGetMetadata();
        result = structFunctions.getMetadataForStruct(form.testStruct);
        writeOutput(result.output);
    }
</cfscript>
