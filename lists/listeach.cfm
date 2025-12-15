<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListEach - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListEach</h1>
            <p>Executes a function for each element in a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListEach</strong> executes a callback function for each element in a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Performing actions on each list element without creating a new list</li>
                        <li>Side effects like logging, validation, or processing</li>
                        <li>Iterating through lists when you don't need a return value</li>
                        <li>Building complex processing workflows</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListEach(list, callback [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Process each item in a list
fruits = "apple,banana,orange,grape";
ListEach(fruits, function(item) {
    writeOutput("Processing: " & item & "<br>");
});
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Process each item in a list
                            fruits = "apple,banana,orange,grape";
                            ListEach(fruits, function(item) {
                                writeOutput("Processing: " & item & "<br>");
                            });
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Validation Example</h4>
                        <div class="code-block">
// Validate each email address
emailList = "john@company.com,jane@company.com,invalid-email";
validCount = 0;
invalidCount = 0;

ListEach(emailList, function(email) {
    if (find("@", email) > 0 && find(".", email) > find("@", email)) {
        validCount++;
        writeOutput("✅ " & email & " - Valid<br>");
    } else {
        invalidCount++;
        writeOutput("❌ " & email & " - Invalid<br>");
    }
});

writeOutput("<br>Summary: " & validCount & " valid, " & invalidCount & " invalid");
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Validate each email address
                            emailList = "john@company.com,jane@company.com,invalid-email";
                            validCount = 0;
                            invalidCount = 0;

                            ListEach(emailList, function(email) {
                                if (find("@", email) > 0 && find(".", email) > find("@", email)) {
                                    validCount++;
                                    writeOutput("✅ " & email & " - Valid<br>");
                                } else {
                                    invalidCount++;
                                    writeOutput("❌ " & email & " - Invalid<br>");
                                }
                            });

                            writeOutput("<br>Summary: " & validCount & " valid, " & invalidCount & " invalid");
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Processing</h4>
                    <div class="code-block">
// Process each file in a directory
fileList = "config.cfm,readme.txt,index.cfm,styles.css,script.js";
totalSize = 0;

ListEach(fileList, function(fileName) {
    // Simulate file size calculation
    fileSize = len(fileName) * 100; // Mock calculation
    totalSize += fileSize;
    
    ext = ListLast(fileName, ".");
    writeOutput("📄 " & fileName & " (" & fileSize & " bytes)<br>");
    
    if (ext == "cfm") {
        writeOutput("   → ColdFusion file<br>");
    } else if (ext == "css") {
        writeOutput("   → Stylesheet file<br>");
    } else if (ext == "js") {
        writeOutput("   → JavaScript file<br>");
    }
    writeOutput("<br>");
});

writeOutput("<strong>Total size: " & totalSize & " bytes</strong>");
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Process each file in a directory
                        fileList = "config.cfm,readme.txt,index.cfm,styles.css,script.js";
                        totalSize = 0;

                        ListEach(fileList, function(fileName) {
                            // Simulate file size calculation
                            fileSize = len(fileName) * 100; // Mock calculation
                            totalSize += fileSize;
                            
                            ext = ListLast(fileName, ".");
                            writeOutput("📄 " & fileName & " (" & fileSize & " bytes)<br>");
                            
                            if (ext == "cfm") {
                                writeOutput("   → ColdFusion file<br>");
                            } else if (ext == "css") {
                                writeOutput("   → Stylesheet file<br>");
                            } else if (ext == "js") {
                                writeOutput("   → JavaScript file<br>");
                            }
                            writeOutput("<br>");
                        });

                        writeOutput("<strong>Total size: " & totalSize & " bytes</strong>");
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Permission Check</h4>
                    <div class="code-block">
// Check each user's permissions
userList = "john:admin,jane:editor,bob:viewer,alice:admin";
adminUsers = "";
editorUsers = "";
viewerUsers = "";

ListEach(userList, function(userInfo) {
    username = ListFirst(userInfo, ":");
    role = ListLast(userInfo, ":");
    
    writeOutput("👤 " & username & " - " & uCase(role) & "<br>");
    
    switch(role) {
        case "admin":
            adminUsers = ListAppend(adminUsers, username);
            writeOutput("   → Full system access<br>");
            break;
        case "editor":
            editorUsers = ListAppend(editorUsers, username);
            writeOutput("   → Content editing rights<br>");
            break;
        case "viewer":
            viewerUsers = ListAppend(viewerUsers, username);
            writeOutput("   → Read-only access<br>");
            break;
    }
    writeOutput("<br>");
});

writeOutput("<strong>User Summary:</strong><br>");
writeOutput("Admins: " & adminUsers & "<br>");
writeOutput("Editors: " & editorUsers & "<br>");
writeOutput("Viewers: " & viewerUsers);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Check each user's permissions
                        userList = "john:admin,jane:editor,bob:viewer,alice:admin";
                        adminUsers = "";
                        editorUsers = "";
                        viewerUsers = "";

                        ListEach(userList, function(userInfo) {
                            username = ListFirst(userInfo, ":");
                            role = ListLast(userInfo, ":");
                            
                            writeOutput("👤 " & username & " - " & uCase(role) & "<br>");
                            
                            switch(role) {
                                case "admin":
                                    adminUsers = ListAppend(adminUsers, username);
                                    writeOutput("   → Full system access<br>");
                                    break;
                                case "editor":
                                    editorUsers = ListAppend(editorUsers, username);
                                    writeOutput("   → Content editing rights<br>");
                                    break;
                                case "viewer":
                                    viewerUsers = ListAppend(viewerUsers, username);
                                    writeOutput("   → Read-only access<br>");
                                    break;
                            }
                            writeOutput("<br>");
                        });

                        writeOutput("<strong>User Summary:</strong><br>");
                        writeOutput("Admins: " & adminUsers & "<br>");
                        writeOutput("Editors: " & editorUsers & "<br>");
                        writeOutput("Viewers: " & viewerUsers);
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