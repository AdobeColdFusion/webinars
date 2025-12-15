<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "structType")) {
        structFunctions = new cfcs.StructNew();
        result = structFunctions.createNewStruct(form.structType);
        writeOutput(result.output);
    }
</cfscript>


