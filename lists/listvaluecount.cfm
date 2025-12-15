<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListValueCount - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListValueCount</h1>
            <p>Counts the number of occurrences of a value in a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListValueCount</strong> counts how many times a specific value appears in a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Counting duplicate values in lists</li>
                        <li>Analyzing frequency of items</li>
                        <li>Data validation and quality checks</li>
                        <li>Statistical analysis of list data</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListValueCount(list, value [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Count occurrences of a value
fruits = "apple,banana,orange,apple,grape,banana";
appleCount = ListValueCount(fruits, "apple");
bananaCount = ListValueCount(fruits, "banana");

writeOutput("List: " & fruits & "<br>");
writeOutput("Apples: " & appleCount & "<br>");
writeOutput("Bananas: " & bananaCount);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Count occurrences of a value
                            fruits = "apple,banana,orange,apple,grape,banana";
                            appleCount = ListValueCount(fruits, "apple");
                            bananaCount = ListValueCount(fruits, "banana");

                            writeOutput("List: " & fruits & "<br>");
                            writeOutput("Apples: " & appleCount & "<br>");
                            writeOutput("Bananas: " & bananaCount);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Case Sensitivity</h4>
                        <div class="code-block">
// Case-sensitive counting
colors = "Red,red,Blue,blue,Green,green";
redCount = ListValueCount(colors, "red");
RedCount = ListValueCount(colors, "Red");

writeOutput("List: " & colors & "<br>");
writeOutput("'red' count: " & redCount & "<br>");
writeOutput("'Red' count: " & RedCount);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Case-sensitive counting
                            colors = "Red,red,Blue,blue,Green,green";
                            redCount = ListValueCount(colors, "red");
                            RedCount = ListValueCount(colors, "Red");

                            writeOutput("List: " & colors & "<br>");
                            writeOutput("'red' count: " & redCount & "<br>");
                            writeOutput("'Red' count: " & RedCount);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Survey Analysis</h4>
                    <div class="code-block">
// Analyze survey responses
responses = "Yes,No,Yes,Maybe,Yes,No,No,Yes,Maybe,Yes";
yesCount = ListValueCount(responses, "Yes");
noCount = ListValueCount(responses, "No");
maybeCount = ListValueCount(responses, "Maybe");

writeOutput("Survey responses: " & responses & "<br>");
writeOutput("Total responses: " & ListLen(responses) & "<br><br>");

writeOutput("<strong>Survey Results:</strong><br>");
writeOutput("Yes: " & yesCount & " (" & numberFormat(yesCount/ListLen(responses)*100, "99.9") & "%)<br>");
writeOutput("No: " & noCount & " (" & numberFormat(noCount/ListLen(responses)*100, "99.9") & "%)<br>");
writeOutput("Maybe: " & maybeCount & " (" & numberFormat(maybeCount/ListLen(responses)*100, "99.9") & "%)");
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Analyze survey responses
                        responses = "Yes,No,Yes,Maybe,Yes,No,No,Yes,Maybe,Yes";
                        yesCount = ListValueCount(responses, "Yes");
                        noCount = ListValueCount(responses, "No");
                        maybeCount = ListValueCount(responses, "Maybe");

                        writeOutput("Survey responses: " & responses & "<br>");
                        writeOutput("Total responses: " & ListLen(responses) & "<br><br>");

                        writeOutput("<strong>Survey Results:</strong><br>");
                        writeOutput("Yes: " & yesCount & " (" & numberFormat(yesCount/ListLen(responses)*100, "99.9") & "%)<br>");
                        writeOutput("No: " & noCount & " (" & numberFormat(noCount/ListLen(responses)*100, "99.9") & "%)<br>");
                        writeOutput("Maybe: " & maybeCount & " (" & numberFormat(maybeCount/ListLen(responses)*100, "99.9") & "%)");
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Error Log Analysis</h4>
                    <div class="code-block">
// Analyze error log entries
errorLog = "ERROR,INFO,WARNING,ERROR,DEBUG,ERROR,INFO,WARNING,ERROR";
errorCount = ListValueCount(errorLog, "ERROR");
warningCount = ListValueCount(errorLog, "WARNING");
infoCount = ListValueCount(errorLog, "INFO");
debugCount = ListValueCount(errorLog, "DEBUG");

writeOutput("Error log: " & errorLog & "<br>");
writeOutput("Total entries: " & ListLen(errorLog) & "<br><br>");

writeOutput("<strong>Error Analysis:</strong><br>");
writeOutput("ERROR: " & errorCount & " entries<br>");
writeOutput("WARNING: " & warningCount & " entries<br>");
writeOutput("INFO: " & infoCount & " entries<br>");
writeOutput("DEBUG: " & debugCount & " entries<br><br>");

if (errorCount > 0) {
    writeOutput("<strong>Alert:</strong> " & errorCount & " errors detected!");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Analyze error log entries
                        errorLog = "ERROR,INFO,WARNING,ERROR,DEBUG,ERROR,INFO,WARNING,ERROR";
                        errorCount = ListValueCount(errorLog, "ERROR");
                        warningCount = ListValueCount(errorLog, "WARNING");
                        infoCount = ListValueCount(errorLog, "INFO");
                        debugCount = ListValueCount(errorLog, "DEBUG");

                        writeOutput("Error log: " & errorLog & "<br>");
                        writeOutput("Total entries: " & ListLen(errorLog) & "<br><br>");

                        writeOutput("<strong>Error Analysis:</strong><br>");
                        writeOutput("ERROR: " & errorCount & " entries<br>");
                        writeOutput("WARNING: " & warningCount & " entries<br>");
                        writeOutput("INFO: " & infoCount & " entries<br>");
                        writeOutput("DEBUG: " & debugCount & " entries<br><br>");

                        if (errorCount > 0) {
                            writeOutput("<strong>Alert:</strong> " & errorCount & " errors detected!");
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