<cfscript>
    if (cgi.request_method == "POST" && structKeyExists(form, "testValue")) {
        // Instantiate the StructFunctions component
        structFunctions = new cfcs.IsStruct();
        
        // Get the test variable based on the form input
        testData = structFunctions.getTestVariable(form.testValue);
        
        // Test if the variable is a struct
        result = structFunctions.testIsStruct(testData.testVar, testData.varName);
        
        // Output the result
        writeOutput(result.output);
    }
</cfscript>
