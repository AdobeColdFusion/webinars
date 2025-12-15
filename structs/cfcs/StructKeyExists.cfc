/**
 * StructKeyExists.cfc
 * Component for structKeyExists() function demonstration
 */
component {
    
    /**
     * Checks if a key exists in a struct
     * @targetStruct The struct to check
     * @keyToCheck The key to check for
     * @return Struct containing keyExists result and formatted output HTML
     */
    public struct function checkKeyExists(required struct targetStruct, required string keyToCheck) {
        var result = {};
        result.keyExists = structKeyExists(arguments.targetStruct, arguments.keyToCheck);
        result.value = "";
        result.availableKeys = "";
        
        if (result.keyExists) {
            result.value = arguments.targetStruct[arguments.keyToCheck];
        } else {
            result.availableKeys = structKeyList(arguments.targetStruct);
        }
        
        result.output = formatStructKeyExistsResult(arguments.keyToCheck, result.keyExists, result.value, result.availableKeys, arguments.targetStruct);
        
        return result;
    }
    
    /**
     * Formats the structKeyExists result as HTML
     * @keyToCheck The key that was checked
     * @keyExists Whether the key exists
     * @value The value if key exists
     * @availableKeys The list of available keys if key doesn't exist
     * @targetStruct The struct being checked
     * @return Formatted HTML string
     */
    private string function formatStructKeyExistsResult(required string keyToCheck, required boolean keyExists, any value = "", string availableKeys = "", required struct targetStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Checking for key: <strong>"' & encodeForHtml(arguments.keyToCheck) & '"</strong><br>';
        output &= 'StructKeyExists() result: <strong>' & arguments.keyExists & '</strong><br>';
        
        if (arguments.keyExists) {
            output &= '<span style="color: green;">✓ Key exists! Value: <strong>' & encodeForHtml(arguments.value) & '</strong></span>';
        } else {
            output &= '<span style="color: red;">✗ Key does NOT exist in the struct</span><br>';
            output &= '<span style="color: orange;">Available keys: ' & encodeForHtml(arguments.availableKeys) & '</span>';
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

