<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListQualify - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListQualify</h1>
            <p>Adds a qualifier (such as quotes) to each element in a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListQualify</strong> adds a qualifier (such as quotes or brackets) to each element in a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Preparing lists for SQL IN clauses</li>
                        <li>Formatting data for CSV or JSON output</li>
                        <li>Adding markup or wrappers to list items</li>
                        <li>Escaping or quoting user input</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListQualify(list, qualifier [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Add double quotes to each item
originalList = "apple,banana,orange,grape";
qualifiedList = ListQualify(originalList, '"');
writeOutput("Original: " & originalList & "<br>");
writeOutput("Qualified: " & qualifiedList);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Add double quotes to each item
                            originalList = "apple,banana,orange,grape";
                            qualifiedList = ListQualify(originalList, '"');
                            writeOutput("Original: " & originalList & "<br>");
                            writeOutput("Qualified: " & qualifiedList);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Custom Qualifier and Delimiter</h4>
                        <div class="code-block">
// Add brackets to each item with pipe delimiter
fileList = "config.txt|readme.md|index.cfm|styles.css";
qualifiedFiles = ListQualify(fileList, '[', '|');
writeOutput("Original: " & fileList & "<br>");
writeOutput("Qualified: " & qualifiedFiles);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Add brackets to each item with pipe delimiter
                            fileList = "config.txt|readme.md|index.cfm|styles.css";
                            qualifiedFiles = ListQualify(fileList, '[', '|');
                            writeOutput("Original: " & fileList & "<br>");
                            writeOutput("Qualified: " & qualifiedFiles);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: SQL IN Clause Preparation</h4>
                    <div class="code-block">
// Prepare list for SQL IN clause
usernames = "john,jane,bob,alice";
qualifiedUsernames = ListQualify(usernames, "'");

writeOutput("Usernames: " & usernames & "<br>");
writeOutput("Qualified for SQL: " & qualifiedUsernames);

// Example SQL
writeOutput("<br><br><strong>SQL Example:</strong><br>");
writeOutput("SELECT * FROM users WHERE username IN (" & qualifiedUsernames & ")");
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Prepare list for SQL IN clause
                        usernames = "john,jane,bob,alice";
                        qualifiedUsernames = ListQualify(usernames, "'");

                        writeOutput("Usernames: " & usernames & "<br>");
                        writeOutput("Qualified for SQL: " & qualifiedUsernames);

                        // Example SQL
                        writeOutput("<br><br><strong>SQL Example:</strong><br>");
                        writeOutput("SELECT * FROM users WHERE username IN (" & qualifiedUsernames & ")");
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: CSV Export</h4>
                    <div class="code-block">
// Qualify values for CSV export
csvData = "apple,banana,orange,grape";
qualifiedCSV = ListQualify(csvData, '"');

writeOutput("CSV data: " & csvData & "<br>");
writeOutput("Qualified CSV: " & qualifiedCSV);

// Display as CSV row
writeOutput("<br><strong>CSV Row:</strong><br>");
writeOutput(qualifiedCSV);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Qualify values for CSV export
                        csvData = "apple,banana,orange,grape";
                        qualifiedCSV = ListQualify(csvData, '"');

                        writeOutput("CSV data: " & csvData & "<br>");
                        writeOutput("Qualified CSV: " & qualifiedCSV);

                        // Display as CSV row
                        writeOutput("<br><strong>CSV Row:</strong><br>");
                        writeOutput(qualifiedCSV);
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