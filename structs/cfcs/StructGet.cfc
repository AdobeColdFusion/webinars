/**
 * StructGet.cfc
 * Component for structGet() function demonstration
 */
component {
    
    /**
     * Gets a value from a struct using a path string
     * @path The path to the value (e.g., "session.myStruct.keyName")
     * @return Struct containing result and formatted output HTML
     */
    public struct function getByPath(required string path) {
        var result = {};
        var getResult = "";
        var errorOccurred = false;
        var errorMessage = "";
        var valueType = "";
        
        try {
            getResult = structGet(arguments.path);
            valueType = getMetadata(getResult).getName();
            
            result.getResult = getResult;
            result.valueType = valueType;
            result.output = formatStructGetResult(arguments.path, getResult, valueType);
        } catch (any e) {
            errorOccurred = true;
            errorMessage = e.message;
            result.output = formatStructGetError(arguments.path, errorMessage);
        }
        
        return result;
    }
    
    /**
     * Formats the structGet result as HTML
     * @path The path that was accessed
     * @getResult The value retrieved
     * @valueType The type of the value
     * @return Formatted HTML string
     */
    private string function formatStructGetResult(required string path, required any getResult, required string valueType) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Path: <strong>"' & encodeForHtml(arguments.path) & '"</strong><br>';
        output &= 'Value retrieved: <strong>' & encodeForHtml(arguments.getResult) & '</strong><br>';
        output &= 'Value type: <strong>' & encodeForHtml(arguments.valueType) & '</strong>';
        output &= '</div>';
        return output;
    }
    
    /**
     * Formats the structGet error as HTML
     * @path The path that was accessed
     * @errorMessage The error message
     * @return Formatted HTML string
     */
    private string function formatStructGetError(required string path, required string errorMessage) {
        var output = '<div class="structItemContainer" style="color: red;">';
        output &= 'Error accessing path "<strong>' & encodeForHtml(arguments.path) & '</strong>":<br>';
        output &= '<strong>' & encodeForHtml(arguments.errorMessage) & '</strong><br><br>';
        output &= '<span style="color: orange;">Try: session.myStruct.keyName</span>';
        output &= '</div>';
        return output;
    }
}

