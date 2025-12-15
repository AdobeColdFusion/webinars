/**
 * StructReduce.cfc
 * Component for structReduce() function demonstration
 */
component {
    
    /**
     * Reduces a struct using a callback function and returns the result
     * @targetStruct The struct to reduce
     * @operation The type of reduction operation to perform
     * @formData Optional form data containing initialValue if provided
     * @return Struct containing reduced result and formatted output HTML
     */
    public struct function reduceStruct(required struct targetStruct, required string operation, struct formData = {}) {
        var result = {};
        var hasInitial = structKeyExists(arguments.formData, "initialValue") && arguments.formData.initialValue != "";
        var reduceCallback = "";
        var initialVal = "";
        var reducedResult = "";
        
        switch (arguments.operation) {
            case "sum":
                reduceCallback = function(accumulator, key, value) {
                    if (isNumeric(value)) {
                        return accumulator + value;
                    } else {
                        return accumulator;
                    }
                };
                initialVal = hasInitial && isNumeric(arguments.formData.initialValue) ? arguments.formData.initialValue : 0;
                break;
            case "concat":
                reduceCallback = function(accumulator, key, value) {
                    if (isSimpleValue(value)) {
                        // If accumulator is NULL or empty, start with just the value
                        if (isNull(accumulator) || accumulator == "") {
                            return value;
                        } else {
                            return accumulator & value;
                        }
                    } else {
                        return accumulator;
                    }
                };
                // Only set initialVal if explicitly provided, otherwise let structReduce handle it
                initialVal = hasInitial ? arguments.formData.initialValue : "";
                break;
            case "max":
                reduceCallback = function(accumulator, key, value) {
                    if (isNumeric(value)) {
                        return max(accumulator, value);
                    } else {
                        return accumulator;
                    }
                };
                initialVal = hasInitial && isNumeric(arguments.formData.initialValue) ? arguments.formData.initialValue : -999999;
                break;
            case "min":
                reduceCallback = function(accumulator, key, value) {
                    if (isNumeric(value)) {
                        return min(accumulator, value);
                    } else {
                        return accumulator;
                    }
                };
                initialVal = hasInitial && isNumeric(arguments.formData.initialValue) ? arguments.formData.initialValue : 999999;
                break;
            case "count":
                reduceCallback = function(accumulator, key, value) {
                    return accumulator + 1;
                };
                initialVal = hasInitial && isNumeric(arguments.formData.initialValue) ? arguments.formData.initialValue : 0;
                break;
            case "keyList":
                reduceCallback = function(accumulator, key, value) {
                    if (len(accumulator) == 0) {
                        return key;
                    } else {
                        return accumulator & ", " & key;
                    }
                };
                initialVal = hasInitial ? arguments.formData.initialValue : "";
                break;
        }
        
        if (hasInitial) {
            reducedResult = structReduce(arguments.targetStruct, reduceCallback, initialVal);
        } else {
            reducedResult = structReduce(arguments.targetStruct, reduceCallback);
        }
        
        result.reducedResult = reducedResult;
        result.operation = arguments.operation;
        result.hasInitial = hasInitial;
        result.initialVal = initialVal;
        result.output = formatStructReduceResult(arguments.operation, hasInitial, initialVal, reducedResult);
        
        return result;
    }
    
    /**
     * Formats the structReduce result as HTML
     * @operation The operation performed
     * @hasInitial Whether an initial value was provided
     * @initialVal The initial value used
     * @reducedResult The reduced result
     * @return Formatted HTML string
     */
    private string function formatStructReduceResult(required string operation, required boolean hasInitial, required any initialVal, required any reducedResult) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Operation: <strong>' & encodeForHtml(arguments.operation) & '</strong><br>';
        
        if (arguments.hasInitial) {
            output &= 'Initial value: <strong>' & encodeForHtml(arguments.initialVal) & '</strong><br>';
        }
        
        output &= 'Reduced result: <strong>' & encodeForHtml(arguments.reducedResult) & '</strong><br>';
        output &= 'Result type: <strong>' & getMetadata(arguments.reducedResult).getName() & '</strong>';
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

