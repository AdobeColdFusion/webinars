<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "path")) {
        structFunctions = new cfcs.StructGet();
        result = structFunctions.getByPath(form.path);
        writeOutput(result.output);
    }
</cfscript>
