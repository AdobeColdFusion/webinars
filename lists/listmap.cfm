<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListMap - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListMap</h1>
            <p>Transforms each element in a list using a callback function</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListMap</strong> applies a function to each element in a list and returns a new list with the transformed values. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Converting data types (strings to numbers, etc.)</li>
                        <li>Formatting text (uppercase, lowercase, etc.)</li>
                        <li>Adding prefixes or suffixes to list items</li>
                        <li>Data transformation and cleaning</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListMap(list, callback [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage - Uppercase</h4>
                        <div class="code-block">
// Convert all items to uppercase
fruits = "apple,banana,orange,grape";
upperFruits = ListMap(fruits, function(item) {
    return uCase(item);
});
writeOutput("Original: " & fruits & "<br>");
writeOutput("Uppercase: " & upperFruits);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Convert all items to uppercase
                            fruits = "apple,banana,orange,grape";
                            upperFruits = ListMap(fruits, function(item) {
                                return uCase(item);
                            });
                            writeOutput("Original: " & fruits & "<br>");
                            writeOutput("Uppercase: " & upperFruits);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Number Conversion</h4>
                        <div class="code-block">
// Convert string numbers to actual numbers
stringNumbers = "1,2,3,4,5";
numbers = ListMap(stringNumbers, function(item) {
    return val(item) * 2;
});
writeOutput("Original: " & stringNumbers & "<br>");
writeOutput("Doubled: " & numbers);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Convert string numbers to actual numbers
                            stringNumbers = "1,2,3,4,5";
                            numbers = ListMap(stringNumbers, function(item) {
                                return val(item) * 2;
                            });
                            writeOutput("Original: " & stringNumbers & "<br>");
                            writeOutput("Doubled: " & numbers);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Path Processing</h4>
                    <div class="code-block">
// Add file extensions and full paths
fileNames = "config,readme,index,styles";
fullPaths = ListMap(fileNames, function(fileName) {
    return "/assets/" & fileName & ".cfm";
});
writeOutput("Original: " & fileNames & "<br>");
writeOutput("Full paths: " & fullPaths);

// Display as clickable links
writeOutput("<br><br><strong>File Links:</strong><br>");
for (i = 1; i <= ListLen(fullPaths); i++) {
    path = ListGetAt(fullPaths, i);
    fileName = ListGetAt(fileNames, i);
    writeOutput("<a href='" & path & "'>" & fileName & "</a><br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Add file extensions and full paths
                        fileNames = "config,readme,index,styles";
                        fullPaths = ListMap(fileNames, function(fileName) {
                            return "/assets/" & fileName & ".cfm";
                        });
                        writeOutput("Original: " & fileNames & "<br>");
                        writeOutput("Full paths: " & fullPaths);

                        // Display as clickable links
                        writeOutput("<br><br><strong>File Links:</strong><br>");
                        for (i = 1; i <= ListLen(fullPaths); i++) {
                            path = ListGetAt(fullPaths, i);
                            fileName = ListGetAt(fileNames, i);
                            writeOutput("<a href='" & path & "'>" & fileName & "</a><br>");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Product Price Formatting</h4>
                    <div class="code-block">
// Format product prices with currency
rawPrices = "19.99,29.99,39.99,49.99";
formattedPrices = ListMap(rawPrices, function(price) {
    return "$" & numberFormat(val(price), "999.99");
});
writeOutput("Original: " & rawPrices & "<br>");
writeOutput("Formatted: " & formattedPrices);

// Calculate total with tax
writeOutput("<br><br><strong>Price Breakdown:</strong><br>");
total = 0;
for (i = 1; i <= ListLen(rawPrices); i++) {
    price = val(ListGetAt(rawPrices, i));
    formatted = ListGetAt(formattedPrices, i);
    total += price;
    writeOutput("Item " & i & ": " & formatted & "<br>");
}
tax = total * 0.08;
writeOutput("Subtotal: $" & numberFormat(total, "999.99") & "<br>");
writeOutput("Tax (8%): $" & numberFormat(tax, "999.99") & "<br>");
writeOutput("Total: $" & numberFormat(total + tax, "999.99"));
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Format product prices with currency
                        rawPrices = "19.99,29.99,39.99,49.99";
                        formattedPrices = ListMap(rawPrices, function(price) {
                            return "$" & numberFormat(val(price), "999.99");
                        });
                        writeOutput("Original: " & rawPrices & "<br>");
                        writeOutput("Formatted: " & formattedPrices);

                        // Calculate total with tax
                        writeOutput("<br><br><strong>Price Breakdown:</strong><br>");
                        total = 0;
                        for (i = 1; i <= ListLen(rawPrices); i++) {
                            price = val(ListGetAt(rawPrices, i));
                            formatted = ListGetAt(formattedPrices, i);
                            total += price;
                            writeOutput("Item " & i & ": " & formatted & "<br>");
                        }
                        tax = total * 0.08;
                        writeOutput("Subtotal: $" & numberFormat(total, "999.99") & "<br>");
                        writeOutput("Tax (8%): $" & numberFormat(tax, "999.99") & "<br>");
                        writeOutput("Total: $" & numberFormat(total + tax, "999.99"));
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Email Address Processing</h4>
                    <div class="code-block">
// Process email addresses for display
emailList = "john.doe@company.com,jane.smith@company.com,bob.wilson@company.com";
displayNames = ListMap(emailList, function(email) {
    // Extract name from email
    name = ListFirst(email, "@");
    // Replace dots with spaces and capitalize
    name = replace(name, ".", " ", "all");
    name = uCase(left(name, 1)) & lCase(right(name, len(name) - 1));
    return name;
});
writeOutput("Emails: " & emailList & "<br>");
writeOutput("Names: " & displayNames);

// Create formatted contact list
writeOutput("<br><br><strong>Contact List:</strong><br>");
for (i = 1; i <= ListLen(emailList); i++) {
    email = ListGetAt(emailList, i);
    name = ListGetAt(displayNames, i);
    writeOutput(name & " (" & email & ")<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Process email addresses for display
                        emailList = "john.doe@company.com,jane.smith@company.com,bob.wilson@company.com";
                        displayNames = ListMap(emailList, function(email) {
                            // Extract name from email
                            name = ListFirst(email, "@");
                            // Replace dots with spaces and capitalize
                            name = replace(name, ".", " ", "all");
                            name = uCase(left(name, 1)) & lCase(right(name, len(name) - 1));
                            return name;
                        });
                        writeOutput("Emails: " & emailList & "<br>");
                        writeOutput("Names: " & displayNames);

                        // Create formatted contact list
                        writeOutput("<br><br><strong>Contact List:</strong><br>");
                        for (i = 1; i <= ListLen(emailList); i++) {
                            email = ListGetAt(emailList, i);
                            name = ListGetAt(displayNames, i);
                            writeOutput(name & " (" & email & ")<br>");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Data Validation and Cleaning</h4>
                    <div class="code-block">
// Clean and validate user input
rawData = "  john  ,  jane  ,  bob  ,  alice  ";
cleanedData = ListMap(rawData, function(item) {
    // Trim whitespace and capitalize
    cleaned = trim(item);
    return uCase(left(cleaned, 1)) & lCase(right(cleaned, len(cleaned) - 1));
});
writeOutput("Original: '" & rawData & "'<br>");
writeOutput("Cleaned: '" & cleanedData & "'");

// Validate and format phone numbers
phoneNumbers = "555-123-4567,555.987.6543,555 456 7890";
formattedPhones = ListMap(phoneNumbers, function(phone) {
    // Remove all non-digits
    digits = reReplace(phone, "[^0-9]", "", "all");
    // Format as (XXX) XXX-XXXX
    if (len(digits) == 10) {
        return "(" & left(digits, 3) & ") " & mid(digits, 4, 3) & "-" & right(digits, 4);
    } else {
        return "Invalid: " & phone;
    }
});
writeOutput("<br><br><strong>Phone Numbers:</strong><br>");
writeOutput("Original: " & phoneNumbers & "<br>");
writeOutput("Formatted: " & formattedPhones);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Clean and validate user input
                        rawData = "  john  ,  jane  ,  bob  ,  alice  ";
                        cleanedData = ListMap(rawData, function(item) {
                            // Trim whitespace and capitalize
                            cleaned = trim(item);
                            return uCase(left(cleaned, 1)) & lCase(right(cleaned, len(cleaned) - 1));
                        });
                        writeOutput("Original: '" & rawData & "'<br>");
                        writeOutput("Cleaned: '" & cleanedData & "'");

                        // Validate and format phone numbers
                        phoneNumbers = "555-123-4567,555.987.6543,555 456 7890";
                        formattedPhones = ListMap(phoneNumbers, function(phone) {
                            // Remove all non-digits
                            digits = reReplace(phone, "[^0-9]", "", "all");
                            // Format as (XXX) XXX-XXXX
                            if (len(digits) == 10) {
                                return "(" & left(digits, 3) & ") " & mid(digits, 4, 3) & "-" & right(digits, 4);
                            } else {
                                return "Invalid: " & phone;
                            }
                        });
                        writeOutput("<br><br><strong>Phone Numbers:</strong><br>");
                        writeOutput("Original: " & phoneNumbers & "<br>");
                        writeOutput("Formatted: " & formattedPhones);
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