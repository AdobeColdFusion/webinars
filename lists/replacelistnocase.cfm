<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReplaceListNoCase - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ReplaceListNoCase</h1>
            <p>Replaces multiple values in a string using lists of search and replacement values (case-insensitive)</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ReplaceListNoCase</strong> performs multiple find-and-replace operations on a string using two lists, ignoring case differences. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Case-insensitive bulk text replacement</li>
                        <li>Data normalization regardless of capitalization</li>
                        <li>Template processing with mixed case variables</li>
                        <li>User input processing and cleaning</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ReplaceListNoCase(string, list1, list2 [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Replace multiple values case-insensitively
text = "Hello WORLD, HOW are YOU today?";
findList = "Hello,world,how,you";
replaceList = "Hi,earth,what,we";

result = ReplaceListNoCase(text, findList, replaceList);

writeOutput("Original: " & text & "<br>");
writeOutput("Find: " & findList & "<br>");
writeOutput("Replace: " & replaceList & "<br>");
writeOutput("Result: " & result);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Replace multiple values case-insensitively
                            text = "Hello WORLD, HOW are YOU today?";
                            findList = "Hello,world,how,you";
                            replaceList = "Hi,earth,what,we";

                            result = ReplaceListNoCase(text, findList, replaceList);

                            writeOutput("Original: " & text & "<br>");
                            writeOutput("Find: " & findList & "<br>");
                            writeOutput("Replace: " & replaceList & "<br>");
                            writeOutput("Result: " & result);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Case Insensitivity Comparison</h4>
                        <div class="code-block">
// Compare case-sensitive vs case-insensitive
text = "The CAT and the DOG are friends";
findList = "cat,dog";
replaceList = "kitten,puppy";

resultCase = ReplaceList(text, findList, replaceList);
resultNoCase = ReplaceListNoCase(text, findList, replaceList);

writeOutput("Original: " & text & "<br>");
writeOutput("Case-sensitive: " & resultCase & "<br>");
writeOutput("Case-insensitive: " & resultNoCase);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Compare case-sensitive vs case-insensitive
                            text = "The CAT and the DOG are friends";
                            findList = "cat,dog";
                            replaceList = "kitten,puppy";

                            resultCase = ReplaceList(text, findList, replaceList);
                            resultNoCase = ReplaceListNoCase(text, findList, replaceList);

                            writeOutput("Original: " & text & "<br>");
                            writeOutput("Case-sensitive: " & resultCase & "<br>");
                            writeOutput("Case-insensitive: " & resultNoCase);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Input Normalization</h4>
                    <div class="code-block">
// Normalize user input with mixed case
userInput = "YES,No,yes,MAYBE,Yes,no,NO,yes,maybe,Yes";
findValues = "yes,no,maybe";
normalizedValues = "Yes,No,Maybe";

normalized = ReplaceListNoCase(userInput, findValues, normalizedValues);

writeOutput("User input: " & userInput & "<br>");
writeOutput("Find values: " & findValues & "<br>");
writeOutput("Normalized values: " & normalizedValues & "<br>");
writeOutput("Normalized: " & normalized);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Normalize user input with mixed case
                        userInput = "YES,No,yes,MAYBE,Yes,no,NO,yes,maybe,Yes";
                        findValues = "yes,no,maybe";
                        normalizedValues = "Yes,No,Maybe";

                        normalized = ReplaceListNoCase(userInput, findValues, normalizedValues);

                        writeOutput("User input: " & userInput & "<br>");
                        writeOutput("Find values: " & findValues & "<br>");
                        writeOutput("Normalized values: " & normalizedValues & "<br>");
                        writeOutput("Normalized: " & normalized);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Status Code Standardization</h4>
                    <div class="code-block">
// Standardize status codes regardless of case
statuses = "ONLINE,offline,Online,OFFLINE,online,Offline,ONLINE";
findStatuses = "online,offline";
standardStatuses = "Online,Offline";

standardized = ReplaceListNoCase(statuses, findStatuses, standardStatuses);

writeOutput("Original statuses: " & statuses & "<br>");
writeOutput("Find: " & findStatuses & "<br>");
writeOutput("Standard: " & standardStatuses & "<br>");
writeOutput("Standardized: " & standardized);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Standardize status codes regardless of case
                        statuses = "ONLINE,offline,Online,OFFLINE,online,Offline,ONLINE";
                        findStatuses = "online,offline";
                        standardStatuses = "Online,Offline";

                        standardized = ReplaceListNoCase(statuses, findStatuses, standardStatuses);

                        writeOutput("Original statuses: " & statuses & "<br>");
                        writeOutput("Find: " & findStatuses & "<br>");
                        writeOutput("Standard: " & standardStatuses & "<br>");
                        writeOutput("Standardized: " & standardized);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Type Normalization</h4>
                    <div class="code-block">
// Normalize file extensions regardless of case
files = "document.PDF,image.JPG,report.Pdf,photo.jpg,data.pdf,image.Jpg";
findExtensions = ".pdf,.jpg,.jpeg,.png";
standardExtensions = ".PDF,.JPG,.JPEG,.PNG";

normalizedFiles = ReplaceListNoCase(files, findExtensions, standardExtensions);

writeOutput("Original files: " & files & "<br>");
writeOutput("Find extensions: " & findExtensions & "<br>");
writeOutput("Standard extensions: " & standardExtensions & "<br>");
writeOutput("Normalized: " & normalizedFiles);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Normalize file extensions regardless of case
                        files = "document.PDF,image.JPG,report.Pdf,photo.jpg,data.pdf,image.Jpg";
                        findExtensions = ".pdf,.jpg,.jpeg,.png";
                        standardExtensions = ".PDF,.JPG,.JPEG,.PNG";

                        normalizedFiles = ReplaceListNoCase(files, findExtensions, standardExtensions);

                        writeOutput("Original files: " & files & "<br>");
                        writeOutput("Find extensions: " & findExtensions & "<br>");
                        writeOutput("Standard extensions: " & standardExtensions & "<br>");
                        writeOutput("Normalized: " & normalizedFiles);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Error Message Standardization</h4>
                    <div class="code-block">
// Standardize error messages regardless of case
errors = "ERROR,Info,WARNING,error,Debug,ERROR,info,warning,ERROR";
findLevels = "error,warning,info,debug";
standardLevels = "ERROR,WARNING,INFO,DEBUG";

standardizedErrors = ReplaceListNoCase(errors, findLevels, standardLevels);

writeOutput("Original errors: " & errors & "<br>");
writeOutput("Find levels: " & findLevels & "<br>");
writeOutput("Standard levels: " & standardLevels & "<br>");
writeOutput("Standardized: " & standardizedErrors);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Standardize error messages regardless of case
                        errors = "ERROR,Info,WARNING,error,Debug,ERROR,info,warning,ERROR";
                        findLevels = "error,warning,info,debug";
                        standardLevels = "ERROR,WARNING,INFO,DEBUG";

                        standardizedErrors = ReplaceListNoCase(errors, findLevels, standardLevels);

                        writeOutput("Original errors: " & errors & "<br>");
                        writeOutput("Find levels: " & findLevels & "<br>");
                        writeOutput("Standard levels: " & standardLevels & "<br>");
                        writeOutput("Standardized: " & standardizedErrors);
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