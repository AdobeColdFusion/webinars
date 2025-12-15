/**
 * StructIsOrdered.cfc
 * Component for structIsOrdered() function demonstration
 */
component {
    
    /**
     * Tests if a struct is ordered
     * @testStructType The type of struct to test (current, normal, ordered)
     * @return Struct containing test result and formatted output HTML
     */
    public struct function testIsOrdered(required string testStructType) {
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
            case "ordered":
                testStruct = structNew("ordered");
                structName = "Ordered Struct";
                break;
        }
        
        // Add test data in specific order
        testStruct["first"] = "1st";
        testStruct["second"] = "2nd";
        testStruct["third"] = "3rd";
        testStruct["fourth"] = "4th";
        
        result.isOrdered = structIsOrdered(testStruct);
        result.keyArray = structKeyArray(testStruct);
        result.testStruct = testStruct;
        result.structName = structName;
        result.output = formatStructIsOrderedResult(structName, result.isOrdered, result.keyArray, testStruct);
        
        return result;
    }
    
    /**
     * Formats the structIsOrdered result as HTML
     * @structName The name of the struct being tested
     * @isOrdered Whether the struct is ordered
     * @keyArray The array of keys in order
     * @testStruct The test struct to display
     * @return Formatted HTML string
     */
    private string function formatStructIsOrderedResult(required string structName, required boolean isOrdered, required array keyArray, required struct testStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Testing: <strong>' & encodeForHtml(arguments.structName) & '</strong><br>';
        output &= 'StructIsOrdered() result: <strong>' & arguments.isOrdered & '</strong><br>';
        output &= 'Keys added in order: first, second, third, fourth<br>';
        
        if (arguments.isOrdered) {
            output &= '<span style="color: green;">✓ This struct is ordered (maintains insertion order)</span>';
        } else {
            output &= '<span style="color: orange;">✗ This struct is NOT ordered (order may vary)</span>';
        }
        
        output &= '<br><br><strong>Key Order:</strong>';
        output &= '</div>';
        
        // Loop through and display keys in order
        for (var i = 1; i <= arrayLen(arguments.keyArray); i++) {
            var key = arguments.keyArray[i];
            output &= '<div class="structItemContainer">';
            output &= 'Position ' & i & ': <span class="structKey">' & encodeForHtml(key) & '</span> = ';
            output &= '<span class="structValue">' & encodeForHtml(arguments.testStruct[key]) & '</span>';
            output &= '</div>';
        }
        
        return output;
    }
}

