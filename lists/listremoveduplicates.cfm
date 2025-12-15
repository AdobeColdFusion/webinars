<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListRemoveDuplicates - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListRemoveDuplicates</h1>
            <p>Removes duplicate elements from a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListRemoveDuplicates</strong> removes all duplicate elements from a list, keeping only the first occurrence of each value. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Cleaning up data with repeated values</li>
                        <li>Ensuring unique entries in user input</li>
                        <li>Generating unique lists for reporting or processing</li>
                        <li>De-duplicating tags, categories, or IDs</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListRemoveDuplicates(list [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Remove duplicates from a list
originalList = "apple,banana,orange,apple,grape,banana";
uniqueList = ListRemoveDuplicates(originalList);
writeOutput("Original: " & originalList & "<br>");
writeOutput("Unique: " & uniqueList);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Remove duplicates from a list
                            originalList = "apple,banana,orange,apple,grape,banana";
                            uniqueList = ListRemoveDuplicates(originalList);
                            writeOutput("Original: " & originalList & "<br>");
                            writeOutput("Unique: " & uniqueList);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Custom Delimiter</h4>
                        <div class="code-block">
// Remove duplicates with pipe delimiter
fileList = "config.txt|readme.md|index.cfm|config.txt|styles.css";
uniqueFiles = ListRemoveDuplicates(fileList, "|");
writeOutput("Original: " & fileList & "<br>");
writeOutput("Unique: " & uniqueFiles);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Remove duplicates with pipe delimiter
                            fileList = "config.txt|readme.md|index.cfm|config.txt|styles.css";
                            uniqueFiles = ListRemoveDuplicates(fileList, "|");
                            writeOutput("Original: " & fileList & "<br>");
                            writeOutput("Unique: " & uniqueFiles);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Tag Input</h4>
                    <div class="code-block">
// Clean up user-entered tags
tagInput = "cfml,web,cfml,api,web,backend,api";
uniqueTags = ListRemoveDuplicates(tagInput);

writeOutput("User tags: " & tagInput & "<br>");
writeOutput("Unique tags: " & uniqueTags);

// Display as tag list
writeOutput("<br><strong>Tag List:</strong><br>");
for (i = 1; i <= ListLen(uniqueTags); i++) {
    tag = ListGetAt(uniqueTags, i);
    writeOutput("#" & tag & " ");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Clean up user-entered tags
                        tagInput = "cfml,web,cfml,api,web,backend,api";
                        uniqueTags = ListRemoveDuplicates(tagInput);

                        writeOutput("User tags: " & tagInput & "<br>");
                        writeOutput("Unique tags: " & uniqueTags);

                        // Display as tag list
                        writeOutput("<br><strong>Tag List:</strong><br>");
                        for (i = 1; i <= ListLen(uniqueTags); i++) {
                            tag = ListGetAt(uniqueTags, i);
                            writeOutput("##" & tag & " ");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Email List Cleanup</h4>
                    <div class="code-block">
// Remove duplicate emails from a list
emailList = "john@email.com,jane@email.com,john@email.com,bob@email.com";
uniqueEmails = ListRemoveDuplicates(emailList);

writeOutput("Original emails: " & emailList & "<br>");
writeOutput("Unique emails: " & uniqueEmails);

// Display as email list
writeOutput("<br><strong>Email List:</strong><br>");
for (i = 1; i <= ListLen(uniqueEmails); i++) {
    email = ListGetAt(uniqueEmails, i);
    writeOutput(email & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Remove duplicate emails from a list
                        emailList = "john@email.com,jane@email.com,john@email.com,bob@email.com";
                        uniqueEmails = ListRemoveDuplicates(emailList);

                        writeOutput("Original emails: " & emailList & "<br>");
                        writeOutput("Unique emails: " & uniqueEmails);

                        // Display as email list
                        writeOutput("<br><strong>Email List:</strong><br>");
                        for (i = 1; i <= ListLen(uniqueEmails); i++) {
                            email = ListGetAt(uniqueEmails, i);
                            writeOutput(email & "<br>");
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