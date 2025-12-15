/**
 * StructFind.cfc
 * Component for structFind() function demonstration
 */
component {
    
    /**
     * Finds a value in a struct by key
     * @targetStruct The struct to search
     * @findKey The key to find
     * @defaultValue Optional default value if key doesn't exist
     * @return Struct containing result and formatted output HTML
     */
    public struct function findInStruct(required struct targetStruct, required string findKey, string defaultValue = "") {
        var result = {};
        var hasDefault = arguments.defaultValue != "";
        var usedDefault = false;
        var findResult = "";
        var errorOccurred = false;
        var errorMessage = "";
        
        try {
            if (hasDefault) {
                findResult = structFind(arguments.targetStruct, arguments.findKey, arguments.defaultValue);
                usedDefault = !structKeyExists(arguments.targetStruct, arguments.findKey);
            } else {
                findResult = structFind(arguments.targetStruct, arguments.findKey);
            }
            
            result.findResult = findResult;
            result.usedDefault = usedDefault;
            result.hasDefault = hasDefault;
            result.output = formatStructFindResult(arguments.findKey, findResult, hasDefault, arguments.defaultValue, usedDefault);
        } catch (any e) {
            errorOccurred = true;
            errorMessage = e.message;
            result.output = formatStructFindError(arguments.findKey, errorMessage);
        }
        
        return result;
    }
    
    /**
     * Formats the structFind result as HTML
     * @findKey The key that was searched
     * @findResult The value found
     * @hasDefault Whether a default value was provided
     * @defaultValue The default value provided
     * @usedDefault Whether the default value was used
     * @return Formatted HTML string
     */
    private string function formatStructFindResult(required string findKey, required any findResult, required boolean hasDefault, string defaultValue = "", required boolean usedDefault) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Key searched: <strong>"' & encodeForHtml(arguments.findKey) & '"</strong><br>';
        output &= 'Value found: <strong>' & encodeForHtml(arguments.findResult) & '</strong><br>';
        
        if (arguments.hasDefault) {
            output &= 'Default value provided: <strong>"' & encodeForHtml(arguments.defaultValue) & '"</strong><br>';
            output &= 'Used default: <strong>' & arguments.usedDefault & '</strong>';
        }
        
        if (arguments.usedDefault) {
            output &= '<span style="color: orange;">⚠ Key not found, returned default value</span>';
        } else {
            output &= '<span style="color: green;">✓ Key found successfully!</span>';
        }
        
        output &= '</div>';
        return output;
    }
    
    /**
     * Formats the structFind error as HTML
     * @findKey The key that was searched
     * @errorMessage The error message
     * @return Formatted HTML string
     */
    private string function formatStructFindError(required string findKey, required string errorMessage) {
        var output = '<div class="structItemContainer" style="color: red;">';
        output &= 'Error: <strong>' & encodeForHtml(arguments.errorMessage) & '</strong><br>';
        output &= 'Key "<strong>' & encodeForHtml(arguments.findKey) & '</strong>" does not exist in the struct.<br>';
        output &= '<span style="color: orange;">Tip: Provide a default value to avoid errors</span>';
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

