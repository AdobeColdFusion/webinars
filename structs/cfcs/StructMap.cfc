/**
 * StructMap.cfc
 * Component for structMap() function demonstration
 */
component {
    
    /**
     * Maps/transforms a struct using a callback function and returns the result
     * @targetStruct The struct to map
     * @transformation The type of transformation to apply
     * @formData Optional form data containing customText if needed
     * @return Struct containing mapped struct and formatted output HTML
     */
    public struct function mapStruct(required struct targetStruct, required string transformation, struct formData = {}) {
        var result = {};
        var mapCallback = "";
        var customText = structKeyExists(arguments.formData, "customText") ? arguments.formData.customText : "";
        
        switch (arguments.transformation) {
            case "uppercase":
                mapCallback = function(key, value) {
                    if (isSimpleValue(value)) {
                        return uCase(value);
                    } else {
                        return value;
                    }
                };
                break;
            case "lowercase":
                mapCallback = function(key, value) {
                    if (isSimpleValue(value)) {
                        return lCase(value);
                    } else {
                        return value;
                    }
                };
                break;
            case "double":
                mapCallback = function(key, value) {
                    if (isNumeric(value)) {
                        return value * 2;
                    } else {
                        return value;
                    }
                };
                break;
            case "prefix":
                var prefixText = customText != "" ? customText : "pre_";
                mapCallback = function(key, value) {
                    return prefixText & value;
                };
                break;
            case "suffix":
                var suffixText = customText != "" ? customText : "_suf";
                mapCallback = function(key, value) {
                    return value & suffixText;
                };
                break;
            case "length":
                mapCallback = function(key, value) {
                    if (isSimpleValue(value)) {
                        return len(value);
                    } else {
                        return value;
                    }
                };
                break;
        }
        
        result.mappedStruct = structMap(arguments.targetStruct, mapCallback);
        result.originalCount = structCount(arguments.targetStruct);
        result.mappedCount = structCount(result.mappedStruct);
        result.transformation = arguments.transformation;
        result.output = formatStructMapResult(arguments.transformation, result.originalCount, result.mappedCount, result.mappedStruct, arguments.targetStruct);
        
        return result;
    }
    
    /**
     * Formats the structMap result as HTML
     * @transformation The transformation applied
     * @originalCount Original struct key count
     * @mappedCount Mapped struct key count
     * @mappedStruct The mapped struct to display
     * @originalStruct The original struct for comparison
     * @return Formatted HTML string
     */
    private string function formatStructMapResult(required string transformation, required numeric originalCount, required numeric mappedCount, required struct mappedStruct, required struct originalStruct) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Transformation: <strong>' & encodeForHtml(arguments.transformation) & '</strong><br>';
        output &= 'Original struct keys: <strong>' & arguments.originalCount & '</strong><br>';
        output &= 'Mapped struct keys: <strong>' & arguments.mappedCount & '</strong><br><br>';
        output &= '<strong>Transformed Struct Contents:</strong>';
        output &= '</div>';
        
        // Loop through and display mapped struct contents with original values
        for (var key in arguments.mappedStruct) {
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & ':</span> ';
            output &= '<span class="structValue">' & encodeForHtml(arguments.mappedStruct[key]) & '</span>';
            output &= ' <span style="color: ##666;">(was: ' & encodeForHtml(arguments.originalStruct[key]) & ')</span>';
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

