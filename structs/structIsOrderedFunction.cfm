<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "testStruct")) {
        structFunctions = new cfcs.StructIsOrdered();
        result = structFunctions.testIsOrdered(form.testStruct);
        writeOutput(result.output);
    }
</cfscript>
