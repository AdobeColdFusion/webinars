<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListFindNoCase - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListFindNoCase</h1>
            <p>Finds the position of an element in a list (case-insensitive)</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListFindNoCase</strong> returns the position of the first occurrence of a value in a list, ignoring case. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Case-insensitive searches in lists</li>
                        <li>User input validation where case doesn't matter</li>
                        <li>Finding items regardless of capitalization</li>
                        <li>Flexible data matching</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListFindNoCase(list, value [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Find position case-insensitive
colors = "Red,Green,Blue,Yellow";
redPosition = ListFindNoCase(colors, "red");
greenPosition = ListFindNoCase(colors, "GREEN");

writeOutput("List: " & colors & "<br>");
writeOutput("Position of 'red': " & redPosition & "<br>");
writeOutput("Position of 'GREEN': " & greenPosition);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Find position case-insensitive
                            colors = "Red,Green,Blue,Yellow";
                            redPosition = ListFindNoCase(colors, "red");
                            greenPosition = ListFindNoCase(colors, "GREEN");

                            writeOutput("List: " & colors & "<br>");
                            writeOutput("Position of 'red': " & redPosition & "<br>");
                            writeOutput("Position of 'GREEN': " & greenPosition);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Case Comparison</h4>
                        <div class="code-block">
// Compare case-sensitive vs case-insensitive
fruits = "Apple,Banana,Orange,Grape";
searchTerm = "apple";

caseSensitive = ListFind(fruits, searchTerm);
caseInsensitive = ListFindNoCase(fruits, searchTerm);

writeOutput("List: " & fruits & "<br>");
writeOutput("Search term: " & searchTerm & "<br>");
writeOutput("Case-sensitive: " & caseSensitive & "<br>");
writeOutput("Case-insensitive: " & caseInsensitive);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Compare case-sensitive vs case-insensitive
                            fruits = "Apple,Banana,Orange,Grape";
                            searchTerm = "apple";

                            caseSensitive = ListFind(fruits, searchTerm);
                            caseInsensitive = ListFindNoCase(fruits, searchTerm);

                            writeOutput("List: " & fruits & "<br>");
                            writeOutput("Search term: " & searchTerm & "<br>");
                            writeOutput("Case-sensitive: " & caseSensitive & "<br>");
                            writeOutput("Case-insensitive: " & caseInsensitive);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Input Validation</h4>
                    <div class="code-block">
// Validate user selection case-insensitive
allowedCategories = "Technology,Business,Sports,Entertainment";
userSelection = "technology"; // User input (lowercase)

if (ListFindNoCase(allowedCategories, userSelection) > 0) {
    writeOutput("✅ Valid selection: " & userSelection & "<br>");
    writeOutput("Found at position: " & ListFindNoCase(allowedCategories, userSelection));
} else {
    writeOutput("❌ Invalid selection: " & userSelection);
}

// Check multiple user inputs
userSelections = "TECHNOLOGY,business,SPORTS,invalid";
writeOutput("<br><br><strong>Validation Results:</strong><br>");
for (i = 1; i <= ListLen(userSelections); i++) {
    selection = ListGetAt(userSelections, i);
    if (ListFindNoCase(allowedCategories, selection) > 0) {
        writeOutput("✅ " & selection & " - Valid<br>");
    } else {
        writeOutput("❌ " & selection & " - Invalid<br>");
    }
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Validate user selection case-insensitive
                        allowedCategories = "Technology,Business,Sports,Entertainment";
                        userSelection = "technology"; // User input (lowercase)

                        if (ListFindNoCase(allowedCategories, userSelection) > 0) {
                            writeOutput("✅ Valid selection: " & userSelection & "<br>");
                            writeOutput("Found at position: " & ListFindNoCase(allowedCategories, userSelection));
                        } else {
                            writeOutput("❌ Invalid selection: " & userSelection);
                        }

                        // Check multiple user inputs
                        userSelections = "TECHNOLOGY,business,SPORTS,invalid";
                        writeOutput("<br><br><strong>Validation Results:</strong><br>");
                        for (i = 1; i <= ListLen(userSelections); i++) {
                            selection = ListGetAt(userSelections, i);
                            if (ListFindNoCase(allowedCategories, selection) > 0) {
                                writeOutput("✅ " & selection & " - Valid<br>");
                            } else {
                                writeOutput("❌ " & selection & " - Invalid<br>");
                            }
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Type Validation</h4>
                    <div class="code-block">
// Validate file extensions case-insensitive
allowedExtensions = "JPG,PNG,GIF,PDF,DOC";
uploadedFile = "image.jpg";
fileExtension = ListLast(uploadedFile, ".");

if (ListFindNoCase(allowedExtensions, fileExtension) > 0) {
    writeOutput("✅ File type allowed: " & fileExtension & "<br>");
    writeOutput("Extension found at position: " & ListFindNoCase(allowedExtensions, fileExtension));
} else {
    writeOutput("❌ File type not allowed: " & fileExtension);
}

// Check multiple files
uploadedFiles = "document.PDF,image.JPG,script.js,data.XLSX";
writeOutput("<br><br><strong>File Validation:</strong><br>");
for (i = 1; i <= ListLen(uploadedFiles); i++) {
    file = ListGetAt(uploadedFiles, i);
    ext = ListLast(file, ".");
    if (ListFindNoCase(allowedExtensions, ext) > 0) {
        writeOutput("✅ " & file & " - Allowed<br>");
    } else {
        writeOutput("❌ " & file & " - Not allowed<br>");
    }
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Validate file extensions case-insensitive
                        allowedExtensions = "JPG,PNG,GIF,PDF,DOC";
                        uploadedFile = "image.jpg";
                        fileExtension = ListLast(uploadedFile, ".");

                        if (ListFindNoCase(allowedExtensions, fileExtension) > 0) {
                            writeOutput("✅ File type allowed: " & fileExtension & "<br>");
                            writeOutput("Extension found at position: " & ListFindNoCase(allowedExtensions, fileExtension));
                        } else {
                            writeOutput("❌ File type not allowed: " & fileExtension);
                        }

                        // Check multiple files
                        uploadedFiles = "document.PDF,image.JPG,script.js,data.XLSX";
                        writeOutput("<br><br><strong>File Validation:</strong><br>");
                        for (i = 1; i <= ListLen(uploadedFiles); i++) {
                            file = ListGetAt(uploadedFiles, i);
                            ext = ListLast(file, ".");
                            if (ListFindNoCase(allowedExtensions, ext) > 0) {
                                writeOutput("✅ " & file & " - Allowed<br>");
                            } else {
                                writeOutput("❌ " & file & " - Not allowed<br>");
                            }
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