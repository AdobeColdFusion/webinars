<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListAppend - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListAppend</h1>
            <p>Adds an element to the end of a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListAppend</strong> adds a new element to the end of a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Building lists dynamically in loops</li>
                        <li>Adding items to user-selected lists</li>
                        <li>Appending values to comma-separated data</li>
                        <li>Creating lists from form submissions</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListAppend(list, value [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Add a new item to a list
originalList = "apple,banana,orange";
newList = ListAppend(originalList, "grape");
writeOutput("Original: " & originalList & "<br>");
writeOutput("New: " & newList);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Add a new item to a list
                            originalList = "apple,banana,orange";
                            newList = ListAppend(originalList, "grape");
                            writeOutput("Original: " & originalList & "<br>");
                            writeOutput("New: " & newList);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Building Lists in Loops</h4>
                        <div class="code-block">
// Build a list of even numbers
evenNumbers = "";
for (i = 2; i <= 10; i += 2) {
    evenNumbers = ListAppend(evenNumbers, i);
}
writeOutput("Even numbers: " & evenNumbers);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Build a list of even numbers
                            evenNumbers = "";
                            for (i = 2; i <= 10; i += 2) {
                                evenNumbers = ListAppend(evenNumbers, i);
                            }
                            writeOutput("Even numbers: " & evenNumbers);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Custom Delimiter</h4>
                    <div class="code-block">
// Using pipe as delimiter
fileList = "config.txt|readme.md|index.cfm";
newFileList = ListAppend(fileList, "styles.css", "|");
writeOutput("Original: " & fileList & "<br>");
writeOutput("New: " & newFileList);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Using pipe as delimiter
                        fileList = "config.txt|readme.md|index.cfm";
                        newFileList = ListAppend(fileList, "styles.css", "|");
                        writeOutput("Original: " & fileList & "<br>");
                        writeOutput("New: " & newFileList);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Permissions</h4>
                    <div class="code-block">
// Add new permission to user's existing permissions
userPermissions = "read,write,delete";
newPermission = "admin";

// Check if permission already exists
if (!ListContains(userPermissions, newPermission)) {
    userPermissions = ListAppend(userPermissions, newPermission);
    writeOutput("Permission added successfully!<br>");
    writeOutput("New permissions: " & userPermissions);
} else {
    writeOutput("Permission already exists!");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Add new permission to user's existing permissions
                        userPermissions = "read,write,delete";
                        newPermission = "admin";

                        // Check if permission already exists
                        if (!ListContains(userPermissions, newPermission)) {
                            userPermissions = ListAppend(userPermissions, newPermission);
                            writeOutput("Permission added successfully!<br>");
                            writeOutput("New permissions: " & userPermissions);
                        } else {
                            writeOutput("Permission already exists!");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Shopping Cart</h4>
                    <div class="code-block">
// Add items to shopping cart
cartItems = "laptop,keyboard,mouse";
newItem = "headphones";

// Add to cart with quantity
cartItems = ListAppend(cartItems, newItem & ":1");
writeOutput("Cart updated!<br>");
writeOutput("Items in cart: " & cartItems);

// Display formatted cart
writeOutput("<br><br><strong>Cart Contents:</strong><br>");
for (i = 1; i <= ListLen(cartItems); i++) {
    item = ListGetAt(cartItems, i);
    writeOutput((i) & ". " & item & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Add items to shopping cart
                        cartItems = "laptop,keyboard,mouse";
                        newItem = "headphones";

                        // Add to cart with quantity
                        cartItems = ListAppend(cartItems, newItem & ":1");
                        writeOutput("Cart updated!<br>");
                        writeOutput("Items in cart: " & cartItems);

                        // Display formatted cart
                        writeOutput("<br><br><strong>Cart Contents:</strong><br>");
                        for (i = 1; i <= ListLen(cartItems); i++) {
                            item = ListGetAt(cartItems, i);
                            writeOutput((i) & ". " & item & "<br>");
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