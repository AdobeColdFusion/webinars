/**
 * StructAppend.cfc
 * Component for structAppend() function demonstration
 */
component {
    
    /**
     * Ensures the session struct exists, creating it if necessary
     * @return The session struct
     */
    public struct function ensureSessionStruct() {
        if (!structKeyExists(session, "myStruct")) {
            session.myStruct = {};
        }
        return session.myStruct;
    }
    
    /**
     * Creates a source struct based on the append type and form data
     * @appendType The type of struct to create (sample, nested, numbers, custom)
     * @formData The form data containing custom keys/values if appendType is "custom"
     * @return Struct containing the source struct to append
     */
    public struct function createSourceStruct(required string appendType, struct formData = {}) {
        var sourceStruct = {};
        
        switch (arguments.appendType) {
            case "sample":
                sourceStruct["name"] = "John Doe";
                sourceStruct["age"] = 30;
                sourceStruct["city"] = "New York";
                break;
            case "nested":
                sourceStruct["address"] = {street="123 Main St", city="Boston", zip="02101"};
                sourceStruct["type"] = "home";
                break;
            case "numbers":
                sourceStruct["x"] = 10;
                sourceStruct["y"] = 20;
                sourceStruct["z"] = 30;
                break;
            case "custom":
                if (structKeyExists(arguments.formData, "key1") && arguments.formData.key1 != "") {
                    sourceStruct[arguments.formData.key1] = structKeyExists(arguments.formData, "value1") ? arguments.formData.value1 : "";
                }
                if (structKeyExists(arguments.formData, "key2") && arguments.formData.key2 != "") {
                    sourceStruct[arguments.formData.key2] = structKeyExists(arguments.formData, "value2") ? arguments.formData.value2 : "";
                }
                break;
        }
        
        return sourceStruct;
    }
    
    /**
     * Appends a source struct to a destination struct and returns the result
     * @destinationStruct The struct to append to (will be modified)
     * @sourceStruct The struct to append from
     * @overwrite Whether to overwrite existing keys (default: true)
     * @return Struct containing originalCount, newCount, keysAdded, and formatted output HTML
     */
    public struct function appendStruct(required struct destinationStruct, required struct sourceStruct, boolean overwrite = true) {
        var result = {};
        result.originalCount = structCount(arguments.destinationStruct);
        
        structAppend(arguments.destinationStruct, arguments.sourceStruct, arguments.overwrite);
        
        result.newCount = structCount(arguments.destinationStruct);
        result.keysAdded = result.newCount - result.originalCount;
        result.overwrite = arguments.overwrite;
        result.output = formatStructAppendResult(result.originalCount, result.newCount, result.keysAdded, result.overwrite, arguments.destinationStruct);
        
        return result;
    }
    
    /**
     * Formats the structAppend result as HTML
     * @originalCount The original key count before append
     * @newCount The new key count after append
     * @keysAdded The number of keys added
     * @overwrite Whether overwrite mode was used
     * @updatedStruct The updated struct to display
     * @return Formatted HTML string
     */
    private string function formatStructAppendResult(required numeric originalCount, required numeric newCount, required numeric keysAdded, required boolean overwrite, required struct updatedStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Struct appended successfully!<br>';
        output &= 'Original key count: <strong>' & arguments.originalCount & '</strong><br>';
        output &= 'New key count: <strong>' & arguments.newCount & '</strong><br>';
        output &= 'Keys added: <strong>' & arguments.keysAdded & '</strong><br>';
        output &= 'Overwrite mode: <strong>' & arguments.overwrite & '</strong><br><br>';
        output &= '<strong>Updated struct contents:</strong>';
        output &= '</div>';
        
        // Loop through and display struct contents
        for (var key in arguments.updatedStruct) {
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & ':</span> ';
            output &= '<span class="structValue">' & encodeForHtml(arguments.updatedStruct[key]) & '</span>';
            output &= '</div>';
        }
        
        return output;
    }
}

