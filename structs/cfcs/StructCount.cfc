/**
 * StructCount.cfc
 * Component for structCount() function demonstration
 */
component {
    
    /**
     * Counts the keys in a struct and returns the result
     * @targetStruct The struct to count
     * @return Struct containing keyCount and formatted output HTML
     */
    public struct function countStruct(required struct targetStruct) {
        var result = {};
        result.keyCount = structCount(arguments.targetStruct);
        result.output = formatStructCountResult(result.keyCount, arguments.targetStruct);
        
        return result;
    }
    
    /**
     * Formats the structCount result as HTML
     * @keyCount The number of keys in the struct
     * @targetStruct The struct to display keys from
     * @return Formatted HTML string
     */
    private string function formatStructCountResult(required numeric keyCount, required struct targetStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Struct Key Count: <strong>' & arguments.keyCount & '</strong><br>';
        
        if (arguments.keyCount == 0) {
            output &= '<span style="color: orange;">The struct is empty</span>';
        } else if (arguments.keyCount == 1) {
            output &= '<span style="color: green;">The struct has 1 key</span>';
        } else {
            output &= '<span style="color: green;">The struct has ' & arguments.keyCount & ' keys</span>';
        }
        
        output &= '</div>';
        output &= '<div style="margin-top: 10px;">';
        output &= '<strong>Keys in struct:</strong><br>';
        
        // Loop through and display keys
        for (var key in arguments.targetStruct) {
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & '</span>';
            output &= '</div>';
        }
        
        output &= '</div>';
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

