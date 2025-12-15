/**
 * StructIsEmpty.cfc
 * Component for structIsEmpty() function demonstration
 */
component {
    
    /**
     * Tests if a struct is empty
     * @targetStruct The struct to test
     * @return Struct containing test result and formatted output HTML
     */
    public struct function testIsEmpty(required struct targetStruct) {
        var result = {};
        result.isEmpty = structIsEmpty(arguments.targetStruct);
        result.keyCount = structCount(arguments.targetStruct);
        result.output = formatStructIsEmptyResult(result.isEmpty, result.keyCount);
        
        return result;
    }
    
    /**
     * Formats the structIsEmpty result as HTML
     * @isEmpty Whether the struct is empty
     * @keyCount The number of keys in the struct
     * @return Formatted HTML string
     */
    private string function formatStructIsEmptyResult(required boolean isEmpty, required numeric keyCount) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'StructIsEmpty() result: <strong>' & arguments.isEmpty & '</strong><br>';
        output &= 'Key count: <strong>' & arguments.keyCount & '</strong><br>';
        
        if (arguments.isEmpty) {
            output &= '<span style="color: orange;">✓ The struct is empty (no keys)</span>';
        } else {
            output &= '<span style="color: green;">✗ The struct is NOT empty (has ' & arguments.keyCount & ' key(s))</span>';
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

