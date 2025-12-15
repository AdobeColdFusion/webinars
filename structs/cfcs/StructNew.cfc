/**
 * StructNew.cfc
 * Component for structNew() function demonstration
 */
component {
    
    /**
     * Creates a new struct of a specified type and returns the result
     * @structType The type of struct to create (normal, ordered, casesensitive, ordered-casesensitive)
     * @return Struct containing newStruct, typeName, and formatted output HTML
     */
    public struct function createNewStruct(required string structType) {
        var result = {};
        var newStruct = {};
        var typeName = "";
        
        switch (arguments.structType) {
            case "normal":
                newStruct = structNew();
                typeName = "Normal Struct";
                break;
            case "ordered":
                newStruct = structNew("ordered");
                typeName = "Ordered Struct";
                break;
            case "casesensitive":
                newStruct = structNew("casesensitive");
                typeName = "Case-Sensitive Struct";
                break;
            case "ordered-casesensitive":
                newStruct = structNew("ordered-casesensitive");
                typeName = "Ordered Case-Sensitive Struct";
                break;
        }
        
        // Add some sample data
        newStruct["name"] = "Sample";
        newStruct["value"] = "Test";
        newStruct["count"] = 42;
        
        result.newStruct = newStruct;
        result.typeName = typeName;
        result.structType = arguments.structType;
        result.output = formatStructNewResult(typeName, arguments.structType, newStruct);
        
        return result;
    }
    
    /**
     * Formats the structNew result as HTML
     * @typeName The display name of the struct type
     * @structType The struct type code
     * @newStruct The newly created struct
     * @return Formatted HTML string
     */
    private string function formatStructNewResult(required string typeName, required string structType, required struct newStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Created: <strong>' & encodeForHtml(arguments.typeName) & '</strong><br>';
        output &= 'Struct Type: <strong>' & encodeForHtml(arguments.structType) & '</strong><br>';
        output &= 'Is Ordered: <strong>' & structIsOrdered(arguments.newStruct) & '</strong><br>';
        output &= 'Is Case Sensitive: <strong>' & structIsCaseSensitive(arguments.newStruct) & '</strong><br><br>';
        output &= 'Contents:';
        output &= '</div>';
        
        // Loop through and display struct contents
        for (var key in arguments.newStruct) {
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & ':</span> ';
            output &= '<span class="structValue">' & encodeForHtml(arguments.newStruct[key]) & '</span>';
            output &= '</div>';
        }
        
        return output;
    }
}

