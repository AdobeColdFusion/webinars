<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListValueCountNoCase - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListValueCountNoCase</h1>
            <p>Counts the number of occurrences of a value in a list (case-insensitive)</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListValueCountNoCase</strong> counts how many times a specific value appears in a list, ignoring case differences. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Counting values regardless of capitalization</li>
                        <li>Analyzing user input with mixed case</li>
                        <li>Data normalization and cleaning</li>
                        <li>Case-insensitive data analysis</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListValueCountNoCase(list, value [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Count occurrences case-insensitively
fruits = "Apple,banana,ORANGE,apple,GRAPE,banana";
appleCount = ListValueCountNoCase(fruits, "apple");
bananaCount = ListValueCountNoCase(fruits, "BANANA");

writeOutput("List: " & fruits & "<br>");
writeOutput("Apples (any case): " & appleCount & "<br>");
writeOutput("Bananas (any case): " & bananaCount);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Count occurrences case-insensitively
                            fruits = "Apple,banana,ORANGE,apple,GRAPE,banana";
                            appleCount = ListValueCountNoCase(fruits, "apple");
                            bananaCount = ListValueCountNoCase(fruits, "BANANA");

                            writeOutput("List: " & fruits & "<br>");
                            writeOutput("Apples (any case): " & appleCount & "<br>");
                            writeOutput("Bananas (any case): " & bananaCount);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Case Insensitivity Comparison</h4>
                        <div class="code-block">
// Compare case-sensitive vs case-insensitive
colors = "Red,red,Blue,blue,Green,green";
redCountCase = ListValueCount(colors, "red");
redCountNoCase = ListValueCountNoCase(colors, "red");

writeOutput("List: " & colors & "<br>");
writeOutput("Case-sensitive 'red': " & redCountCase & "<br>");
writeOutput("Case-insensitive 'red': " & redCountNoCase);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Compare case-sensitive vs case-insensitive
                            colors = "Red,red,Blue,blue,Green,green";
                            redCountCase = ListValueCount(colors, "red");
                            redCountNoCase = ListValueCountNoCase(colors, "red");

                            writeOutput("List: " & colors & "<br>");
                            writeOutput("Case-sensitive 'red': " & redCountCase & "<br>");
                            writeOutput("Case-insensitive 'red': " & redCountNoCase);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Preference Analysis</h4>
                    <div class="code-block">
// Analyze user preferences with mixed case input
preferences = "Yes,NO,yes,Maybe,YES,no,No,YES,maybe,Yes";
yesCount = ListValueCountNoCase(preferences, "yes");
noCount = ListValueCountNoCase(preferences, "no");
maybeCount = ListValueCountNoCase(preferences, "maybe");

writeOutput("User preferences: " & preferences & "<br>");
writeOutput("Total responses: " & ListLen(preferences) & "<br><br>");

writeOutput("<strong>Normalized Results:</strong><br>");
writeOutput("Yes: " & yesCount & " (" & numberFormat(yesCount/ListLen(preferences)*100, "99.9") & "%)<br>");
writeOutput("No: " & noCount & " (" & numberFormat(noCount/ListLen(preferences)*100, "99.9") & "%)<br>");
writeOutput("Maybe: " & maybeCount & " (" & numberFormat(maybeCount/ListLen(preferences)*100, "99.9") & "%)");
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Analyze user preferences with mixed case input
                        preferences = "Yes,NO,yes,Maybe,YES,no,No,YES,maybe,Yes";
                        yesCount = ListValueCountNoCase(preferences, "yes");
                        noCount = ListValueCountNoCase(preferences, "no");
                        maybeCount = ListValueCountNoCase(preferences, "maybe");

                        writeOutput("User preferences: " & preferences & "<br>");
                        writeOutput("Total responses: " & ListLen(preferences) & "<br><br>");

                        writeOutput("<strong>Normalized Results:</strong><br>");
                        writeOutput("Yes: " & yesCount & " (" & numberFormat(yesCount/ListLen(preferences)*100, "99.9") & "%)<br>");
                        writeOutput("No: " & noCount & " (" & numberFormat(noCount/ListLen(preferences)*100, "99.9") & "%)<br>");
                        writeOutput("Maybe: " & maybeCount & " (" & numberFormat(maybeCount/ListLen(preferences)*100, "99.9") & "%)");
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Type Analysis</h4>
                    <div class="code-block">
// Analyze file types with mixed case extensions
files = "document.PDF,image.jpg,report.Pdf,photo.JPG,data.pdf,image.Jpg";
pdfCount = ListValueCountNoCase(files, ".pdf");
jpgCount = ListValueCountNoCase(files, ".jpg");

writeOutput("Files: " & files & "<br>");
writeOutput("Total files: " & ListLen(files) & "<br><br>");

writeOutput("<strong>File Type Analysis:</strong><br>");
writeOutput("PDF files: " & pdfCount & "<br>");
writeOutput("JPG files: " & jpgCount & "<br>");
writeOutput("Other files: " & (ListLen(files) - pdfCount - jpgCount));
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Analyze file types with mixed case extensions
                        files = "document.PDF,image.jpg,report.Pdf,photo.JPG,data.pdf,image.Jpg";
                        pdfCount = ListValueCountNoCase(files, ".pdf");
                        jpgCount = ListValueCountNoCase(files, ".jpg");

                        writeOutput("Files: " & files & "<br>");
                        writeOutput("Total files: " & ListLen(files) & "<br><br>");

                        writeOutput("<strong>File Type Analysis:</strong><br>");
                        writeOutput("PDF files: " & pdfCount & "<br>");
                        writeOutput("JPG files: " & jpgCount & "<br>");
                        writeOutput("Other files: " & (ListLen(files) - pdfCount - jpgCount));
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Status Monitoring</h4>
                    <div class="code-block">
// Monitor system status with mixed case
statuses = "ONLINE,offline,Online,OFFLINE,online,Offline,ONLINE";
onlineCount = ListValueCountNoCase(statuses, "online");
offlineCount = ListValueCountNoCase(statuses, "offline");

writeOutput("System statuses: " & statuses & "<br>");
writeOutput("Total checks: " & ListLen(statuses) & "<br><br>");

writeOutput("<strong>System Health:</strong><br>");
writeOutput("Online: " & onlineCount & " (" & numberFormat(onlineCount/ListLen(statuses)*100, "99.9") & "%)<br>");
writeOutput("Offline: " & offlineCount & " (" & numberFormat(offlineCount/ListLen(statuses)*100, "99.9") & "%)<br><br>");

if (offlineCount > onlineCount) {
    writeOutput("<strong style='color: red;'>Warning: System appears to be having issues!</strong>");
} else {
    writeOutput("<strong style='color: green;'>System appears to be healthy.</strong>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Monitor system status with mixed case
                        statuses = "ONLINE,offline,Online,OFFLINE,online,Offline,ONLINE";
                        onlineCount = ListValueCountNoCase(statuses, "online");
                        offlineCount = ListValueCountNoCase(statuses, "offline");

                        writeOutput("System statuses: " & statuses & "<br>");
                        writeOutput("Total checks: " & ListLen(statuses) & "<br><br>");

                        writeOutput("<strong>System Health:</strong><br>");
                        writeOutput("Online: " & onlineCount & " (" & numberFormat(onlineCount/ListLen(statuses)*100, "99.9") & "%)<br>");
                        writeOutput("Offline: " & offlineCount & " (" & numberFormat(offlineCount/ListLen(statuses)*100, "99.9") & "%)<br><br>");

                        if (offlineCount > onlineCount) {
                            writeOutput("<strong style='color: red;'>Warning: System appears to be having issues!</strong>");
                        } else {
                            writeOutput("<strong style='color: green;'>System appears to be healthy.</strong>");
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