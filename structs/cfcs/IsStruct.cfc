/**
 * IsStruct.cfc
 * Component for isStruct() function demonstration
 */
component {
    
    /**
     * Tests if a value is a struct and returns the result with formatted output
     * @testVar The variable to test
     * @varName The display name for the variable being tested
     * @return Struct containing result (isStruct boolean) and formatted output HTML
     */
    public struct function testIsStruct(required any testVar, required string varName) {
        var result = {};
        result.isStruct = isStruct(arguments.testVar);
        result.output = formatIsStructResult(arguments.varName, result.isStruct);
        return result;
    }
    
    /**
     * Formats the isStruct test result as HTML
     * @varName The display name for the variable being tested
     * @isStructResult The boolean result from isStruct()
     * @return Formatted HTML string
     */
    private string function formatIsStructResult(required string varName, required boolean isStructResult) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Testing: <strong>' & encodeForHtml(arguments.varName) & '</strong><br>';
        output &= 'isStruct() result: <strong>' & arguments.isStructResult & '</strong>';
        
        if (arguments.isStructResult) {
            output &= ' <span style="color: green;">✓ This is a struct!</span>';
        } else {
            output &= ' <span style="color: red;">✗ This is NOT a struct</span>';
        }
        
        output &= '</div>';
        return output;
    }
    
    /**
     * Gets a test variable based on the test type
     * @testType The type of test variable to create
     * @return Struct containing testVar and varName
     */
    public struct function getTestVariable(required string testType) {
        var result = {};
        
        switch (arguments.testType) {
            case "current":
                if (structKeyExists(session, "myStruct")) {
                    result.testVar = session.myStruct;
                    result.varName = "Current Session Struct";
                } else {
                    result.testVar = {};
                    result.varName = "New Normal Struct (session struct didn't exist)";
                }
                break;
            case "empty":
                result.testVar = {};
                result.varName = "Empty Struct {}";
                break;
            case "nested":
                result.testVar = {name="John", address={street="123 Main", city="Anytown"}};
                result.varName = "Nested Struct";
                break;
            case "array":
                result.testVar = [1,2,3];
                result.varName = "Array Value";
                break;
            case "string":
                result.testVar = "Hello World";
                result.varName = "String Value";
                break;
            case "number":
                result.testVar = 42;
                result.varName = "Number Value";
                break;
            default:
                result.testVar = {};
                result.varName = "Unknown";
        }
        
        return result;
    }
}

