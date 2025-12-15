/**
 * StructKeyArray.cfc
 * Component for structKeyArray() function demonstration
 */
component {
    
    /**
     * Gets an array of keys from a struct
     * @targetStruct The struct to get keys from
     * @return Struct containing key array and formatted output HTML
     */
    public struct function getKeyArray(required struct targetStruct) {
        var result = {};
        result.keyArray = structKeyArray(arguments.targetStruct);
        result.output = formatStructKeyArrayResult(result.keyArray, arguments.targetStruct);
        
        return result;
    }
    
    /**
     * Formats the structKeyArray result as HTML
     * @keyArray The array of keys
     * @targetStruct The struct to display values from
     * @return Formatted HTML string
     */
    private string function formatStructKeyArrayResult(required array keyArray, required struct targetStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'StructKeyArray() returned an array with <strong>' & arrayLen(arguments.keyArray) & '</strong> keys<br>';
        output &= 'Array type: <strong>' & isArray(arguments.keyArray) & '</strong><br><br>';
        output &= '<strong>Keys in array:</strong>';
        output &= '</div>';
        
        // Loop through and display keys
        for (var i = 1; i <= arrayLen(arguments.keyArray); i++) {
            var key = arguments.keyArray[i];
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & '</span>';
            output &= ' <span class="structValue">(Value: ' & encodeForHtml(arguments.targetStruct[key]) & ')</span>';
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

