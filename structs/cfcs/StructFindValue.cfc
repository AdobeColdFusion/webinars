/**
 * StructFindValue.cfc
 * Component for structFindValue() function demonstration
 */
component {
    
    /**
     * Finds values matching a pattern in a struct
     * @targetStruct The struct to search
     * @valuePattern The pattern to search for
     * @scope The scope of search (one or all)
     * @return Struct containing results and formatted output HTML
     */
    public struct function findValues(required struct targetStruct, required string valuePattern, string scope = "all") {
        var result = {};
        var results = structFindValue(arguments.targetStruct, arguments.valuePattern, arguments.scope);
        
        result.matches = results;
        result.matchCount = arrayLen(results);
        result.output = formatStructFindValueResult(arguments.valuePattern, arguments.scope, result.matchCount, results);
        
        return result;
    }
    
    /**
     * Formats the structFindValue result as HTML
     * @valuePattern The pattern searched
     * @scope The scope used
     * @matchCount The number of matches found
     * @matches Array of match structs
     * @return Formatted HTML string
     */
    private string function formatStructFindValueResult(required string valuePattern, required string scope, required numeric matchCount, required array matches) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Pattern searched: <strong>"' & encodeForHtml(arguments.valuePattern) & '"</strong><br>';
        output &= 'Scope: <strong>' & encodeForHtml(arguments.scope) & '</strong><br>';
        output &= 'Matches found: <strong>' & arguments.matchCount & '</strong><br><br>';
        
        if (arguments.matchCount > 0) {
            output &= '<strong>Match Details:</strong>';
            
            for (var i = 1; i <= arrayLen(arguments.matches); i++) {
                var match = arguments.matches[i];
                // structFindValue returns structs with uppercase keys: KEY, VALUE, PATH
                var matchKey = "";
                var matchValue = "";
                var matchPath = "";
                
                if (structKeyExists(match, "KEY")) {
                    matchKey = match.KEY;
                } else if (structKeyExists(match, "key")) {
                    matchKey = match.key;
                }
                
                if (structKeyExists(match, "VALUE")) {
                    matchValue = match.VALUE;
                } else if (structKeyExists(match, "value")) {
                    matchValue = match.value;
                }
                
                if (structKeyExists(match, "PATH")) {
                    matchPath = match.PATH;
                } else if (structKeyExists(match, "path")) {
                    matchPath = match.path;
                }
                
                output &= '<div class="structItemContainer">';
                output &= 'Key: <span class="structKey">' & encodeForHtml(matchKey) & '</span><br>';
                output &= 'Value: <span class="structValue">' & encodeForHtml(matchValue) & '</span><br>';
                output &= 'Path: <span style="color: ##666;">' & encodeForHtml(matchPath) & '</span>';
                output &= '</div>';
            }
        } else {
            output &= '<span style="color: orange;">No values found matching the pattern</span>';
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

