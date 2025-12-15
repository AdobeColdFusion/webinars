<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListGetAt - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListGetAt</h1>
            <p>Returns an element at a specific position in a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListGetAt</strong> returns an element at a specified position in a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Accessing specific items by position</li>
                        <li>Iterating through lists with position-based access</li>
                        <li>Extracting data from structured lists</li>
                        <li>Random access to list elements</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListGetAt(list, position [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Get item at position 2
fruits = "apple,banana,orange,grape";
secondFruit = ListGetAt(fruits, 2);
writeOutput("List: " & fruits & "<br>");
writeOutput("Item at position 2: " & secondFruit);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Get item at position 2
                            fruits = "apple,banana,orange,grape";
                            secondFruit = ListGetAt(fruits, 2);
                            writeOutput("List: " & fruits & "<br>");
                            writeOutput("Item at position 2: " & secondFruit);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Access First and Last</h4>
                        <div class="code-block">
// Get first and last items
colors = "red,blue,green,yellow,purple";
firstColor = ListGetAt(colors, 1);
lastColor = ListGetAt(colors, ListLen(colors));

writeOutput("List: " & colors & "<br>");
writeOutput("First: " & firstColor & "<br>");
writeOutput("Last: " & lastColor);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Get first and last items
                            colors = "red,blue,green,yellow,purple";
                            firstColor = ListGetAt(colors, 1);
                            lastColor = ListGetAt(colors, ListLen(colors));

                            writeOutput("List: " & colors & "<br>");
                            writeOutput("First: " & firstColor & "<br>");
                            writeOutput("Last: " & lastColor);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Product Catalog Access</h4>
                    <div class="code-block">
// Access product information by position
productList = "laptop:999.99:in stock,keyboard:49.99:low stock,mouse:25.50:out of stock";
productPosition = 2; // Get keyboard info

productInfo = ListGetAt(productList, productPosition);
productName = ListFirst(productInfo, ":");
productPrice = ListGetAt(productInfo, 2, ":");
productStatus = ListLast(productInfo, ":");

writeOutput("Product list: " & productList & "<br>");
writeOutput("Product at position " & productPosition & ": " & productInfo);

writeOutput("<br><br><strong>Product Details:</strong><br>");
writeOutput("Name: " & productName & "<br>");
writeOutput("Price: $" & productPrice & "<br>");
writeOutput("Status: " & productStatus);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Access product information by position
                        productList = "laptop:999.99:in stock,keyboard:49.99:low stock,mouse:25.50:out of stock";
                        productPosition = 2; // Get keyboard info

                        productInfo = ListGetAt(productList, productPosition);
                        productName = ListFirst(productInfo, ":");
                        productPrice = ListGetAt(productInfo, 2, ":");
                        productStatus = ListLast(productInfo, ":");

                        writeOutput("Product list: " & productList & "<br>");
                        writeOutput("Product at position " & productPosition & ": " & productInfo);

                        writeOutput("<br><br><strong>Product Details:</strong><br>");
                        writeOutput("Name: " & productName & "<br>");
                        writeOutput("Price: $" & productPrice & "<br>");
                        writeOutput("Status: " & productStatus);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Menu System</h4>
                    <div class="code-block">
// Access menu items by position
menuItems = "Home,Products,About,Contact,Support";
selectedPosition = 3; // User selected "About"

selectedItem = ListGetAt(menuItems, selectedPosition);

writeOutput("Menu items: " & menuItems & "<br>");
writeOutput("Selected position: " & selectedPosition & "<br>");
writeOutput("Selected item: " & selectedItem);

// Generate navigation links
writeOutput("<br><br><strong>Navigation Menu:</strong><br>");
for (i = 1; i <= ListLen(menuItems); i++) {
    item = ListGetAt(menuItems, i);
    if (i == selectedPosition) {
        writeOutput("<strong>" & item & "</strong> (current)<br>");
    } else {
        writeOutput("<a href='/" & lCase(item) & "'>" & item & "</a><br>");
    }
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Access menu items by position
                        menuItems = "Home,Products,About,Contact,Support";
                        selectedPosition = 3; // User selected "About"

                        selectedItem = ListGetAt(menuItems, selectedPosition);

                        writeOutput("Menu items: " & menuItems & "<br>");
                        writeOutput("Selected position: " & selectedPosition & "<br>");
                        writeOutput("Selected item: " & selectedItem);

                        // Generate navigation links
                        writeOutput("<br><br><strong>Navigation Menu:</strong><br>");
                        for (i = 1; i <= ListLen(menuItems); i++) {
                            item = ListGetAt(menuItems, i);
                            if (i == selectedPosition) {
                                writeOutput("<strong>" & item & "</strong> (current)<br>");
                            } else {
                                writeOutput("<a href='/" & lCase(item) & "'>" & item & "</a><br>");
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