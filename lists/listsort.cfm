<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListSort - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListSort</h1>
            <p>Sorts a list in ascending or descending order</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListSort</strong> sorts the elements in a list alphabetically or numerically. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Displaying data in alphabetical order</li>
                        <li>Sorting user selections or preferences</li>
                        <li>Organizing file lists or menu items</li>
                        <li>Preparing data for reports or exports</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListSort(list [, sortType] [, sortOrder] [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage - Alphabetical</h4>
                        <div class="code-block">
// Sort alphabetically (default)
fruits = "orange,apple,banana,grape";
                            sortedFruits = ListSort(fruits, "text");
writeOutput("Original: " & fruits & "<br>");
writeOutput("Sorted: " & sortedFruits);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Sort alphabetically (default)
                            fruits = "orange,apple,banana,grape";
                            sortedFruits = ListSort(fruits,"text");
                            writeOutput("Original: " & fruits & "<br>");
                            writeOutput("Sorted: " & sortedFruits);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Reverse Order</h4>
                        <div class="code-block">
// Sort in descending order
colors = "red,blue,green,yellow";
reverseColors = ListSort(colors, "text", "desc");
writeOutput("Original: " & colors & "<br>");
writeOutput("Reverse: " & reverseColors);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Sort in descending order
                            colors = "red,blue,green,yellow";
                            reverseColors = ListSort(colors, "text", "desc");
                            writeOutput("Original: " & colors & "<br>");
                            writeOutput("Reverse: " & reverseColors);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Numeric Sorting</h4>
                    <div class="code-block">
// Sort numbers numerically
numbers = "10,2,25,1,100";
numericSorted = ListSort(numbers, "numeric");
writeOutput("Original: " & numbers & "<br>");
writeOutput("Numeric: " & numericSorted);

// Sort numbers in descending order
reverseNumeric = ListSort(numbers, "numeric", "desc");
writeOutput("<br><br>Reverse numeric: " & reverseNumeric);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Sort numbers numerically
                        numbers = "10,2,25,1,100";
                        numericSorted = ListSort(numbers, "numeric");
                        writeOutput("Original: " & numbers & "<br>");
                        writeOutput("Numeric: " & numericSorted);

                        // Sort numbers in descending order
                        reverseNumeric = ListSort(numbers, "numeric", "desc");
                        writeOutput("<br><br>Reverse numeric: " & reverseNumeric);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Management</h4>
                    <div class="code-block">
// Sort user names for display
userNames = "Smith,John,Johnson,Mary,Williams,David";
sortedUsers = ListSort(userNames, "text");
writeOutput("Original: " & userNames & "<br>");
writeOutput("Sorted: " & sortedUsers);

// Create numbered user list
writeOutput("<br><br><strong>User Directory:</strong><br>");
for (i = 1; i <= ListLen(sortedUsers); i++) {
    userName = ListGetAt(sortedUsers, i);
    writeOutput(i & ". " & userName & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Sort user names for display
                        userNames = "Smith,John,Johnson,Mary,Williams,David";
                        sortedUsers = ListSort(userNames, "text");
                        writeOutput("Original: " & userNames & "<br>");
                        writeOutput("Sorted: " & sortedUsers);

                        // Create numbered user list
                        writeOutput("<br><br><strong>User Directory:</strong><br>");
                        for (i = 1; i <= ListLen(sortedUsers); i++) {
                            userName = ListGetAt(sortedUsers, i);
                            writeOutput(i & ". " & userName & "<br>");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Product Catalog</h4>
                    <div class="code-block">
// Sort products by price
productData = "Laptop:999.99,Keyboard:49.99,Mouse:25.50,Monitor:299.99";
sortedProducts = ListSort(productData, "text");

writeOutput("Original: " & productData & "<br>");
writeOutput("Sorted: " & sortedProducts);

// Display sorted product catalog
writeOutput("<br><br><strong>Product Catalog (A-Z):</strong><br>");
for (i = 1; i <= ListLen(sortedProducts); i++) {
    product = ListGetAt(sortedProducts, i);
    name = ListFirst(product, ":");
    price = ListLast(product, ":");
    writeOutput(name & " - $" & price & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Sort products by price
                        productData = "Laptop:999.99,Keyboard:49.99,Mouse:25.50,Monitor:299.99";
                        sortedProducts = ListSort(productData, "text", "asc");

                        writeOutput("Original: " & productData & "<br>");
                        writeOutput("Sorted: " & sortedProducts);

                        // Display sorted product catalog
                        writeOutput("<br><br><strong>Product Catalog (A-Z):</strong><br>");
                        for (i = 1; i <= ListLen(sortedProducts); i++) {
                            product = ListGetAt(sortedProducts, i);
                            name = ListFirst(product, ":");
                            price = ListLast(product, ":");
                            writeOutput(name & " - $" & price & "<br>");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Management</h4>
                    <div class="code-block">
// Sort files by name and extension
fileList = "config.cfm,readme.txt,index.cfm,styles.css,script.js";
sortedFiles = ListSort(fileList, "text" );

writeOutput("Original: " & fileList & "<br>");
writeOutput("Sorted: " & sortedFiles);

// Group files by extension
writeOutput("<br><br><strong>Files by Extension:</strong><br>");
cfmFiles = "";
cssFiles = "";
jsFiles = "";
txtFiles = "";

for (i = 1; i <= ListLen(sortedFiles); i++) {
    file = ListGetAt(sortedFiles, i);
    ext = ListLast(file, ".");
    
    switch(ext) {
        case "cfm":
            cfmFiles = ListAppend(cfmFiles, file);
            break;
        case "css":
            cssFiles = ListAppend(cssFiles, file);
            break;
        case "js":
            jsFiles = ListAppend(jsFiles, file);
            break;
        case "txt":
            txtFiles = ListAppend(txtFiles, file);
            break;
    }
}

if (len(cfmFiles) > 0) writeOutput("<strong>CFM Files:</strong> " & cfmFiles & "<br>");
if (len(cssFiles) > 0) writeOutput("<strong>CSS Files:</strong> " & cssFiles & "<br>");
if (len(jsFiles) > 0) writeOutput("<strong>JS Files:</strong> " & jsFiles & "<br>");
if (len(txtFiles) > 0) writeOutput("<strong>TXT Files:</strong> " & txtFiles & "<br>");
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Sort files by name and extension
                        fileList = "config.cfm,readme.txt,index.cfm,styles.css,script.js";
                        sortedFiles = ListSort(fileList, "text");

                        writeOutput("Original: " & fileList & "<br>");
                        writeOutput("Sorted: " & sortedFiles);

                        // Group files by extension
                        writeOutput("<br><br><strong>Files by Extension:</strong><br>");
                        cfmFiles = "";
                        cssFiles = "";
                        jsFiles = "";
                        txtFiles = "";

                        // Work with the original list directly
                        for (i = 1; i <= ListLen(fileList); i++) {
                            filename = "";
                            
                            file = ListGetAt(fileList, i, ",");
                            if (find(".", filename) > 0) {
                                ext = ListLast(filename, ".");
                                
                                switch(ext) {
                                    case "cfm":
                                        cfmFiles = ListAppend(cfmFiles, filename);
                                        break;
                                    case "css":
                                        cssFiles = ListAppend(cssFiles, filename);
                                        break;
                                    case "js":
                                        jsFiles = ListAppend(jsFiles, filename);
                                        break;
                                    case "txt":
                                        txtFiles = ListAppend(txtFiles, filename);
                                        break;
                                }
                            }
                        }

                        if (len(cfmFiles) > 0) writeOutput("<strong>CFM Files:</strong> " & cfmFiles & "<br>");
                        if (len(cssFiles) > 0) writeOutput("<strong>CSS Files:</strong> " & cssFiles & "<br>");
                        if (len(jsFiles) > 0) writeOutput("<strong>JS Files:</strong> " & jsFiles & "<br>");
                        if (len(txtFiles) > 0) writeOutput("<strong>TXT Files:</strong> " & txtFiles & "<br>");
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Priority Queue</h4>
                    <div class="code-block">
// Sort tasks by priority
taskList = "Low:Clean desk,High:Submit report,Medium:Review code,High:Call client";
sortedTasks = ListSort(taskList, "text");

writeOutput("Original: " & taskList & "<br>");
writeOutput("Sorted: " & sortedTasks);

// Display tasks by priority
writeOutput("<br><br><strong>Task Priority List:</strong><br>");
highTasks = "";
mediumTasks = "";
lowTasks = "";

for (i = 1; i <= ListLen(sortedTasks); i++) {
    task = ListGetAt(sortedTasks, i);
    priority = ListFirst(task, ":");
    description = ListLast(task, ":");
    
    switch(priority) {
        case "High":
            highTasks = ListAppend(highTasks, description);
            break;
        case "Medium":
            mediumTasks = ListAppend(mediumTasks, description);
            break;
        case "Low":
            lowTasks = ListAppend(lowTasks, description);
            break;
    }
}

if (len(highTasks) > 0) {
    writeOutput("<strong>High Priority:</strong><br>");
    for (j = 1; j <= ListLen(highTasks); j++) {
        writeOutput("• " & ListGetAt(highTasks, j) & "<br>");
    }
}

if (len(mediumTasks) > 0) {
    writeOutput("<strong>Medium Priority:</strong><br>");
    for (j = 1; j <= ListLen(mediumTasks); j++) {
        writeOutput("• " & ListGetAt(mediumTasks, j) & "<br>");
    }
}

if (len(lowTasks) > 0) {
    writeOutput("<strong>Low Priority:</strong><br>");
    for (j = 1; j <= ListLen(lowTasks); j++) {
        writeOutput("• " & ListGetAt(lowTasks, j) & "<br>");
    }
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Sort tasks by priority
                        taskList = "Low:Clean desk,High:Submit report,Medium:Review code,High:Call client";
                        sortedTasks = ListSort(taskList, "text", "asc");

                        writeOutput("Original: " & taskList & "<br>");
                        writeOutput("Sorted: " & sortedTasks);

                        // Display tasks by priority
                        writeOutput("<br><br><strong>Task Priority List:</strong><br>");
                        highTasks = "";
                        mediumTasks = "";
                        lowTasks = "";

                        for (i = 1; i <= ListLen(sortedTasks); i++) {
                            task = ListGetAt(sortedTasks, i);
                            priority = ListFirst(task, ":");
                            description = ListLast(task, ":");
                            
                            switch(priority) {
                                case "High":
                                    highTasks = ListAppend(highTasks, description);
                                    break;
                                case "Medium":
                                    mediumTasks = ListAppend(mediumTasks, description);
                                    break;
                                case "Low":
                                    lowTasks = ListAppend(lowTasks, description);
                                    break;
                            }
                        }

                        if (len(highTasks) > 0) {
                            writeOutput("<strong>High Priority:</strong><br>");
                            for (j = 1; j <= ListLen(highTasks); j++) {
                                writeOutput("• " & ListGetAt(highTasks, j) & "<br>");
                            }
                        }

                        if (len(mediumTasks) > 0) {
                            writeOutput("<strong>Medium Priority:</strong><br>");
                            for (j = 1; j <= ListLen(mediumTasks); j++) {
                                writeOutput("• " & ListGetAt(mediumTasks, j) & "<br>");
                            }
                        }

                        if (len(lowTasks) > 0) {
                            writeOutput("<strong>Low Priority:</strong><br>");
                            for (j = 1; j <= ListLen(lowTasks); j++) {
                                writeOutput("• " & ListGetAt(lowTasks, j) & "<br>");
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