/**
 * StructDelete.cfc
 * Component for structDelete() function demonstration
 */
component {
    
    /**
     * Deletes a key from a struct and returns the result
     * @targetStruct The struct to delete from (will be modified)
     * @keyToDelete The key to delete
     * @return Struct containing deletion result and formatted output HTML
     */
    public struct function deleteKey(required struct targetStruct, required string keyToDelete) {
        var result = {};
        result.keyExists = structKeyExists(arguments.targetStruct, arguments.keyToDelete);
        result.originalCount = structCount(arguments.targetStruct);
        
        if (result.keyExists) {
            result.oldValue = arguments.targetStruct[arguments.keyToDelete];
        }
        
        result.deleteResult = structDelete(arguments.targetStruct, arguments.keyToDelete);
        result.newCount = structCount(arguments.targetStruct);
        result.output = formatStructDeleteResult(arguments.keyToDelete, result.keyExists, result.deleteResult, result.originalCount, result.newCount, result.oldValue, arguments.targetStruct);
        
        return result;
    }
    
    /**
     * Formats the structDelete result as HTML
     * @keyToDelete The key that was deleted
     * @keyExists Whether the key existed
     * @deleteResult The result from structDelete()
     * @originalCount Original key count
     * @newCount New key count
     * @oldValue The value that was deleted (if key existed)
     * @updatedStruct The updated struct to display
     * @return Formatted HTML string
     */
    private string function formatStructDeleteResult(required string keyToDelete, required boolean keyExists, required boolean deleteResult, required numeric originalCount, required numeric newCount, any oldValue = "", required struct updatedStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Key to delete: <strong>"' & encodeForHtml(arguments.keyToDelete) & '"</strong><br>';
        output &= 'Key existed: <strong>' & arguments.keyExists & '</strong><br>';
        output &= 'StructDelete() result: <strong>' & arguments.deleteResult & '</strong><br>';
        output &= 'Original key count: <strong>' & arguments.originalCount & '</strong><br>';
        output &= 'New key count: <strong>' & arguments.newCount & '</strong><br>';
        
        if (arguments.deleteResult) {
            output &= '<span style="color: green;">✓ Key deleted successfully!</span>';
            if (arguments.keyExists && arguments.oldValue != "") {
                output &= '<br>Deleted value was: <strong>' & encodeForHtml(arguments.oldValue) & '</strong>';
            }
        } else {
            output &= '<span style="color: red;">✗ Key was not deleted (didn''t exist)</span>';
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

