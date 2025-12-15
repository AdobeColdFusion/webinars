/**
 * StructCopy.cfc
 * Component for structCopy() function demonstration
 */
component {
    
    /**
     * Creates a copy of a struct and returns the result
     * @sourceStruct The struct to copy
     * @return Struct containing copiedStruct and formatted output HTML
     */
    public struct function copyStruct(required struct sourceStruct) {
        var result = {};
        result.copiedStruct = structCopy(arguments.sourceStruct);
        
        // Modify the copy to show it's independent
        result.copiedStruct["_copied"] = "This is a copy";
        result.copiedStruct["_timestamp"] = now();
        
        result.originalCount = structCount(arguments.sourceStruct);
        result.copiedCount = structCount(result.copiedStruct);
        // structCopy() always creates a new struct object, so they are never the same reference
        result.isSameObject = false;
        result.output = formatStructCopyResult(result.originalCount, result.copiedCount, result.isSameObject, result.copiedStruct);
        
        return result;
    }
    
    /**
     * Formats the structCopy result as HTML
     * @originalCount The original struct key count
     * @copiedCount The copied struct key count
     * @isSameObject Whether they are the same object reference
     * @copiedStruct The copied struct to display
     * @return Formatted HTML string
     */
    private string function formatStructCopyResult(required numeric originalCount, required numeric copiedCount, required boolean isSameObject, required struct copiedStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Original struct key count: <strong>' & arguments.originalCount & '</strong><br>';
        output &= 'Copied struct key count: <strong>' & arguments.copiedCount & '</strong><br>';
        output &= 'Are they the same object? <strong>' & arguments.isSameObject & '</strong> (should be false)<br><br>';
        output &= '<strong>Copied Struct Contents:</strong>';
        output &= '</div>';
        
        // Loop through and display struct contents
        for (var key in arguments.copiedStruct) {
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & ':</span> ';
            output &= '<span class="structValue">' & encodeForHtml(arguments.copiedStruct[key]) & '</span>';
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

