<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListDeleteAt - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListDeleteAt</h1>
            <p>Removes an element at a specific position in a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListDeleteAt</strong> removes an element at a specified position in a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Removing items from specific positions in lists</li>
                        <li>Cleaning up data by removing unwanted elements</li>
                        <li>Managing dynamic lists where items need to be removed</li>
                        <li>Processing lists by removing processed items</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListDeleteAt(list, position [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Remove item at position 2
originalList = "apple,banana,orange,grape";
newList = ListDeleteAt(originalList, 2);
writeOutput("Original: " & originalList & "<br>");
writeOutput("After deletion: " & newList);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Remove item at position 2
                            originalList = "apple,banana,orange,grape";
                            newList = ListDeleteAt(originalList, 2);
                            writeOutput("Original: " & originalList & "<br>");
                            writeOutput("After deletion: " & newList);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Remove First and Last</h4>
                        <div class="code-block">
// Remove first and last items
fruits = "apple,banana,orange,grape";
noFirst = ListDeleteAt(fruits, 1);
noLast = ListDeleteAt(fruits, ListLen(fruits));

writeOutput("Original: " & fruits & "<br>");
writeOutput("No first: " & noFirst & "<br>");
writeOutput("No last: " & noLast);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Remove first and last items
                            fruits = "apple,banana,orange,grape";
                            noFirst = ListDeleteAt(fruits, 1);
                            noLast = ListDeleteAt(fruits, ListLen(fruits));

                            writeOutput("Original: " & fruits & "<br>");
                            writeOutput("No first: " & noFirst & "<br>");
                            writeOutput("No last: " & noLast);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Shopping Cart Management</h4>
                    <div class="code-block">
// Remove item from shopping cart
cartItems = "laptop,keyboard,mouse,monitor,headphones";
itemToRemove = 3; // Remove mouse

// Get item name before removal
itemName = ListGetAt(cartItems, itemToRemove);
updatedCart = ListDeleteAt(cartItems, itemToRemove);

writeOutput("Original cart: " & cartItems & "<br>");
writeOutput("Removed item: " & itemName & "<br>");
writeOutput("Updated cart: " & updatedCart);

// Calculate new total
writeOutput("<br><br><strong>Cart Summary:</strong><br>");
writeOutput("Items remaining: " & ListLen(updatedCart) & "<br>");
for (i = 1; i <= ListLen(updatedCart); i++) {
    item = ListGetAt(updatedCart, i);
    writeOutput(i & ". " & item & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Remove item from shopping cart
                        cartItems = "laptop,keyboard,mouse,monitor,headphones";
                        itemToRemove = 3; // Remove mouse

                        // Get item name before removal
                        itemName = ListGetAt(cartItems, itemToRemove);
                        updatedCart = ListDeleteAt(cartItems, itemToRemove);

                        writeOutput("Original cart: " & cartItems & "<br>");
                        writeOutput("Removed item: " & itemName & "<br>");
                        writeOutput("Updated cart: " & updatedCart);

                        // Calculate new total
                        writeOutput("<br><br><strong>Cart Summary:</strong><br>");
                        writeOutput("Items remaining: " & ListLen(updatedCart) & "<br>");
                        for (i = 1; i <= ListLen(updatedCart); i++) {
                            item = ListGetAt(updatedCart, i);
                            writeOutput(i & ". " & item & "<br>");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Task List Management</h4>
                    <div class="code-block">
// Remove completed tasks from list
taskList = "urgent:fix bug,normal:write docs,low:clean desk,urgent:deploy app";
completedTask = 2; // Complete "write docs"

// Get task details before removal
taskDetails = ListGetAt(taskList, completedTask);
updatedTasks = ListDeleteAt(taskList, completedTask);

writeOutput("Original tasks: " & taskList & "<br>");
writeOutput("Completed: " & taskDetails & "<br>");
writeOutput("Remaining: " & updatedTasks);

// Show remaining tasks by priority
writeOutput("<br><br><strong>Remaining Tasks:</strong><br>");
urgentCount = 0;
normalCount = 0;
lowCount = 0;

for (i = 1; i <= ListLen(updatedTasks); i++) {
    task = ListGetAt(updatedTasks, i);
    priority = ListFirst(task, ":");
    description = ListLast(task, ":");
    
    switch(priority) {
        case "urgent":
            urgentCount++;
            writeOutput("🚨 " & description & " (URGENT)<br>");
            break;
        case "normal":
            normalCount++;
            writeOutput("📋 " & description & " (NORMAL)<br>");
            break;
        case "low":
            lowCount++;
            writeOutput("📝 " & description & " (LOW)<br>");
            break;
    }
}

writeOutput("<br><strong>Summary:</strong> " & urgentCount & " urgent, " & normalCount & " normal, " & lowCount & " low priority");
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Remove completed tasks from list
                        taskList = "urgent:fix bug,normal:write docs,low:clean desk,urgent:deploy app";
                        completedTask = 2; // Complete "write docs"

                        // Get task details before removal
                        taskDetails = ListGetAt(taskList, completedTask);
                        updatedTasks = ListDeleteAt(taskList, completedTask);

                        writeOutput("Original tasks: " & taskList & "<br>");
                        writeOutput("Completed: " & taskDetails & "<br>");
                        writeOutput("Remaining: " & updatedTasks);

                        // Show remaining tasks by priority
                        writeOutput("<br><br><strong>Remaining Tasks:</strong><br>");
                        urgentCount = 0;
                        normalCount = 0;
                        lowCount = 0;

                        for (i = 1; i <= ListLen(updatedTasks); i++) {
                            task = ListGetAt(updatedTasks, i);
                            priority = ListFirst(task, ":");
                            description = ListLast(task, ":");
                            
                            switch(priority) {
                                case "urgent":
                                    urgentCount++;
                                    writeOutput("🚨 " & description & " (URGENT)<br>");
                                    break;
                                case "normal":
                                    normalCount++;
                                    writeOutput("📋 " & description & " (NORMAL)<br>");
                                    break;
                                case "low":
                                    lowCount++;
                                    writeOutput("📝 " & description & " (LOW)<br>");
                                    break;
                            }
                        }

                        writeOutput("<br><strong>Summary:</strong> " & urgentCount & " urgent, " & normalCount & " normal, " & lowCount & " low priority");
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