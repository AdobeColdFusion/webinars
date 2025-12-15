<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListLast - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListLast</h1>
            <p>Returns the last element of a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListLast</strong> returns the last element of a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Getting the most recent or latest item from a list</li>
                        <li>Extracting file extensions from file paths</li>
                        <li>Getting the last item in a stack (LIFO)</li>
                        <li>Processing lists from the end</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListLast(list [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Get last element
fruits = "apple,banana,orange,grape";
lastFruit = ListLast(fruits);
writeOutput("List: " & fruits & "<br>");
writeOutput("Last item: " & lastFruit);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Get last element
                            fruits = "apple,banana,orange,grape";
                            lastFruit = ListLast(fruits);
                            writeOutput("List: " & fruits & "<br>");
                            writeOutput("Last item: " & lastFruit);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>File Extension Extraction</h4>
                        <div class="code-block">
// Extract file extension
fileName = "document.report.final.pdf";
extension = ListLast(fileName, ".");
writeOutput("File name: " & fileName & "<br>");
writeOutput("Extension: " & extension);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Extract file extension
                            fileName = "document.report.final.pdf";
                            extension = ListLast(fileName, ".");
                            writeOutput("File name: " & fileName & "<br>");
                            writeOutput("Extension: " & extension);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Stack Operations</h4>
                    <div class="code-block">
// Process items from a stack (LIFO)
undoStack = "action1,action2,action3,action4";
lastAction = ListLast(undoStack);

writeOutput("Undo stack: " & undoStack & "<br>");
writeOutput("Last action: " & lastAction);

// Simulate undo operation
remainingActions = ListDeleteAt(undoStack, ListLen(undoStack));
writeOutput("<br><br><strong>After Undo:</strong><br>");
writeOutput("Remaining actions: " & remainingActions);
writeOutput("<br>Next undo will remove: " & ListLast(remainingActions));
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Process items from a stack (LIFO)
                        undoStack = "action1,action2,action3,action4";
                        lastAction = ListLast(undoStack);

                        writeOutput("Undo stack: " & undoStack & "<br>");
                        writeOutput("Last action: " & lastAction);

                        // Simulate undo operation
                        remainingActions = ListDeleteAt(undoStack, ListLen(undoStack));
                        writeOutput("<br><br><strong>After Undo:</strong><br>");
                        writeOutput("Remaining actions: " & remainingActions);
                        writeOutput("<br>Next undo will remove: " & ListLast(remainingActions));
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Path Processing</h4>
                    <div class="code-block">
// Extract filename from full path
filePath = "/var/www/html/images/logo.png";
fileName = ListLast(filePath, "/");

writeOutput("Full path: " & filePath & "<br>");
writeOutput("File name: " & fileName);

// Extract extension
fileExtension = ListLast(fileName, ".");
writeOutput("<br><br><strong>File Analysis:</strong><br>");
writeOutput("File name: " & fileName & "<br>");
writeOutput("Extension: " & fileExtension);

// Check if it's an image file
imageExtensions = "jpg,jpeg,png,gif,bmp";
if (ListFind(imageExtensions, fileExtension) > 0) {
    writeOutput("<br>✅ This is an image file");
} else {
    writeOutput("<br>❌ This is not an image file");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Extract filename from full path
                        filePath = "/var/www/html/images/logo.png";
                        fileName = ListLast(filePath, "/");

                        writeOutput("Full path: " & filePath & "<br>");
                        writeOutput("File name: " & fileName);

                        // Extract extension
                        fileExtension = ListLast(fileName, ".");
                        writeOutput("<br><br><strong>File Analysis:</strong><br>");
                        writeOutput("File name: " & fileName & "<br>");
                        writeOutput("Extension: " & fileExtension);

                        // Check if it's an image file
                        imageExtensions = "jpg,jpeg,png,gif,bmp";
                        if (ListFind(imageExtensions, fileExtension) > 0) {
                            writeOutput("<br>✅ This is an image file");
                        } else {
                            writeOutput("<br>❌ This is not an image file");
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