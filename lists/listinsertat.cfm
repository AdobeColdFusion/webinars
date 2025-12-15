<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListInsertAt - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListInsertAt</h1>
            <p>Inserts an element at a specific position in a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListInsertAt</strong> inserts a new element at a specified position in a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Inserting items at specific positions in ordered lists</li>
                        <li>Adding items in the middle of existing lists</li>
                        <li>Maintaining sorted order by inserting at correct positions</li>
                        <li>Building hierarchical or categorized lists</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListInsertAt(list, position, value [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Insert item at position 2
originalList = "apple,orange,grape";
newList = ListInsertAt(originalList, 2, "banana");
writeOutput("Original: " & originalList & "<br>");
writeOutput("New: " & newList);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Insert item at position 2
                            originalList = "apple,orange,grape";
                            newList = ListInsertAt(originalList, 2, "banana");
                            writeOutput("Original: " & originalList & "<br>");
                            writeOutput("New: " & newList);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Insert at End</h4>
                        <div class="code-block">
// Insert at the end (position 4)
fruits = "apple,banana,orange";
newFruits = ListInsertAt(fruits, 4, "grape");
writeOutput("Original: " & fruits & "<br>");
writeOutput("New: " & newFruits);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Insert at the end (position 4)
                            fruits = "apple,banana,orange";
                            newFruits = ListInsertAt(fruits, 4, "grape");
                            writeOutput("Original: " & fruits & "<br>");
                            writeOutput("New: " & newFruits);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Menu Organization</h4>
                    <div class="code-block">
// Insert new menu item in alphabetical order
menuItems = "appetizer,main course,dessert";
newItem = "beverage";
// Insert beverage between appetizer and main course
updatedMenu = ListInsertAt(menuItems, 2, newItem);

writeOutput("Original menu: " & menuItems & "<br>");
writeOutput("Updated menu: " & updatedMenu);

// Display numbered menu
writeOutput("<br><br><strong>Restaurant Menu:</strong><br>");
for (i = 1; i <= ListLen(updatedMenu); i++) {
    item = ListGetAt(updatedMenu, i);
    writeOutput(i & ". " & uCase(item) & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Insert new menu item in alphabetical order
                        menuItems = "appetizer,main course,dessert";
                        newItem = "beverage";
                        // Insert beverage between appetizer and main course
                        updatedMenu = ListInsertAt(menuItems, 2, newItem);

                        writeOutput("Original menu: " & menuItems & "<br>");
                        writeOutput("Updated menu: " & updatedMenu);

                        // Display numbered menu
                        writeOutput("<br><br><strong>Restaurant Menu:</strong><br>");
                        for (i = 1; i <= ListLen(updatedMenu); i++) {
                            item = ListGetAt(updatedMenu, i);
                            writeOutput(i & ". " & uCase(item) & "<br>");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Priority Task Management</h4>
                    <div class="code-block">
// Insert urgent task at specific priority level
taskList = "low:clean desk,high:submit report,medium:review code";
urgentTask = "critical:server down";
// Insert at position 2 (after first task)
updatedTasks = ListInsertAt(taskList, 2, urgentTask);

writeOutput("Original tasks: " & taskList & "<br>");
writeOutput("Updated tasks: " & updatedTasks);

// Process tasks by priority
writeOutput("<br><br><strong>Task Processing Order:</strong><br>");
for (i = 1; i <= ListLen(updatedTasks); i++) {
    task = ListGetAt(updatedTasks, i);
    priority = ListFirst(task, ":");
    description = ListLast(task, ":");
    
    switch(priority) {
        case "critical":
            writeOutput("🚨 " & description & " (CRITICAL)<br>");
            break;
        case "high":
            writeOutput("⚠️ " & description & " (HIGH)<br>");
            break;
        case "medium":
            writeOutput("📋 " & description & " (MEDIUM)<br>");
            break;
        case "low":
            writeOutput("📝 " & description & " (LOW)<br>");
            break;
    }
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Insert urgent task at specific priority level
                        taskList = "low:clean desk,high:submit report,medium:review code";
                        urgentTask = "critical:server down";
                        // Insert at position 2 (after first task)
                        updatedTasks = ListInsertAt(taskList, 2, urgentTask);

                        writeOutput("Original tasks: " & taskList & "<br>");
                        writeOutput("Updated tasks: " & updatedTasks);

                        // Process tasks by priority
                        writeOutput("<br><br><strong>Task Processing Order:</strong><br>");
                        for (i = 1; i <= ListLen(updatedTasks); i++) {
                            task = ListGetAt(updatedTasks, i);
                            priority = ListFirst(task, ":");
                            description = ListLast(task, ":");
                            
                            switch(priority) {
                                case "critical":
                                    writeOutput("🚨 " & description & " (CRITICAL)<br>");
                                    break;
                                case "high":
                                    writeOutput("⚠️ " & description & " (HIGH)<br>");
                                    break;
                                case "medium":
                                    writeOutput("📋 " & description & " (MEDIUM)<br>");
                                    break;
                                case "low":
                                    writeOutput("📝 " & description & " (LOW)<br>");
                                    break;
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