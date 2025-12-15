<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListLen - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListLen</h1>
            <p>Returns the number of elements in a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListLen</strong> returns the number of elements in a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Counting items in lists for validation</li>
                        <li>Determining array bounds for loops</li>
                        <li>Checking if lists are empty or have specific sizes</li>
                        <li>Data analysis and reporting</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListLen(list [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Count elements in a list
fruits = "apple,banana,orange,grape";
count = ListLen(fruits);
writeOutput("List: " & fruits & "<br>");
writeOutput("Number of items: " & count);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Count elements in a list
                            fruits = "apple,banana,orange,grape";
                            count = ListLen(fruits);
                            writeOutput("List: " & fruits & "<br>");
                            writeOutput("Number of items: " & count);
                            </cfscript>
                        </div>
                    </div>

                    <div class="example-item">
                        <h4>String as list</h4>
                        <div class="code-block">
// Count elements in a list
fruits = "applebananaorangegrape";
count = ListLen(fruits,"");
writeOutput("List: " & fruits & "<br>");
writeOutput("Number of items: " & count);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Count elements in a list
                                fruits = "applebananaorangegrape";
                                myChar30 = Chr(30)
                            count = ListLen(fruits,myChar30);
                            writeOutput("List: " & fruits & "<br>");
                            writeOutput("Number of items: " & count);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Empty List Check</h4>
                        <div class="code-block">
// Check if list is empty
emptyList = "";
nonEmptyList = "item1,item2,item3";

emptyCount = ListLen(emptyList);
nonEmptyCount = ListLen(nonEmptyList);

writeOutput("Empty list length: " & emptyCount & "<br>");
writeOutput("Non-empty list length: " & nonEmptyCount & "<br>");

if (emptyCount == 0) {
    writeOutput("Empty list is empty!");
}
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Check if list is empty
                            emptyList = "";
                            nonEmptyList = "item1,item2,item3";

                            emptyCount = ListLen(emptyList);
                            nonEmptyCount = ListLen(nonEmptyList);

                            writeOutput("Empty list length: " & emptyCount & "<br>");
                            writeOutput("Non-empty list length: " & nonEmptyCount & "<br>");

                            if (emptyCount == 0) {
                                writeOutput("Empty list is empty!");
                            }
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Shopping Cart Validation</h4>
                    <div class="code-block">
// Validate shopping cart
cartItems = "laptop,keyboard,mouse,monitor";
itemCount = ListLen(cartItems);

writeOutput("Cart items: " & cartItems & "<br>");
writeOutput("Items in cart: " & itemCount & "<br>");

if (itemCount == 0) {
    writeOutput("Your cart is empty!");
} else if (itemCount > 10) {
    writeOutput("Cart limit exceeded (max 10 items)!");
} else {
    writeOutput("Cart is valid. Proceed to checkout.");
}

// Calculate shipping based on item count
if (itemCount <= 3) {
    shipping = 5.99;
} else if (itemCount <= 6) {
    shipping = 9.99;
} else {
    shipping = 14.99;
}
writeOutput("<br>Shipping cost: $" & shipping);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Validate shopping cart
                        cartItems = "laptop,keyboard,mouse,monitor";
                        itemCount = ListLen(cartItems);

                        writeOutput("Cart items: " & cartItems & "<br>");
                        writeOutput("Items in cart: " & itemCount & "<br>");

                        if (itemCount == 0) {
                            writeOutput("Your cart is empty!");
                        } else if (itemCount > 10) {
                            writeOutput("Cart limit exceeded (max 10 items)!");
                        } else {
                            writeOutput("Cart is valid. Proceed to checkout.");
                        }

                        // Calculate shipping based on item count
                        if (itemCount <= 3) {
                            shipping = 5.99;
                        } else if (itemCount <= 6) {
                            shipping = 9.99;
                        } else {
                            shipping = 14.99;
                        }
                        writeOutput("<br>Shipping cost: $" & shipping);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Permission Analysis</h4>
                    <div class="code-block">
// Analyze user permissions
userPermissions = "read,write,delete,admin,edit";
permissionCount = ListLen(userPermissions);

writeOutput("User permissions: " & userPermissions & "<br>");
writeOutput("Number of permissions: " & permissionCount & "<br>");

// Determine user level based on permission count
if (permissionCount >= 4) {
    userLevel = "Administrator";
} else if (permissionCount >= 2) {
    userLevel = "Power User";
} else if (permissionCount == 1) {
    userLevel = "Basic User";
} else {
    userLevel = "Guest";
}

writeOutput("User level: " & userLevel);

// Check for specific permissions
if (ListFind(userPermissions, "admin") > 0) {
    writeOutput("<br>User has admin access!");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Analyze user permissions
                        userPermissions = "read,write,delete,admin,edit";
                        permissionCount = ListLen(userPermissions);

                        writeOutput("User permissions: " & userPermissions & "<br>");
                        writeOutput("Number of permissions: " & permissionCount & "<br>");

                        // Determine user level based on permission count
                        if (permissionCount >= 4) {
                            userLevel = "Administrator";
                        } else if (permissionCount >= 2) {
                            userLevel = "Power User";
                        } else if (permissionCount == 1) {
                            userLevel = "Basic User";
                        } else {
                            userLevel = "Guest";
                        }

                        writeOutput("User level: " & userLevel);

                        // Check for specific permissions
                        if (ListFind(userPermissions, "admin") > 0) {
                            writeOutput("<br>User has admin access!");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Upload Validation</h4>
                    <div class="code-block">
// Validate file uploads
uploadedFiles = "document.pdf,image.jpg,script.js,data.csv";
fileCount = ListLen(uploadedFiles);

writeOutput("Uploaded files: " & uploadedFiles & "<br>");
writeOutput("Number of files: " & fileCount & "<br>");

// Check upload limits
maxFiles = 5;
if (fileCount > maxFiles) {
    writeOutput("Error: Too many files (max " & maxFiles & ")!");
} else if (fileCount == 0) {
    writeOutput("Error: No files selected!");
} else {
    writeOutput("Upload validation passed!");
    
    // Process each file
    writeOutput("<br><br><strong>Processing files:</strong><br>");
    for (i = 1; i <= fileCount; i++) {
        fileName = ListGetAt(uploadedFiles, i);
        writeOutput(i & ". " & fileName & "<br>");
    }
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Validate file uploads
                        uploadedFiles = "document.pdf,image.jpg,script.js,data.csv";
                        fileCount = ListLen(uploadedFiles);

                        writeOutput("Uploaded files: " & uploadedFiles & "<br>");
                        writeOutput("Number of files: " & fileCount & "<br>");

                        // Check upload limits
                        maxFiles = 5;
                        if (fileCount > maxFiles) {
                            writeOutput("Error: Too many files (max " & maxFiles & ")!");
                        } else if (fileCount == 0) {
                            writeOutput("Error: No files selected!");
                        } else {
                            writeOutput("Upload validation passed!");
                            
                            // Process each file
                            writeOutput("<br><br><strong>Processing files:</strong><br>");
                            for (i = 1; i <= fileCount; i++) {
                                fileName = ListGetAt(uploadedFiles, i);
                                writeOutput(i & ". " & fileName & "<br>");
                            }
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Survey Response Analysis</h4>
                    <div class="code-block">
// Analyze survey responses
surveyResponses = "excellent,good,fair,poor,excellent,good,excellent";
responseCount = ListLen(surveyResponses);

writeOutput("Survey responses: " & surveyResponses & "<br>");
writeOutput("Total responses: " & responseCount & "<br>");

// Calculate response percentages
excellentCount = ListValueCount(surveyResponses, "excellent");
goodCount = ListValueCount(surveyResponses, "good");
fairCount = ListValueCount(surveyResponses, "fair");
poorCount = ListValueCount(surveyResponses, "poor");

writeOutput("<br><strong>Response Analysis:</strong><br>");
writeOutput("Excellent: " & excellentCount & " (" & numberFormat(excellentCount/responseCount*100, "999.9") & "%)<br>");
writeOutput("Good: " & goodCount & " (" & numberFormat(goodCount/responseCount*100, "999.9") & "%)<br>");
writeOutput("Fair: " & fairCount & " (" & numberFormat(fairCount/responseCount*100, "999.9") & "%)<br>");
writeOutput("Poor: " & poorCount & " (" & numberFormat(poorCount/responseCount*100, "999.9") & "%)<br>");

// Overall satisfaction
satisfactionScore = (excellentCount * 4 + goodCount * 3 + fairCount * 2 + poorCount * 1) / responseCount;
writeOutput("<br>Overall satisfaction score: " & numberFormat(satisfactionScore, "9.9") & "/4.0");
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Analyze survey responses
                        surveyResponses = "excellent,good,fair,poor,excellent,good,excellent";
                        responseCount = ListLen(surveyResponses);

                        writeOutput("Survey responses: " & surveyResponses & "<br>");
                        writeOutput("Total responses: " & responseCount & "<br>");

                        // Calculate response percentages
                        excellentCount = ListValueCount(surveyResponses, "excellent");
                        goodCount = ListValueCount(surveyResponses, "good");
                        fairCount = ListValueCount(surveyResponses, "fair");
                        poorCount = ListValueCount(surveyResponses, "poor");

                        writeOutput("<br><strong>Response Analysis:</strong><br>");
                        writeOutput("Excellent: " & excellentCount & " (" & numberFormat(excellentCount/responseCount*100, "999.9") & "%)<br>");
                        writeOutput("Good: " & goodCount & " (" & numberFormat(goodCount/responseCount*100, "999.9") & "%)<br>");
                        writeOutput("Fair: " & fairCount & " (" & numberFormat(fairCount/responseCount*100, "999.9") & "%)<br>");
                        writeOutput("Poor: " & poorCount & " (" & numberFormat(poorCount/responseCount*100, "999.9") & "%)<br>");

                        // Overall satisfaction
                        satisfactionScore = (excellentCount * 4 + goodCount * 3 + fairCount * 2 + poorCount * 1) / responseCount;
                        writeOutput("<br>Overall satisfaction score: " & numberFormat(satisfactionScore, "9.9") & "/4.0");
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