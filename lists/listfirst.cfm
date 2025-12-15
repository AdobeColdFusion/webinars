<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListFirst - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListFirst</h1>
            <p>Returns the first element of a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListFirst</strong> returns the first element of a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Getting the first item from a list</li>
                        <li>Processing lists one element at a time</li>
                        <li>Extracting headers or titles from data</li>
                        <li>Queue-like operations (FIFO)</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListFirst(list [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Get first element
fruits = "apple,banana,orange,grape";
firstFruit = ListFirst(fruits);
writeOutput("List: " & fruits & "<br>");
writeOutput("First item: " & firstFruit);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Get first element
                            fruits = "apple,banana,orange,grape";
                            firstFruit = ListFirst(fruits);
                            writeOutput("List: " & fruits & "<br>");
                            writeOutput("First item: " & firstFruit);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Custom Delimiter</h4>
                        <div class="code-block">
// Get first element with pipe delimiter
fileList = "config.txt|readme.md|index.cfm|styles.css";
firstFile = ListFirst(fileList, "|");
writeOutput("File list: " & fileList & "<br>");
writeOutput("First file: " & firstFile);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Get first element with pipe delimiter
                            fileList = "config.txt|readme.md|index.cfm|styles.css";
                            firstFile = ListFirst(fileList, "|");
                            writeOutput("File list: " & fileList & "<br>");
                            writeOutput("First file: " & firstFile);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Queue Processing</h4>
                    <div class="code-block">
// Process items from a queue
taskQueue = "urgent:fix bug,normal:write docs,low:clean desk";
currentTask = ListFirst(taskQueue);

writeOutput("Task queue: " & taskQueue & "<br>");
writeOutput("Current task: " & currentTask);

// Extract priority and description
priority = ListFirst(currentTask, ":");
description = ListLast(currentTask, ":");

writeOutput("<br><br><strong>Processing Task:</strong><br>");
writeOutput("Priority: " & priority & "<br>");
writeOutput("Description: " & description);

// Remove processed task (simulate queue processing)
remainingTasks = ListRest(taskQueue);
writeOutput("<br><br>Remaining tasks: " & remainingTasks);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Process items from a queue
                        taskQueue = "urgent:fix bug,normal:write docs,low:clean desk";
                        currentTask = ListFirst(taskQueue);

                        writeOutput("Task queue: " & taskQueue & "<br>");
                        writeOutput("Current task: " & currentTask);

                        // Extract priority and description
                        priority = ListFirst(currentTask, ":");
                        description = ListLast(currentTask, ":");

                        writeOutput("<br><br><strong>Processing Task:</strong><br>");
                        writeOutput("Priority: " & priority & "<br>");
                        writeOutput("Description: " & description);

                        // Remove processed task (simulate queue processing)
                        remainingTasks = ListRest(taskQueue);
                        writeOutput("<br><br>Remaining tasks: " & remainingTasks);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Path Processing</h4>
                    <div class="code-block">
// Extract directory from file path
filePath = "/var/www/html/images/logo.png";
pathParts = ListToArray(filePath, "/");
rootDir = ListFirst(filePath, "/");

writeOutput("File path: " & filePath & "<br>");
writeOutput("Root directory: " & rootDir);

// Get first non-empty part
if (len(rootDir) == 0) {
    // Skip empty first element
    firstPart = ListGetAt(pathParts, 2);
} else {
    firstPart = rootDir;
}

writeOutput("<br><br><strong>Path Analysis:</strong><br>");
writeOutput("First directory: " & firstPart & "<br>");
writeOutput("Total path parts: " & arrayLen(pathParts));
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Extract directory from file path
                        filePath = "/var/www/html/images/logo.png";
                        pathParts = ListToArray(filePath, "/");
                        rootDir = ListFirst(filePath, "/");

                        writeOutput("File path: " & filePath & "<br>");
                        writeOutput("Root directory: " & rootDir);

                        // Get first non-empty part
                        if (len(rootDir) == 0) {
                            // Skip empty first element
                            firstPart = ListGetAt(pathParts, 2);
                        } else {
                            firstPart = rootDir;
                        }

                        writeOutput("<br><br><strong>Path Analysis:</strong><br>");
                        writeOutput("First directory: " & firstPart & "<br>");
                        writeOutput("Total path parts: " & arrayLen(pathParts));
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