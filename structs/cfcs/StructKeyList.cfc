/**
 * StructKeyList.cfc
 * Component for structKeyList() function demonstration
 */
component {
    
    /**
     * Gets a delimited list of keys from a struct
     * @targetStruct The struct to get keys from
     * @delimiter The delimiter to use (default: comma)
     * @return Struct containing keyList, keyCount, and formatted output HTML
     */
    public struct function getKeyList(required struct targetStruct, string delimiter = ",") {
        var result = {};
        result.keyList = structKeyList(arguments.targetStruct, arguments.delimiter);
        result.keyCount = listLen(result.keyList, arguments.delimiter);
        result.delimiter = arguments.delimiter;
        result.output = formatStructKeyListResult(arguments.delimiter, result.keyCount, result.keyList, arguments.targetStruct);
        
        return result;
    }
    
    /**
     * Formats the structKeyList result as HTML
     * @delimiter The delimiter used
     * @keyCount The number of keys
     * @keyList The delimited list of keys
     * @targetStruct The struct to display values from
     * @return Formatted HTML string
     */
    private string function formatStructKeyListResult(required string delimiter, required numeric keyCount, required string keyList, required struct targetStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Delimiter used: <strong>"' & encodeForHtml(arguments.delimiter) & '"</strong><br>';
        output &= 'Number of keys: <strong>' & arguments.keyCount & '</strong><br>';
        output &= 'Key list: <strong>' & encodeForHtml(arguments.keyList) & '</strong><br><br>';
        output &= '<strong>Individual keys:</strong>';
        output &= '</div>';
        
        // Loop through and display individual keys
        for (var key in arguments.targetStruct) {
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & '</span>';
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

