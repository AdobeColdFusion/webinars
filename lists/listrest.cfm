<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListRest - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListRest</h1>
            <p>Returns all elements of a list except the first</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListRest</strong> returns all elements of a list except the first one. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Processing lists after removing the first element</li>
                        <li>Queue operations where you process the head separately</li>
                        <li>Working with lists that have headers or prefixes</li>
                        <li>Iterative list processing</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListRest(list [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Get all elements except the first
fruits = "apple,banana,orange,grape";
remainingFruits = ListRest(fruits);
writeOutput("Original: " & fruits & "<br>");
writeOutput("Rest: " & remainingFruits);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Get all elements except the first
                            fruits = "apple,banana,orange,grape";
                            remainingFruits = ListRest(fruits);
                            writeOutput("Original: " & fruits & "<br>");
                            writeOutput("Rest: " & remainingFruits);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Queue Processing</h4>
                        <div class="code-block">
// Process queue items
taskQueue = "urgent:fix bug,normal:write docs,low:clean desk";
currentTask = ListFirst(taskQueue);
remainingTasks = ListRest(taskQueue);

writeOutput("Queue: " & taskQueue & "<br>");
writeOutput("Current: " & currentTask & "<br>");
writeOutput("Remaining: " & remainingTasks);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Process queue items
                            taskQueue = "urgent:fix bug,normal:write docs,low:clean desk";
                            currentTask = ListFirst(taskQueue);
                            remainingTasks = ListRest(taskQueue);

                            writeOutput("Queue: " & taskQueue & "<br>");
                            writeOutput("Current: " & currentTask & "<br>");
                            writeOutput("Remaining: " & remainingTasks);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Path Processing</h4>
                    <div class="code-block">
// Remove root directory from path
filePath = "/var/www/html/images/logo.png";
pathParts = ListToArray(filePath, "/");
rootDir = ListFirst(filePath, "/");
subPath = ListRest(filePath, "/");

writeOutput("Full path: " & filePath & "<br>");
writeOutput("Root: " & rootDir & "<br>");
writeOutput("Sub path: " & subPath);

// Reconstruct relative path
writeOutput("<br><br><strong>Path Analysis:</strong><br>");
writeOutput("Absolute path: " & filePath & "<br>");
writeOutput("Relative path: " & subPath);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Remove root directory from path
                        filePath = "/var/www/html/images/logo.png";
                        pathParts = ListToArray(filePath, "/");
                        rootDir = ListFirst(filePath, "/");
                        subPath = ListRest(filePath, "/");

                        writeOutput("Full path: " & filePath & "<br>");
                        writeOutput("Root: " & rootDir & "<br>");
                        writeOutput("Sub path: " & subPath);

                        // Reconstruct relative path
                        writeOutput("<br><br><strong>Path Analysis:</strong><br>");
                        writeOutput("Absolute path: " & filePath & "<br>");
                        writeOutput("Relative path: " & subPath);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Data Processing</h4>
                    <div class="code-block">
// Process CSV data with header
csvData = "Name,Email,Status,John,john@email.com,Active,Jane,jane@email.com,Inactive";
header = ListFirst(csvData);
dataRows = ListRest(csvData);

writeOutput("CSV data: " & csvData & "<br>");
writeOutput("Header: " & header & "<br>");
writeOutput("Data rows: " & dataRows);

// Process data rows
writeOutput("<br><br><strong>Data Records:</strong><br>");
for (i = 1; i <= ListLen(dataRows); i += 3) {
    name = ListGetAt(dataRows, i);
    email = ListGetAt(dataRows, i + 1);
    status = ListGetAt(dataRows, i + 2);
    
    writeOutput("Record " & ((i-1)/3 + 1) & ": " & name & " (" & email & ") - " & status & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Process CSV data with header
                        csvData = "Name,Email,Status,John,john@email.com,Active,Jane,jane@email.com,Inactive";
                        header = ListFirst(csvData);
                        dataRows = ListRest(csvData);

                        writeOutput("CSV data: " & csvData & "<br>");
                        writeOutput("Header: " & header & "<br>");
                        writeOutput("Data rows: " & dataRows);

                        // Process data rows
                        writeOutput("<br><br><strong>Data Records:</strong><br>");
                        for (i = 1; i <= ListLen(dataRows); i += 3) {
                            name = ListGetAt(dataRows, i);
                            email = ListGetAt(dataRows, i + 1);
                            status = ListGetAt(dataRows, i + 2);
                            
                            writeOutput("Record " & ((i-1)/3 + 1) & ": " & name & " (" & email & ") - " & status & "<br>");
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