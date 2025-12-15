/**
 * StructUpdate.cfc
 * Component for structUpdate() function demonstration
 */
component {
    
    /**
     * Updates a key in a struct and returns the result
     * @targetStruct The struct to update (will be modified)
     * @updateKey The key to update
     * @updateValue The new value
     * @return Struct containing update result and formatted output HTML
     */
    public struct function updateKey(required struct targetStruct, required string updateKey, required any updateValue) {
        var result = {};
        result.keyExists = structKeyExists(arguments.targetStruct, arguments.updateKey);
        
        if (result.keyExists) {
            result.oldValue = arguments.targetStruct[arguments.updateKey];
        }
        
        result.updateResult = structUpdate(arguments.targetStruct, arguments.updateKey, arguments.updateValue);
        result.output = formatStructUpdateResult(arguments.updateKey, arguments.updateValue, result.keyExists, result.updateResult, result.oldValue, arguments.targetStruct);
        
        return result;
    }
    
    /**
     * Formats the structUpdate result as HTML
     * @updateKey The key that was updated
     * @updateValue The new value
     * @keyExists Whether the key existed before
     * @updateResult The result from structUpdate()
     * @oldValue The old value (if key existed)
     * @updatedStruct The updated struct to display
     * @return Formatted HTML string
     */
    private string function formatStructUpdateResult(required string updateKey, required any updateValue, required boolean keyExists, required boolean updateResult, any oldValue = "", required struct updatedStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Key: <strong>"' & encodeForHtml(arguments.updateKey) & '"</strong><br>';
        output &= 'New value: <strong>"' & encodeForHtml(arguments.updateValue) & '"</strong><br>';
        output &= 'Key existed: <strong>' & arguments.keyExists & '</strong><br>';
        output &= 'StructUpdate() result: <strong>' & arguments.updateResult & '</strong><br>';
        
        if (arguments.updateResult) {
            output &= '<span style="color: green;">✓ Key updated successfully!</span>';
            if (arguments.keyExists && arguments.oldValue != "") {
                output &= '<br>Old value was: <strong>' & encodeForHtml(arguments.oldValue) & '</strong>';
            }
        } else {
            output &= '<span style="color: red;">✗ Update failed - key doesn''t exist</span><br>';
            output &= '<span style="color: orange;">Use StructInsert() to add new keys</span>';
        }
        
        output &= '<br><br><strong>Updated struct contents:</strong>';
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
    
    /**
     * Returns an error message when struct doesn't exist
     * @message The error message to display
     * @return Formatted HTML error string
     */
    public string function getStructNotFoundError(required string message) {
        return '<div class="structItemContainer" style="color: red;">' & encodeForHtml(arguments.message) & '</div>';
    }
}

