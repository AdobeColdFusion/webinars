/**
 * StructGetMetadata.cfc
 * Component for structGetMetadata() function demonstration
 */
component {
    
    /**
     * Gets metadata for a test struct based on type
     * @testStructType The type of struct to test (current, normal, ordered, casesensitive)
     * @return Struct containing metadata and formatted output HTML
     */
    public struct function getMetadataForStruct(required string testStructType) {
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
                    structName = "New Normal Struct";
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
            case "casesensitive":
                testStruct = structNew("casesensitive");
                structName = "Case-Sensitive Struct";
                break;
        }
        
        testStruct["sample"] = "data";
        result.metadata = structGetMetadata(testStruct);
        result.structName = structName;
        result.output = formatStructGetMetadataResult(structName, result.metadata);
        
        return result;
    }
    
    /**
     * Formats the structGetMetadata result as HTML
     * @structName The name of the struct being tested
     * @metadata The metadata struct
     * @return Formatted HTML string
     */
    private string function formatStructGetMetadataResult(required string structName, required struct metadata) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Testing: <strong>' & encodeForHtml(arguments.structName) & '</strong><br>';
        output &= 'Metadata retrieved: <strong>' & isStruct(arguments.metadata) & '</strong><br>';
        output &= 'Metadata keys: <strong>' & structCount(arguments.metadata) & '</strong><br><br>';
        output &= '<strong>Metadata Contents:</strong>';
        output &= '</div>';
        
        // Loop through and display metadata contents
        for (var key in arguments.metadata) {
            var value = arguments.metadata[key];
            var displayValue = "";
            
            // Handle different value types
            if (isDate(value)) {
                displayValue = dateTimeFormat(value);
            } else if (isArray(value)) {
                // Format array as comma-separated list
                var arrayItems = [];
                for (var i = 1; i <= arrayLen(value); i++) {
                    var item = value[i];
                    if (isSimpleValue(item)) {
                        arrayAppend(arrayItems, item);
                    } else if (isDate(item)) {
                        arrayAppend(arrayItems, dateTimeFormat(item));
                    } else {
                        arrayAppend(arrayItems, "[Complex]");
                    }
                }
                displayValue = arrayToList(arrayItems, ", ");
            } else if (isStruct(value)) {
                // Format struct as key-value pairs
                var structItems = [];
                for (var structKey in value) {
                    var structVal = value[structKey];
                    var structValStr = "";
                    if (isSimpleValue(structVal)) {
                        structValStr = structVal;
                    } else if (isDate(structVal)) {
                        structValStr = dateTimeFormat(structVal);
                    } else {
                        structValStr = "[Complex]";
                    }
                    arrayAppend(structItems, structKey & ": " & structValStr);
                }
                displayValue = arrayToList(structItems, "; ");
            } else if (isSimpleValue(value)) {
                displayValue = value;
            } else {
                displayValue = "[Complex Object: " & getMetadata(value).getName() & "]";
            }
            
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & ':</span> ';
            output &= '<span class="structValue">' & encodeForHtml(displayValue) & '</span>';
            output &= '</div>';
        }
        
        // Note: cfdump cannot be included in a string, so it's omitted here
        // The metadata contents are displayed above
        
        return output;
    }
}

