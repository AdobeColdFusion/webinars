/**
 * StructClear.cfc
 * Component for structClear() function demonstration
 */
component {
    
    /**
     * Clears all keys from a struct and returns the result
     * @targetStruct The struct to clear (will be modified)
     * @return Struct containing originalCount, newCount, and formatted output HTML
     */
    public struct function clearStruct(required struct targetStruct) {
        var result = {};
        result.originalCount = structCount(arguments.targetStruct);
        
        structClear(arguments.targetStruct);
        
        result.newCount = structCount(arguments.targetStruct);
        result.isStruct = isStruct(arguments.targetStruct);
        result.isEmpty = structIsEmpty(arguments.targetStruct);
        result.output = formatStructClearResult(result.originalCount, result.newCount, result.isStruct, result.isEmpty);
        
        return result;
    }
    
    /**
     * Formats the structClear result as HTML
     * @originalCount The original key count before clear
     * @newCount The new key count after clear
     * @isStruct Whether the struct still exists as a struct
     * @isEmpty Whether the struct is empty
     * @return Formatted HTML string
     */
    private string function formatStructClearResult(required numeric originalCount, required numeric newCount, required boolean isStruct, required boolean isEmpty) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Struct cleared successfully!<br>';
        output &= 'Original key count: <strong>' & arguments.originalCount & '</strong><br>';
        output &= 'New key count: <strong>' & arguments.newCount & '</strong><br>';
        output &= 'Struct still exists: <strong>' & arguments.isStruct & '</strong><br>';
        output &= 'Struct is empty: <strong>' & arguments.isEmpty & '</strong>';
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

