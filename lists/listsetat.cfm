<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListSetAt - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListSetAt</h1>
            <p>Replaces an element at a specific position in a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListSetAt</strong> replaces an element at a specified position in a list with a new value. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Updating specific items in lists</li>
                        <li>Correcting data in specific positions</li>
                        <li>Modifying list elements without changing order</li>
                        <li>Replacing placeholder values with actual data</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListSetAt(list, position, value [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Replace item at position 2
originalList = "apple,banana,orange,grape";
newList = ListSetAt(originalList, 2, "pear");
writeOutput("Original: " & originalList & "<br>");
writeOutput("Updated: " & newList);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Replace item at position 2
                            originalList = "apple,banana,orange,grape";
                            newList = ListSetAt(originalList, 2, "pear");
                            writeOutput("Original: " & originalList & "<br>");
                            writeOutput("Updated: " & newList);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Update Multiple Positions</h4>
                        <div class="code-block">
// Update first and last items
fruits = "apple,banana,orange,grape";
updated1 = ListSetAt(fruits, 1, "mango");
updated2 = ListSetAt(updated1, ListLen(updated1), "kiwi");

writeOutput("Original: " & fruits & "<br>");
writeOutput("After first update: " & updated1 & "<br>");
writeOutput("After second update: " & updated2);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Update first and last items
                            fruits = "apple,banana,orange,grape";
                            updated1 = ListSetAt(fruits, 1, "mango");
                            updated2 = ListSetAt(updated1, ListLen(updated1), "kiwi");

                            writeOutput("Original: " & fruits & "<br>");
                            writeOutput("After first update: " & updated1 & "<br>");
                            writeOutput("After second update: " & updated2);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Product Price Updates</h4>
                    <div class="code-block">
// Update product prices
productData = "laptop:999.99,keyboard:49.99,mouse:25.50,monitor:299.99";
// Update keyboard price (position 2)
updatedData = ListSetAt(productData, 2, "keyboard:59.99");

writeOutput("Original prices: " & productData & "<br>");
writeOutput("Updated prices: " & updatedData);

// Display price comparison
writeOutput("<br><br><strong>Price Changes:</strong><br>");
for (i = 1; i <= ListLen(productData); i++) {
    original = ListGetAt(productData, i);
    updated = ListGetAt(updatedData, i);
    
    if (original != updated) {
        product = ListFirst(original, ":");
        oldPrice = ListLast(original, ":");
        newPrice = ListLast(updated, ":");
        writeOutput(product & ": $" & oldPrice & " → $" & newPrice & "<br>");
    }
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Update product prices
                        productData = "laptop:999.99,keyboard:49.99,mouse:25.50,monitor:299.99";
                        // Update keyboard price (position 2)
                        updatedData = ListSetAt(productData, 2, "keyboard:59.99");

                        writeOutput("Original prices: " & productData & "<br>");
                        writeOutput("Updated prices: " & updatedData);

                        // Display price comparison
                        writeOutput("<br><br><strong>Price Changes:</strong><br>");
                        for (i = 1; i <= ListLen(productData); i++) {
                            original = ListGetAt(productData, i);
                            updated = ListGetAt(updatedData, i);
                            
                            if (original != updated) {
                                product = ListFirst(original, ":");
                                oldPrice = ListLast(original, ":");
                                newPrice = ListLast(updated, ":");
                                writeOutput(product & ": $" & oldPrice & " → $" & newPrice & "<br>");
                            }
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Status Updates</h4>
                    <div class="code-block">
// Update user status in list
userList = "john:active,jane:inactive,bob:active,alice:pending";
// Update jane's status to active (position 2)
updatedUsers = ListSetAt(userList, 2, "jane:active");

writeOutput("Original status: " & userList & "<br>");
writeOutput("Updated status: " & updatedUsers);

// Count active users
writeOutput("<br><br><strong>User Status Summary:</strong><br>");
activeCount = 0;
inactiveCount = 0;
pendingCount = 0;

for (i = 1; i <= ListLen(updatedUsers); i++) {
    user = ListGetAt(updatedUsers, i);
    username = ListFirst(user, ":");
    status = ListLast(user, ":");
    
    switch(status) {
        case "active":
            activeCount++;
            writeOutput("✅ " & username & " (" & status & ")<br>");
            break;
        case "inactive":
            inactiveCount++;
            writeOutput("❌ " & username & " (" & status & ")<br>");
            break;
        case "pending":
            pendingCount++;
            writeOutput("⏳ " & username & " (" & status & ")<br>");
            break;
    }
}

writeOutput("<br><strong>Summary:</strong> " & activeCount & " active, " & inactiveCount & " inactive, " & pendingCount & " pending");
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Update user status in list
                        userList = "john:active,jane:inactive,bob:active,alice:pending";
                        // Update jane's status to active (position 2)
                        updatedUsers = ListSetAt(userList, 2, "jane:active");

                        writeOutput("Original status: " & userList & "<br>");
                        writeOutput("Updated status: " & updatedUsers);

                        // Count active users
                        writeOutput("<br><br><strong>User Status Summary:</strong><br>");
                        activeCount = 0;
                        inactiveCount = 0;
                        pendingCount = 0;

                        for (i = 1; i <= ListLen(updatedUsers); i++) {
                            user = ListGetAt(updatedUsers, i);
                            username = ListFirst(user, ":");
                            status = ListLast(user, ":");
                            
                            switch(status) {
                                case "active":
                                    activeCount++;
                                    writeOutput("✅ " & username & " (" & status & ")<br>");
                                    break;
                                case "inactive":
                                    inactiveCount++;
                                    writeOutput("❌ " & username & " (" & status & ")<br>");
                                    break;
                                case "pending":
                                    pendingCount++;
                                    writeOutput("⏳ " & username & " (" & status & ")<br>");
                                    break;
                            }
                        }

                        writeOutput("<br><strong>Summary:</strong> " & activeCount & " active, " & inactiveCount & " inactive, " & pendingCount & " pending");
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