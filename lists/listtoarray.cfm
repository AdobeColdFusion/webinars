<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListToArray - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListToArray</h1>
            <p>Converts a list to an array</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListToArray</strong> converts a delimited list into an array. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Converting form data to arrays for processing</li>
                        <li>Working with database query results</li>
                        <li>Data transformation between different formats</li>
                        <li>Array-based operations and manipulations</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListToArray(list [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Convert list to array
fruits = "apple,banana,orange,grape";
fruitArray = ListToArray(fruits);

writeOutput("Original list: " & fruits & "<br>");
writeOutput("Array length: " & arrayLen(fruitArray) & "<br>");
writeOutput("First element: " & fruitArray[1] & "<br>");
writeOutput("Last element: " & fruitArray[arrayLen(fruitArray)]);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Convert list to array
                            fruits = "apple,banana,orange,grape";
                            fruitArray = ListToArray(fruits);

                            writeOutput("Original list: " & fruits & "<br>");
                            writeOutput("Array length: " & arrayLen(fruitArray) & "<br>");
                            writeOutput("First element: " & fruitArray[1] & "<br>");
                            writeOutput("Last element: " & fruitArray[arrayLen(fruitArray)]);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Custom Delimiter</h4>
                        <div class="code-block">
// Convert pipe-delimited list to array
fileList = "config.txt|readme.md|index.cfm|styles.css";
fileArray = ListToArray(fileList, "|");

writeOutput("Original list: " & fileList & "<br>");
writeOutput("Array elements:<br>");
for (i = 1; i <= arrayLen(fileArray); i++) {
    writeOutput(i & ". " & fileArray[i] & "<br>");
}
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Convert pipe-delimited list to array
                            fileList = "config.txt|readme.md|index.cfm|styles.css";
                            fileArray = ListToArray(fileList, "|");

                            writeOutput("Original list: " & fileList & "<br>");
                            writeOutput("Array elements:<br>");
                            for (i = 1; i <= arrayLen(fileArray); i++) {
                                writeOutput(i & ". " & fileArray[i] & "<br>");
                            }
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Form Data Processing</h4>
                    <div class="code-block">
// Process form checkboxes
selectedCategories = "technology,business,sports,entertainment";
categoryArray = ListToArray(selectedCategories);

writeOutput("Selected categories: " & selectedCategories & "<br>");
writeOutput("Number of selections: " & arrayLen(categoryArray) & "<br>");

// Process each category
writeOutput("<br><strong>Processing categories:</strong><br>");
for (i = 1; i <= arrayLen(categoryArray); i++) {
    category = categoryArray[i];
    writeOutput("Processing: " & uCase(category) & "<br>");
}

// Create category links
writeOutput("<br><strong>Category links:</strong><br>");
for (i = 1; i <= arrayLen(categoryArray); i++) {
    category = categoryArray[i];
    writeOutput("<a href='/category/" & category & "'>" & category & "</a><br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Process form checkboxes
                        selectedCategories = "technology,business,sports,entertainment";
                        categoryArray = ListToArray(selectedCategories);

                        writeOutput("Selected categories: " & selectedCategories & "<br>");
                        writeOutput("Number of selections: " & arrayLen(categoryArray) & "<br>");

                        // Process each category
                        writeOutput("<br><strong>Processing categories:</strong><br>");
                        for (i = 1; i <= arrayLen(categoryArray); i++) {
                            category = categoryArray[i];
                            writeOutput("Processing: " & uCase(category) & "<br>");
                        }

                        // Create category links
                        writeOutput("<br><strong>Category links:</strong><br>");
                        for (i = 1; i <= arrayLen(categoryArray); i++) {
                            category = categoryArray[i];
                            writeOutput("<a href='/category/" & category & "'>" & category & "</a><br>");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Product Inventory Management</h4>
                    <div class="code-block">
// Process product data
productData = "Laptop:999.99:In Stock,Keyboard:49.99:Low Stock,Mouse:25.50:Out of Stock";
productArray = ListToArray(productData);

writeOutput("Product data: " & productData & "<br>");
writeOutput("Number of products: " & arrayLen(productArray) & "<br>");

// Create product objects
writeOutput("<br><strong>Product Inventory:</strong><br>");
for (i = 1; i <= arrayLen(productArray); i++) {
    productInfo = ListToArray(productArray[i], ":");
    name = productInfo[1];
    price = productInfo[2];
    status = productInfo[3];
    
    writeOutput("Product: " & name & "<br>");
    writeOutput("Price: $" & price & "<br>");
    writeOutput("Status: " & status & "<br><br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Process product data
                        productData = "Laptop:999.99:In Stock,Keyboard:49.99:Low Stock,Mouse:25.50:Out of Stock";
                        productArray = ListToArray(productData);

                        writeOutput("Product data: " & productData & "<br>");
                        writeOutput("Number of products: " & arrayLen(productArray) & "<br>");

                        // Create product objects
                        writeOutput("<br><strong>Product Inventory:</strong><br>");
                        for (i = 1; i <= arrayLen(productArray); i++) {
                            productInfo = ListToArray(productArray[i], ":");
                            name = productInfo[1];
                            price = productInfo[2];
                            status = productInfo[3];
                            
                            writeOutput("Product: " & name & "<br>");
                            writeOutput("Price: $" & price & "<br>");
                            writeOutput("Status: " & status & "<br><br>");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: User Session Management</h4>
                    <div class="code-block">
// Process user session data
sessionData = "userID:12345,username:john.doe,role:admin,lastLogin:2024-01-15";
sessionArray = ListToArray(sessionData);

writeOutput("Session data: " & sessionData & "<br>");
writeOutput("Session properties: " & arrayLen(sessionArray) & "<br>");

// Create session object
writeOutput("<br><strong>Session Information:</strong><br>");
sessionObject = {};

for (i = 1; i <= arrayLen(sessionArray); i++) {
    property = ListToArray(sessionArray[i], ":");
    key = property[1];
    value = property[2];
    sessionObject[key] = value;
    
    writeOutput(key & ": " & value & "<br>");
}

// Validate session
if (sessionObject.role == "admin") {
    writeOutput("<br>User has administrative privileges!");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Process user session data
                        sessionData = "userID:12345,username:john.doe,role:admin,lastLogin:2024-01-15";
                        sessionArray = ListToArray(sessionData);

                        writeOutput("Session data: " & sessionData & "<br>");
                        writeOutput("Session properties: " & arrayLen(sessionArray) & "<br>");

                        // Create session object
                        writeOutput("<br><strong>Session Information:</strong><br>");
                        sessionObject = {};

                        for (i = 1; i <= arrayLen(sessionArray); i++) {
                            property = ListToArray(sessionArray[i], ":");
                            key = property[1];
                            value = property[2];
                            sessionObject[key] = value;
                            
                            writeOutput(key & ": " & value & "<br>");
                        }

                        // Validate session
                        if (sessionObject.role == "admin") {
                            writeOutput("<br>User has administrative privileges!");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Configuration File Processing</h4>
                    <div class="code-block">
// Process configuration settings
configData = "database:mysql,host:localhost,port:3306,username:admin,password:secret";
configArray = ListToArray(configData);

writeOutput("Configuration: " & configData & "<br>");
writeOutput("Settings count: " & arrayLen(configArray) & "<br>");

// Build configuration object
writeOutput("<br><strong>Configuration Settings:</strong><br>");
config = {};

for (i = 1; i <= arrayLen(configArray); i++) {
    setting = ListToArray(configArray[i], ":");
    key = setting[1];
    value = setting[2];
    config[key] = value;
    
    // Mask sensitive data
    if (key == "password") {
        displayValue = repeatString("*", len(value));
    } else {
        displayValue = value;
    }
    
    writeOutput(key & ": " & displayValue & "<br>");
}

// Test connection string
connectionString = config.database & "://" & config.host & ":" & config.port;
writeOutput("<br>Connection string: " & connectionString);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Process configuration settings
                        configData = "database:mysql,host:localhost,port:3306,username:admin,password:secret";
                        configArray = ListToArray(configData);

                        writeOutput("Configuration: " & configData & "<br>");
                        writeOutput("Settings count: " & arrayLen(configArray) & "<br>");

                        // Build configuration object
                        writeOutput("<br><strong>Configuration Settings:</strong><br>");
                        config = {};

                        for (i = 1; i <= arrayLen(configArray); i++) {
                            setting = ListToArray(configArray[i], ":");
                            key = setting[1];
                            value = setting[2];
                            config[key] = value;
                            
                            // Mask sensitive data
                            if (key == "password") {
                                displayValue = repeatString("*", len(value));
                            } else {
                                displayValue = value;
                            }
                            
                            writeOutput(key & ": " & displayValue & "<br>");
                        }

                        // Test connection string
                        connectionString = config.database & "://" & config.host & ":" & config.port;
                        writeOutput("<br>Connection string: " & connectionString);
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