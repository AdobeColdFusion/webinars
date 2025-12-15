/**
 * StructSort.cfc
 * Component for structSort() function demonstration
 */
component {
    
    /**
     * Sorts a struct in-place and returns the result
     * @targetStruct The struct to sort (will be modified)
     * @sortType The type of sort (text, textnocase, numeric, valueText, valueTextNoCase, valueNumeric)
     * @sortOrder The sort order (asc or desc)
     * @return Struct containing beforeKeys, afterKeys, and formatted output HTML
     */
    public struct function sortStruct(required struct targetStruct, required string sortType, string sortOrder = "asc") {
        var result = {};
        result.beforeKeys = structKeyArray(arguments.targetStruct);
        
        structSort(arguments.targetStruct, arguments.sortType, arguments.sortOrder);
        
        result.afterKeys = structKeyArray(arguments.targetStruct);
        result.sortType = arguments.sortType;
        result.sortOrder = arguments.sortOrder;
        result.output = formatStructSortResult(arguments.sortType, arguments.sortOrder, arguments.targetStruct);
        
        return result;
    }
    
    /**
     * Formats the structSort result as HTML
     * @sortType The sort type used
     * @sortOrder The sort order used
     * @sortedStruct The sorted struct to display
     * @return Formatted HTML string
     */
    private string function formatStructSortResult(required string sortType, required string sortOrder, required struct sortedStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Sort type: <strong>' & encodeForHtml(arguments.sortType) & '</strong><br>';
        output &= 'Sort order: <strong>' & encodeForHtml(arguments.sortOrder) & '</strong><br>';
        output &= 'Struct sorted in-place (modified directly)<br><br>';
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

