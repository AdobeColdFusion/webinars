<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListChangeDelims - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListChangeDelims</h1>
            <p>Changes the delimiter of a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListChangeDelims</strong> changes the delimiter of a list from one character to another. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Converting between different data formats</li>
                        <li>Preparing data for different systems or APIs</li>
                        <li>Changing delimiters for database operations</li>
                        <li>Data transformation and integration</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListChangeDelims(list, newDelimiter [, oldDelimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Change from comma to pipe delimiter
originalList = "apple,banana,orange,grape";
newList = ListChangeDelims(originalList, "|");
writeOutput("Original: " & originalList & "<br>");
writeOutput("New: " & newList);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Change from comma to pipe delimiter
                            originalList = "apple,banana,orange,grape";
                            newList = ListChangeDelims(originalList, "|");
                            writeOutput("Original: " & originalList & "<br>");
                            writeOutput("New: " & newList);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Custom Delimiter</h4>
                        <div class="code-block">
// Change from pipe to semicolon
fileList = "config.txt|readme.md|index.cfm|styles.css";
newFileList = ListChangeDelims(fileList, ";", "|");
writeOutput("Original: " & fileList & "<br>");
writeOutput("New: " & newFileList);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Change from pipe to semicolon
                            fileList = "config.txt|readme.md|index.cfm|styles.css";
                            newFileList = ListChangeDelims(fileList, ";", "|");
                            writeOutput("Original: " & fileList & "<br>");
                            writeOutput("New: " & newFileList);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Data Format Conversion</h4>
                    <div class="code-block">
// Convert CSV data to pipe-delimited for database
csvData = "John,Doe,john@email.com,Active,Jane,Smith,jane@email.com,Inactive";
pipeData = ListChangeDelims(csvData, "|");

writeOutput("CSV format: " & csvData & "<br>");
writeOutput("Pipe format: " & pipeData);

// Process as pairs of data
writeOutput("<br><br><strong>User Records:</strong><br>");
for (i = 1; i <= ListLen(pipeData); i += 4) {
    firstName = ListGetAt(pipeData, i);
    lastName = ListGetAt(pipeData, i + 1);
    email = ListGetAt(pipeData, i + 2);
    status = ListGetAt(pipeData, i + 3);
    
    writeOutput("User " & ((i-1)/4 + 1) & ": " & firstName & " " & lastName & " (" & email & ") - " & status & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Convert CSV data to pipe-delimited for database
                        csvData = "John,Doe,john@email.com,Active,Jane,Smith,jane@email.com,Inactive";
                        pipeData = ListChangeDelims(csvData, "|");

                        writeOutput("CSV format: " & csvData & "<br>");
                        writeOutput("Pipe format: " & pipeData);

                        // Process as pairs of data
                        writeOutput("<br><br><strong>User Records:</strong><br>");
                        for (i = 1; i <= ListLen(pipeData); i += 4) {
                            firstName = ListGetAt(pipeData, i);
                            lastName = ListGetAt(pipeData, i + 1);
                            email = ListGetAt(pipeData, i + 2);
                            status = ListGetAt(pipeData, i + 3);
                            
                            writeOutput("User " & ((i-1)/4 + 1) & ": " & firstName & " " & lastName & " (" & email & ") - " & status & "<br>");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Configuration File Processing</h4>
                    <div class="code-block">
// Convert configuration format
configData = "database=mysql;host=localhost;port=3306;username=admin";
// Convert to comma-delimited for easier processing
commaConfig = ListChangeDelims(configData, ",", ";");

writeOutput("Original config: " & configData & "<br>");
writeOutput("Converted config: " & commaConfig);

// Parse configuration
writeOutput("<br><br><strong>Configuration Settings:</strong><br>");
for (i = 1; i <= ListLen(commaConfig); i++) {
    setting = ListGetAt(commaConfig, i);
    key = ListFirst(setting, "=");
    value = ListLast(setting, "=");
    
    // Mask sensitive data
    if (key == "username" || key == "password") {
        displayValue = repeatString("*", len(value));
    } else {
        displayValue = value;
    }
    
    writeOutput(key & ": " & displayValue & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Convert configuration format
                        configData = "database=mysql;host=localhost;port=3306;username=admin";
                        // Convert to comma-delimited for easier processing
                        commaConfig = ListChangeDelims(configData, ",", ";");

                        writeOutput("Original config: " & configData & "<br>");
                        writeOutput("Converted config: " & commaConfig);

                        // Parse configuration
                        writeOutput("<br><br><strong>Configuration Settings:</strong><br>");
                        for (i = 1; i <= ListLen(commaConfig); i++) {
                            setting = ListGetAt(commaConfig, i);
                            key = ListFirst(setting, "=");
                            value = ListLast(setting, "=");
                            
                            // Mask sensitive data
                            if (key == "username" || key == "password") {
                                displayValue = repeatString("*", len(value));
                            } else {
                                displayValue = value;
                            }
                            
                            writeOutput(key & ": " & displayValue & "<br>");
                        }
                        </cfscript>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <p>Built with Adobe ColdFusion - Modern CF Script Examples</p>
        </div>
    </div>
</body>
</html> 