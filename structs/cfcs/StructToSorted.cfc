/**
 * StructToSorted.cfc
 * Component for structToSorted() function demonstration
 */
component {
    
    /**
     * Creates a sorted copy of a struct and returns the result
     * @targetStruct The struct to create a sorted copy from
     * @sortType The type of sort (text, textnocase, numeric, valueText, valueTextNoCase, valueNumeric)
     * @sortOrder The sort order (asc or desc)
     * @return Struct containing sortedStruct, originalCount, sortedCount, and formatted output HTML
     */
    public struct function toSortedStruct(required struct targetStruct, required string sortType, string sortOrder = "asc") {
        var result = {};
        result.originalCount = structCount(arguments.targetStruct);
        result.originalKeys = structKeyArray(arguments.targetStruct);
        
        result.sortedStruct = structToSorted(arguments.targetStruct, arguments.sortType, arguments.sortOrder);
        result.sortedCount = structCount(result.sortedStruct);
        result.sortedKeys = structKeyArray(result.sortedStruct);
        result.sortType = arguments.sortType;
        result.sortOrder = arguments.sortOrder;
        result.output = formatStructToSortedResult(arguments.sortType, arguments.sortOrder, result.originalCount, result.sortedCount, result.sortedStruct);
        
        return result;
    }
    
    /**
     * Formats the structToSorted result as HTML
     * @sortType The sort type used
     * @sortOrder The sort order used
     * @originalCount Original struct key count
     * @sortedCount Sorted struct key count
     * @sortedStruct The sorted struct to display
     * @return Formatted HTML string
     */
    private string function formatStructToSortedResult(required string sortType, required string sortOrder, required numeric originalCount, required numeric sortedCount, required struct sortedStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Sort type: <strong>' & encodeForHtml(arguments.sortType) & '</strong><br>';
        output &= 'Sort order: <strong>' & encodeForHtml(arguments.sortOrder) & '</strong><br>';
        output &= 'Original struct unchanged: <strong>' & arguments.originalCount & '</strong> keys<br>';
        output &= 'New sorted struct: <strong>' & arguments.sortedCount & '</strong> keys<br>';
        output &= 'Original struct modified: <strong>false</strong> (new struct created)<br><br>';
        output &= '<strong>Sorted Struct Contents:</strong>';
        output &= '</div>';
        
        // Loop through and display struct contents
        for (var key in arguments.sortedStruct) {
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & ':</span> ';
            output &= '<span class="structValue">' & encodeForHtml(arguments.sortedStruct[key]) & '</span>';
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

