<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListFind - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListFind</h1>
            <p>Finds the position of an element in a list (case-sensitive)</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListFind</strong> returns the position of the first occurrence of a value in a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Checking if an item exists in a list</li>
                        <li>Finding the position of items for processing</li>
                        <li>Validating user selections against allowed options</li>
                        <li>Conditional logic based on list membership</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListFind(list, value [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Find position of an item
fruits = "apple,banana,orange,grape";
position = ListFind(fruits, "banana");
writeOutput("Position of 'banana': " & position & "<br>");

// Item not found returns 0
notFound = ListFind(fruits, "mango");
writeOutput("Position of 'mango': " & notFound);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Find position of an item
                            fruits = "apple,banana,orange,grape";
                            position = ListFind(fruits, "banana");
                            writeOutput("Position of 'banana': " & position & "<br>");

                            // Item not found returns 0
                            notFound = ListFind(fruits, "mango");
                            writeOutput("Position of 'mango': " & notFound);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Case Sensitivity</h4>
                        <div class="code-block">
// Case-sensitive search
colors = "Red,Green,Blue,Yellow";
redPosition = ListFind(colors, "Red");
redLowerPosition = ListFind(colors, "red");
writeOutput("Position of 'Red': " & redPosition & "<br>");
writeOutput("Position of 'red': " & redLowerPosition);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Case-sensitive search
                            colors = "Red,Green,Blue,Yellow";
                            redPosition = ListFind(colors, "Red");
                            redLowerPosition = ListFind(colors, "red");
                            writeOutput("Position of 'Red': " & redPosition & "<br>");
                            writeOutput("Position of 'red': " & redLowerPosition);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Role Validation</h4>
                    <div class="code-block">
// Check if user has required role
userRoles = "admin,editor,viewer";
requiredRole = "admin";

if (ListFind(userRoles, requiredRole) > 0) {
    writeOutput("User has admin access!<br>");
    writeOutput("Admin role found at position: " & ListFind(userRoles, requiredRole));
} else {
    writeOutput("Access denied - admin role required!");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Check if user has required role
                        userRoles = "admin,editor,viewer";
                        requiredRole = "admin";

                        if (ListFind(userRoles, requiredRole) > 0) {
                            writeOutput("User has admin access!<br>");
                            writeOutput("Admin role found at position: " & ListFind(userRoles, requiredRole));
                        } else {
                            writeOutput("Access denied - admin role required!");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Product Inventory Check</h4>
                    <div class="code-block">
// Check product availability
availableProducts = "laptop,keyboard,mouse,monitor,headphones";
requestedProduct = "keyboard";

productPosition = ListFind(availableProducts, requestedProduct);
if (productPosition > 0) {
    writeOutput("Product '" & requestedProduct & "' is available!<br>");
    writeOutput("Product ID: " & productPosition);
} else {
    writeOutput("Product '" & requestedProduct & "' is out of stock!");
}

// Check multiple products
requestedItems = "laptop,tablet,keyboard";
writeOutput("<br><br><strong>Availability Check:</strong><br>");
for (i = 1; i <= ListLen(requestedItems); i++) {
    item = ListGetAt(requestedItems, i);
    if (ListFind(availableProducts, item) > 0) {
        writeOutput("✓ " & item & " - Available<br>");
    } else {
        writeOutput("✗ " & item & " - Out of stock<br>");
    }
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Check product availability
                        availableProducts = "laptop,keyboard,mouse,monitor,headphones";
                        requestedProduct = "keyboard";

                        productPosition = ListFind(availableProducts, requestedProduct);
                        if (productPosition > 0) {
                            writeOutput("Product '" & requestedProduct & "' is available!<br>");
                            writeOutput("Product ID: " & productPosition);
                        } else {
                            writeOutput("Product '" & requestedProduct & "' is out of stock!");
                        }

                        // Check multiple products
                        requestedItems = "laptop,tablet,keyboard";
                        writeOutput("<br><br><strong>Availability Check:</strong><br>");
                        for (i = 1; i <= ListLen(requestedItems); i++) {
                            item = ListGetAt(requestedItems, i);
                            if (ListFind(availableProducts, item) > 0) {
                                writeOutput("✓ " & item & " - Available<br>");
                            } else {
                                writeOutput("✗ " & item & " - Out of stock<br>");
                            }
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Extension Validation</h4>
                    <div class="code-block">
// Validate file uploads
allowedExtensions = "jpg,jpeg,png,gif,pdf,doc,docx";
uploadedFile = "document.pdf";

fileExtension = ListLast(uploadedFile, ".");
if (ListFind(allowedExtensions, fileExtension) > 0) {
    writeOutput("File type '" & fileExtension & "' is allowed!<br>");
    writeOutput("Extension found at position: " & ListFind(allowedExtensions, fileExtension));
} else {
    writeOutput("File type '" & fileExtension & "' is not allowed!");
}

// Check multiple files
uploadedFiles = "image.jpg,script.js,report.pdf,data.xlsx";
writeOutput("<br><br><strong>File Validation:</strong><br>");
for (i = 1; i <= ListLen(uploadedFiles); i++) {
    file = ListGetAt(uploadedFiles, i);
    ext = ListLast(file, ".");
    if (ListFind(allowedExtensions, ext) > 0) {
        writeOutput("✓ " & file & " - Valid<br>");
    } else {
        writeOutput("✗ " & file & " - Invalid extension<br>");
    }
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Validate file uploads
                        allowedExtensions = "jpg,jpeg,png,gif,pdf,doc,docx";
                        uploadedFile = "document.pdf";

                        fileExtension = ListLast(uploadedFile, ".");
                        if (ListFind(allowedExtensions, fileExtension) > 0) {
                            writeOutput("File type '" & fileExtension & "' is allowed!<br>");
                            writeOutput("Extension found at position: " & ListFind(allowedExtensions, fileExtension));
                        } else {
                            writeOutput("File type '" & fileExtension & "' is not allowed!");
                        }

                        // Check multiple files
                        uploadedFiles = "image.jpg,script.js,report.pdf,data.xlsx";
                        writeOutput("<br><br><strong>File Validation:</strong><br>");
                        for (i = 1; i <= ListLen(uploadedFiles); i++) {
                            file = ListGetAt(uploadedFiles, i);
                            ext = ListLast(file, ".");
                            if (ListFind(allowedExtensions, ext) > 0) {
                                writeOutput("✓ " & file & " - Valid<br>");
                            } else {
                                writeOutput("✗ " & file & " - Invalid extension<br>");
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