<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "testStruct")) {
        structFunctions = new cfcs.StructIsCaseSensitive();
        result = structFunctions.testIsCaseSensitive(form.testStruct);
        writeOutput(result.output);
    }
</cfscript>
