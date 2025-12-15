<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListFilter - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListFilter</h1>
            <p>Filters list elements based on a callback function</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListFilter</strong> creates a new list containing only elements that pass a test function. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Removing invalid or unwanted items from lists</li>
                        <li>Filtering data based on specific criteria</li>
                        <li>Data validation and cleaning</li>
                        <li>Creating subsets of data for processing</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListFilter(list, callback [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage - Filter Even Numbers</h4>
                        <div class="code-block">
// Filter even numbers only
numbers = "1,2,3,4,5,6,7,8,9,10";
evenNumbers = ListFilter(numbers, function(item) {
    return val(item) % 2 == 0;
});
writeOutput("Original: " & numbers & "<br>");
writeOutput("Even only: " & evenNumbers);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Filter even numbers only
                            numbers = "1,2,3,4,5,6,7,8,9,10";
                            evenNumbers = ListFilter(numbers, function(item) {
                                return val(item) % 2 == 0;
                            });
                            writeOutput("Original: " & numbers & "<br>");
                            writeOutput("Even only: " & evenNumbers);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Filter by Length</h4>
                        <div class="code-block">
// Filter words longer than 4 characters
words = "cat,dog,elephant,bird,fish,rhinoceros";
longWords = ListFilter(words, function(word) {
    return len(word) > 4;
});
writeOutput("Original: " & words & "<br>");
writeOutput("Long words: " & longWords);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Filter words longer than 4 characters
                            words = "cat,dog,elephant,bird,fish,rhinoceros";
                            longWords = ListFilter(words, function(word) {
                                return len(word) > 4;
                            });
                            writeOutput("Original: " & words & "<br>");
                            writeOutput("Long words: " & longWords);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Email Validation</h4>
                    <div class="code-block">
// Filter valid email addresses
emailList = "john@company.com,invalid-email,jane@company.com,not-an-email,bob@company.com";
validEmails = ListFilter(emailList, function(email) {
    return find("@", email) > 0 && find(".", email) > find("@", email);
});
writeOutput("Original: " & emailList & "<br>");
writeOutput("Valid emails: " & validEmails);

// Count valid vs invalid
totalEmails = ListLen(emailList);
validCount = ListLen(validEmails);
invalidCount = totalEmails - validCount;

writeOutput("<br><br><strong>Email Validation Results:</strong><br>");
writeOutput("Total emails: " & totalEmails & "<br>");
writeOutput("Valid emails: " & validCount & "<br>");
writeOutput("Invalid emails: " & invalidCount);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Filter valid email addresses
                        emailList = "john@company.com,invalid-email,jane@company.com,not-an-email,bob@company.com";
                        validEmails = ListFilter(emailList, function(email) {
                            return find("@", email) > 0 && find(".", email) > find("@", email);
                        });
                        writeOutput("Original: " & emailList & "<br>");
                        writeOutput("Valid emails: " & validEmails);

                        // Count valid vs invalid
                        totalEmails = ListLen(emailList);
                        validCount = ListLen(validEmails);
                        invalidCount = totalEmails - validCount;

                        writeOutput("<br><br><strong>Email Validation Results:</strong><br>");
                        writeOutput("Total emails: " & totalEmails & "<br>");
                        writeOutput("Valid emails: " & validCount & "<br>");
                        writeOutput("Invalid emails: " & invalidCount);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Product Inventory Filter</h4>
                    <div class="code-block">
// Filter products by price range
productData = "Laptop:999.99,Keyboard:49.99,Mouse:25.50,Monitor:299.99,Headphones:79.99";
expensiveProducts = ListFilter(productData, function(product) {
    price = val(ListLast(product, ":"));
    return price > 100;
});
writeOutput("Original: " & productData & "<br>");
writeOutput("Expensive (>$100): " & expensiveProducts);

// Filter by category
writeOutput("<br><br><strong>Product Analysis:</strong><br>");
expensiveCount = ListLen(expensiveProducts);
totalProducts = ListLen(productData);
writeOutput("Total products: " & totalProducts & "<br>");
writeOutput("Expensive products: " & expensiveCount & "<br>");
writeOutput("Affordable products: " & (totalProducts - expensiveCount));
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Filter products by price range
                        productData = "Laptop:999.99,Keyboard:49.99,Mouse:25.50,Monitor:299.99,Headphones:79.99";
                        expensiveProducts = ListFilter(productData, function(product) {
                            price = val(ListLast(product, ":"));
                            return price > 100;
                        });
                        writeOutput("Original: " & productData & "<br>");
                        writeOutput("Expensive (>$100): " & expensiveProducts);

                        // Filter by category
                        writeOutput("<br><br><strong>Product Analysis:</strong><br>");
                        expensiveCount = ListLen(expensiveProducts);
                        totalProducts = ListLen(productData);
                        writeOutput("Total products: " & totalProducts & "<br>");
                        writeOutput("Expensive products: " & expensiveCount & "<br>");
                        writeOutput("Affordable products: " & (totalProducts - expensiveCount));
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Type Filtering</h4>
                    <div class="code-block">
// Filter files by extension
fileList = "config.cfm,readme.txt,index.cfm,styles.css,script.js,data.pdf,image.jpg";
webFiles = ListFilter(fileList, function(file) {
    ext = lCase(ListLast(file, "."));
    return ext == "cfm" || ext == "css" || ext == "js";
});
writeOutput("Original: " & fileList & "<br>");
writeOutput("Web files: " & webFiles);

// Filter by file size (simulated)
fileSizes = "config.cfm:2.5KB,readme.txt:1.2KB,index.cfm:15.7KB,styles.css:8.3KB,script.js:12.1KB";
largeFiles = ListFilter(fileSizes, function(fileSize) {
    size = val(ListLast(fileSize, ":"));
    return size > 5;
});
writeOutput("<br><br>Large files (>5KB): " & largeFiles);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Filter files by extension
                        fileList = "config.cfm,readme.txt,index.cfm,styles.css,script.js,data.pdf,image.jpg";
                        webFiles = ListFilter(fileList, function(file) {
                            ext = lCase(ListLast(file, "."));
                            return ext == "cfm" || ext == "css" || ext == "js";
                        });
                        writeOutput("Original: " & fileList & "<br>");
                        writeOutput("Web files: " & webFiles);

                        // Filter by file size (simulated)
                        fileSizes = "config.cfm:2.5KB,readme.txt:1.2KB,index.cfm:15.7KB,styles.css:8.3KB,script.js:12.1KB";
                        largeFiles = ListFilter(fileSizes, function(fileSize) {
                            size = val(ListLast(fileSize, ":"));
                            return size > 5;
                        });
                        writeOutput("<br><br>Large files (>5KB): " & largeFiles);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Permission Filtering</h4>
                    <div class="code-block">
// Filter users by permission level
userPermissions = "admin:John,viewer:Jane,editor:Bob,admin:Alice,viewer:Charlie";
adminUsers = ListFilter(userPermissions, function(userPerm) {
    permission = ListFirst(userPerm, ":");
    return permission == "admin";
});
writeOutput("Original: " & userPermissions & "<br>");
writeOutput("Admin users: " & adminUsers);

// Extract admin names only
adminNames = ListMap(adminUsers, function(adminUser) {
    return ListLast(adminUser, ":");
});
writeOutput("<br><br>Admin names: " & adminNames);

// Count by permission level
writeOutput("<br><br><strong>Permission Summary:</strong><br>");
totalUsers = ListLen(userPermissions);
adminCount = ListLen(adminUsers);
writeOutput("Total users: " & totalUsers & "<br>");
writeOutput("Admin users: " & adminCount & "<br>");
writeOutput("Regular users: " & (totalUsers - adminCount));
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Filter users by permission level
                        userPermissions = "admin:John,viewer:Jane,editor:Bob,admin:Alice,viewer:Charlie";
                        adminUsers = ListFilter(userPermissions, function(userPerm) {
                            permission = ListFirst(userPerm, ":");
                            return permission == "admin";
                        });
                        writeOutput("Original: " & userPermissions & "<br>");
                        writeOutput("Admin users: " & adminUsers);

                        // Extract admin names only
                        adminNames = ListMap(adminUsers, function(adminUser) {
                            return ListLast(adminUser, ":");
                        });
                        writeOutput("<br><br>Admin names: " & adminNames);

                        // Count by permission level
                        writeOutput("<br><br><strong>Permission Summary:</strong><br>");
                        totalUsers = ListLen(userPermissions);
                        adminCount = ListLen(adminUsers);
                        writeOutput("Total users: " & totalUsers & "<br>");
                        writeOutput("Admin users: " & adminCount & "<br>");
                        writeOutput("Regular users: " & (totalUsers - adminCount));
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