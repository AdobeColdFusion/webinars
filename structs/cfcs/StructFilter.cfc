/**
 * StructFilter.cfc
 * Component for structFilter() function demonstration
 */
component {
    
    /**
     * Filters a struct based on criteria and returns the filtered result
     * @targetStruct The struct to filter
     * @filterType The type of filter to apply
     * @formData Optional form data for custom filters
     * @return Struct containing filtered struct and formatted output HTML
     */
    public struct function filterStruct(required struct targetStruct, required string filterType, struct formData = {}) {
        var result = {};
        var filterCallback = "";
        var customVal = structKeyExists(arguments.formData, "customValue") ? arguments.formData.customValue : "";
        
        switch (arguments.filterType) {
            case "numeric":
                filterCallback = function(key, value) {
                    return isNumeric(value);
                };
                break;
            case "string":
                filterCallback = function(key, value) {
                    return isSimpleValue(value) && !isNumeric(value);
                };
                break;
            case "length":
                filterCallback = function(key, value) {
                    return isSimpleValue(value) && len(value) > 5;
                };
                break;
            case "keyContains":
                filterCallback = function(key, value) {
                    return findNoCase("a", key) > 0;
                };
                break;
            case "valueContains":
                filterCallback = function(key, value) {
                    return isSimpleValue(value) && findNoCase("e", value) > 0;
                };
                break;
            case "custom":
                filterCallback = function(key, value) {
                    return isSimpleValue(value) && findNoCase(customVal, value) > 0;
                };
                break;
        }
        
        result.filteredStruct = structFilter(arguments.targetStruct, filterCallback);
        result.originalCount = structCount(arguments.targetStruct);
        result.filteredCount = structCount(result.filteredStruct);
        result.output = formatStructFilterResult(arguments.filterType, result.originalCount, result.filteredCount, result.filteredStruct);
        
        return result;
    }
    
    /**
     * Formats the structFilter result as HTML
     * @filterType The type of filter applied
     * @originalCount Original struct key count
     * @filteredCount Filtered struct key count
     * @filteredStruct The filtered struct to display
     * @return Formatted HTML string
     */
    private string function formatStructFilterResult(required string filterType, required numeric originalCount, required numeric filteredCount, required struct filteredStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Filter type: <strong>' & encodeForHtml(arguments.filterType) & '</strong><br>';
        output &= 'Original struct keys: <strong>' & arguments.originalCount & '</strong><br>';
        output &= 'Filtered struct keys: <strong>' & arguments.filteredCount & '</strong><br>';
        output &= 'Keys removed: <strong>' & (arguments.originalCount - arguments.filteredCount) & '</strong><br><br>';
        output &= '<strong>Filtered Struct Contents:</strong>';
        output &= '</div>';
        
        if (arguments.filteredCount > 0) {
            // Loop through and display struct contents
            for (var key in arguments.filteredStruct) {
                output &= '<div class="structItemContainer">';
                output &= '<span class="structKey">' & encodeForHtml(key) & ':</span> ';
                output &= '<span class="structValue">' & encodeForHtml(arguments.filteredStruct[key]) & '</span>';
                output &= '</div>';
            }
        } else {
            output &= '<div class="structItemContainer" style="color: orange;">';
            output &= 'No keys matched the filter criteria.';
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

