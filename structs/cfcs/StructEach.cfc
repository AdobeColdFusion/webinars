/**
 * StructEach.cfc
 * Component for structEach() function demonstration
 */
component {
    
    /**
     * Iterates over a struct with a callback function and returns results
     * @targetStruct The struct to iterate over
     * @operation The type of operation to perform
     * @formData Optional form data for custom operations
     * @return Struct containing results and formatted output HTML
     */
    public struct function eachStruct(required struct targetStruct, required string operation, struct formData = {}) {
        var result = {};
        var state = {
            results = [],
            sumTotal = 0,
            pairCount = 0
        };
        var callback = "";
        
        switch (arguments.operation) {
            case "display":
                callback = function(key, value) {
                    arrayAppend(state.results, "Key: " & key & " = Value: " & value);
                };
                break;
            case "uppercase":
                callback = function(key, value) {
                    if (isSimpleValue(value)) {
                        arrayAppend(state.results, key & " -> " & uCase(value));
                    } else {
                        arrayAppend(state.results, key & " -> " & value);
                    }
                };
                break;
            case "length":
                callback = function(key, value) {
                    if (isSimpleValue(value)) {
                        arrayAppend(state.results, key & " -> Length: " & len(value));
                    } else {
                        arrayAppend(state.results, key & " -> (not a string)");
                    }
                };
                break;
            case "numeric":
                callback = function(key, value) {
                    if (isNumeric(value)) {
                        arrayAppend(state.results, key & " -> " & value & " (numeric)");
                    }
                };
                break;
            case "sum":
                callback = function(key, value) {
                    if (isNumeric(value)) {
                        state.sumTotal = state.sumTotal + value;
                        arrayAppend(state.results, key & " -> " & value);
                    }
                };
                break;
            case "count":
                callback = function(key, value) {
                    state.pairCount = state.pairCount + 1;
                    arrayAppend(state.results, "Pair #state.pairCount#: " & key & " = " & value);
                };
                break;
        }
        
        structEach(arguments.targetStruct, callback);
        
        result.results = state.results;
        result.sumTotal = state.sumTotal;
        result.pairCount = state.pairCount;
        result.output = formatStructEachResult(arguments.operation, result.sumTotal, result.pairCount, result.results);
        
        return result;
    }
    
    /**
     * Formats the structEach result as HTML
     * @operation The operation performed
     * @sumTotal The sum total (if operation was "sum")
     * @pairCount The pair count (if operation was "count")
     * @results Array of result strings
     * @return Formatted HTML string
     */
    private string function formatStructEachResult(required string operation, required numeric sumTotal, required numeric pairCount, required array results) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Operation: <strong>' & encodeForHtml(arguments.operation) & '</strong><br>';
        
        if (arguments.operation == "sum") {
            output &= 'Total sum: <strong>' & arguments.sumTotal & '</strong><br>';
        } else if (arguments.operation == "count") {
            output &= 'Total pairs: <strong>' & arguments.pairCount & '</strong><br>';
        }
        
        output &= '<br><strong>Results:</strong>';
        output &= '</div>';
        
        // Loop through and display results
        for (var resultItem in arguments.results) {
            output &= '<div class="structItemContainer">';
            output &= encodeForHtml(resultItem);
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

