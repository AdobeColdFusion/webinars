/**
 * StructInsert.cfc
 * Component for structInsert() function demonstration
 */
component {
    
    /**
     * Ensures the session struct exists, creating it if necessary
     * @return The session struct
     */
    public struct function ensureSessionStruct() {
        if (!structKeyExists(session, "myStruct")) {
            session.myStruct = {};
        }
        return session.myStruct;
    }
    
    /**
     * Inserts a key-value pair into a struct
     * @targetStruct The struct to insert into (will be modified)
     * @insertKey The key to insert
     * @insertValue The value to insert
     * @allowOverwrite Whether to allow overwriting existing keys
     * @return Struct containing insertion result and formatted output HTML
     */
    public struct function insertKey(required struct targetStruct, required string insertKey, required any insertValue, boolean allowOverwrite = false) {
        var result = {};
        result.keyExists = structKeyExists(arguments.targetStruct, arguments.insertKey);
        result.insertResult = structInsert(arguments.targetStruct, arguments.insertKey, arguments.insertValue, arguments.allowOverwrite);
        result.output = formatStructInsertResult(arguments.insertKey, arguments.insertValue, result.keyExists, arguments.allowOverwrite, result.insertResult, arguments.targetStruct);
        
        return result;
    }
    
    /**
     * Formats the structInsert result as HTML
     * @insertKey The key that was inserted
     * @insertValue The value that was inserted
     * @keyExists Whether the key existed before
     * @allowOverwrite Whether overwrite was allowed
     * @insertResult The result from structInsert()
     * @updatedStruct The updated struct to display
     * @return Formatted HTML string
     */
    private string function formatStructInsertResult(required string insertKey, required any insertValue, required boolean keyExists, required boolean allowOverwrite, required boolean insertResult, required struct updatedStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Key: <strong>"' & encodeForHtml(arguments.insertKey) & '"</strong><br>';
        output &= 'Value: <strong>"' & encodeForHtml(arguments.insertValue) & '"</strong><br>';
        output &= 'Key existed before: <strong>' & arguments.keyExists & '</strong><br>';
        output &= 'Allow overwrite: <strong>' & arguments.allowOverwrite & '</strong><br>';
        output &= 'StructInsert() result: <strong>' & arguments.insertResult & '</strong><br>';
        
        if (arguments.insertResult) {
            output &= '<span style="color: green;">✓ Successfully inserted/updated!</span>';
        } else {
            output &= '<span style="color: red;">✗ Failed - key already exists and overwrite not allowed</span>';
        }
        
        output &= '<br><br><strong>Updated struct contents:</strong>';
        output &= '</div>';
        
        // Loop through and display struct contents
        for (var key in arguments.updatedStruct) {
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & ':</span> ';
            output &= '<span class="structValue">' & encodeForHtml(arguments.updatedStruct[key]) & '</span>';
            output &= '</div>';
        }
        
        return output;
    }
}

