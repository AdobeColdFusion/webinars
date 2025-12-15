/**
 * StructSetMetadata.cfc
 * Component for structSetMetadata() function demonstration
 */
component {
    
    /**
     * Sets metadata on a struct and returns the result
     * @targetStruct The struct to set metadata on (will be modified)
     * @metadataType The type of metadata to create
     * @return Struct containing metadata and formatted output HTML
     */
    public struct function setMetadataForStruct(required struct targetStruct, required string metadataType) {
        var result = {};
        var newMetadata = {};
        
        switch (arguments.metadataType) {
            case "custom":
                newMetadata["description"] = "Custom metadata for struct";
                newMetadata["created"] = now();
                newMetadata["type"] = "user-defined";
                break;
            case "author":
                newMetadata["author"] = "Webinar Demo";
                newMetadata["email"] = "demo@example.com";
                newMetadata["date"] = dateFormat(now());
                break;
            case "timestamp":
                newMetadata["created"] = now();
                newMetadata["modified"] = now();
                newMetadata["timezone"] = getTimeZone();
                break;
            case "version":
                newMetadata["version"] = "1.0.0";
                newMetadata["build"] = "2025";
                newMetadata["status"] = "active";
                break;
        }
        
        structSetMetadata(arguments.targetStruct, newMetadata);
        var retrievedMetadata = structGetMetadata(arguments.targetStruct);
        
        result.metadata = retrievedMetadata;
        result.metadataType = arguments.metadataType;
        result.output = formatStructSetMetadataResult(arguments.metadataType, retrievedMetadata);
        
        return result;
    }
    
    /**
     * Formats the structSetMetadata result as HTML
     * @metadataType The type of metadata set
     * @metadata The retrieved metadata struct
     * @return Formatted HTML string
     */
    private string function formatStructSetMetadataResult(required string metadataType, required struct metadata) {
        var output = '<div class="structItemContainer" style="color: purple; font-weight: bold;">';
        output &= 'Metadata type: <strong>' & encodeForHtml(arguments.metadataType) & '</strong><br>';
        output &= 'Metadata set successfully!<br>';
        output &= 'Metadata keys: <strong>' & structCount(arguments.metadata) & '</strong><br><br>';
        output &= '<strong>Retrieved Metadata:</strong>';
        output &= '</div>';
        
        // Loop through and display metadata contents
        for (var key in arguments.metadata) {
            var value = arguments.metadata[key];
            var displayValue = "";
            
            // Handle different value types
            if (isDate(value)) {
                displayValue = dateTimeFormat(value);
            } else if (isArray(value)) {
                // Format array as comma-separated list
                var arrayItems = [];
                for (var i = 1; i <= arrayLen(value); i++) {
                    var item = value[i];
                    if (isSimpleValue(item)) {
                        arrayAppend(arrayItems, item);
                    } else if (isDate(item)) {
                        arrayAppend(arrayItems, dateTimeFormat(item));
                    } else {
                        arrayAppend(arrayItems, "[Complex]");
                    }
                }
                displayValue = arrayToList(arrayItems, ", ");
            } else if (isStruct(value)) {
                // Format struct as key-value pairs
                var structItems = [];
                for (var structKey in value) {
                    var structVal = value[structKey];
                    var structValStr = "";
                    if (isSimpleValue(structVal)) {
                        structValStr = structVal;
                    } else if (isDate(structVal)) {
                        structValStr = dateTimeFormat(structVal);
                    } else {
                        structValStr = "[Complex]";
                    }
                    arrayAppend(structItems, structKey & ": " & structValStr);
                }
                displayValue = arrayToList(structItems, "; ");
            } else if (isSimpleValue(value)) {
                displayValue = value;
            } else {
                displayValue = "[Complex Object: " & getMetadata(value).getName() & "]";
            }
            
            output &= '<div class="structItemContainer">';
            output &= '<span class="structKey">' & encodeForHtml(key) & ':</span> ';
            output &= '<span class="structValue">' & encodeForHtml(displayValue) & '</span>';
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

