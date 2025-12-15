/**
 * StructIsCaseSensitive.cfc
 * Component for structIsCaseSensitive() function demonstration
 */
component {
    
    /**
     * Tests if a struct is case-sensitive
     * @testStructType The type of struct to test (current, normal, casesensitive)
     * @return Struct containing test result and formatted output HTML
     */
    public struct function testIsCaseSensitive(required string testStructType) {
        var result = {};
        var testStruct = {};
        var structName = "";
        
        switch (arguments.testStructType) {
            case "current":
                if (structKeyExists(session, "myStruct")) {
                    testStruct = session.myStruct;
                    structName = "Current Session Struct";
                } else {
                    testStruct = structNew();
                    structName = "New Normal Struct (session struct didn''t exist)";
                }
                break;
            case "normal":
                testStruct = structNew();
                structName = "Normal Struct";
                break;
            case "casesensitive":
                testStruct = structNew("casesensitive");
                structName = "Case-Sensitive Struct";
                break;
        }
        
        // Add test data
        testStruct["Name"] = "John";
        testStruct["name"] = "Jane";
        
        result.isCaseSensitive = structIsCaseSensitive(testStruct);
        result.hasBothKeys = structKeyExists(testStruct, "Name") && structKeyExists(testStruct, "name");
        result.testStruct = testStruct;
        result.structName = structName;
        result.output = formatStructIsCaseSensitiveResult(structName, result.isCaseSensitive, result.hasBothKeys, testStruct);
        
        return result;
    }
    
    /**
     * Formats the structIsCaseSensitive result as HTML
     * @structName The name of the struct being tested
     * @isCaseSensitive Whether the struct is case-sensitive
     * @hasBothKeys Whether both "Name" and "name" keys exist
     * @testStruct The test struct to display
     * @return Formatted HTML string
     */
    private string function formatStructIsCaseSensitiveResult(required string structName, required boolean isCaseSensitive, required boolean hasBothKeys, required struct testStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Testing: <strong>' & encodeForHtml(arguments.structName) & '</strong><br>';
        output &= 'StructIsCaseSensitive() result: <strong>' & arguments.isCaseSensitive & '</strong><br>';
        output &= 'Has both "Name" and "name" keys: <strong>' & arguments.hasBothKeys & '</strong><br>';
        
        if (arguments.isCaseSensitive) {
            output &= '<span style="color: green;">✓ This struct is case-sensitive (keys "Name" and "name" are different)</span>';
        } else {
            output &= '<span style="color: orange;">✗ This struct is NOT case-sensitive (keys "Name" and "name" are the same)</span>';
        }
        
        output &= '<br><br><strong>Test Struct Contents:</strong>';
        output &= '</div>';
        
        // Loop through and display struct contents
        for (var key in arguments.testStruct) {
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & ':</span> ';
            output &= '<span class="structValue">' & encodeForHtml(arguments.testStruct[key]) & '</span>';
            output &= '</div>';
        }
        
        return output;
    }
}

