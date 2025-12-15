<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListContainsNoCase - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListContainsNoCase</h1>
            <p>Checks if a list contains a substring (case-insensitive)</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListContainsNoCase</strong> checks if any element in a list contains a specified substring, ignoring case. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Case-insensitive partial string matching</li>
                        <li>Flexible search functionality</li>
                        <li>User-friendly search features</li>
                        <li>Data validation regardless of case</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListContainsNoCase(list, substring [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Check if list contains substring (case-insensitive)
fileList = "Config.txt,README.md,index.cfm,Styles.css";
containsConfig = ListContainsNoCase(fileList, "config");
containsJs = ListContainsNoCase(fileList, "JS");

writeOutput("File list: " & fileList & "<br>");
writeOutput("Contains 'config': " & containsConfig & "<br>");
writeOutput("Contains 'JS': " & containsJs);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Check if list contains substring (case-insensitive)
                            fileList = "Config.txt,README.md,index.cfm,Styles.css";
                            containsConfig = ListContainsNoCase(fileList, "config");
                            containsJs = ListContainsNoCase(fileList, "JS");

                            writeOutput("File list: " & fileList & "<br>");
                            writeOutput("Contains 'config': " & containsConfig & "<br>");
                            writeOutput("Contains 'JS': " & containsJs);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Case Comparison</h4>
                        <div class="code-block">
// Compare case-sensitive vs case-insensitive
productList = "Laptop,Keyboard,Mouse,Monitor";
searchTerm = "laptop";

caseSensitive = ListContains(productList, searchTerm);
caseInsensitive = ListContainsNoCase(productList, searchTerm);

writeOutput("Product list: " & productList & "<br>");
writeOutput("Search term: " & searchTerm & "<br>");
writeOutput("Case-sensitive: " & caseSensitive & "<br>");
writeOutput("Case-insensitive: " & caseInsensitive);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Compare case-sensitive vs case-insensitive
                            productList = "Laptop,Keyboard,Mouse,Monitor";
                            searchTerm = "laptop";

                            caseSensitive = ListContains(productList, searchTerm);
                            caseInsensitive = ListContainsNoCase(productList, searchTerm);

                            writeOutput("Product list: " & productList & "<br>");
                            writeOutput("Search term: " & searchTerm & "<br>");
                            writeOutput("Case-sensitive: " & caseSensitive & "<br>");
                            writeOutput("Case-insensitive: " & caseInsensitive);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Search Functionality</h4>
                    <div class="code-block">
// Search through product catalog
productCatalog = "Laptop Pro,Wireless Keyboard,Optical Mouse,LED Monitor";
searchTerm = "laptop";

writeOutput("Product catalog: " & productCatalog & "<br>");
writeOutput("Search term: " & searchTerm & "<br>");

if (ListContainsNoCase(productCatalog, searchTerm)) {
    writeOutput("✅ Found products containing '" & searchTerm & "'<br>");
    
    // Show matching products
    writeOutput("<br><strong>Matching Products:</strong><br>");
    for (i = 1; i <= ListLen(productCatalog); i++) {
        product = ListGetAt(productCatalog, i);
        if (findNoCase(searchTerm, product) > 0) {
            writeOutput("🛒 " & product & "<br>");
        }
    }
} else {
    writeOutput("❌ No products found containing '" & searchTerm & "'");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Search through product catalog
                        productCatalog = "Laptop Pro,Wireless Keyboard,Optical Mouse,LED Monitor";
                        searchTerm = "laptop";

                        writeOutput("Product catalog: " & productCatalog & "<br>");
                        writeOutput("Search term: " & searchTerm & "<br>");

                        if (ListContainsNoCase(productCatalog, searchTerm)) {
                            writeOutput("✅ Found products containing '" & searchTerm & "'<br>");
                            
                            // Show matching products
                            writeOutput("<br><strong>Matching Products:</strong><br>");
                            for (i = 1; i <= ListLen(productCatalog); i++) {
                                product = ListGetAt(productCatalog, i);
                                if (findNoCase(searchTerm, product) > 0) {
                                    writeOutput("🛒 " & product & "<br>");
                                }
                            }
                        } else {
                            writeOutput("❌ No products found containing '" & searchTerm & "'");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Email Domain Validation</h4>
                    <div class="code-block">
// Validate email domains
emailList = "john@company.com,jane@COMPANY.COM,bob@partner.org,alice@vendor.net";
allowedDomains = "company.com,partner.org";

writeOutput("Email list: " & emailList & "<br>");
writeOutput("Allowed domains: " & allowedDomains & "<br><br>");

// Check each email
validEmails = "";
invalidEmails = "";

for (i = 1; i <= ListLen(emailList); i++) {
    email = ListGetAt(emailList, i);
    domain = ListLast(email, "@");
    
    if (ListContainsNoCase(allowedDomains, domain)) {
        validEmails = ListAppend(validEmails, email);
        writeOutput("✅ " & email & " - Valid domain<br>");
    } else {
        invalidEmails = ListAppend(invalidEmails, email);
        writeOutput("❌ " & email & " - Invalid domain<br>");
    }
}

writeOutput("<br><strong>Summary:</strong><br>");
writeOutput("Valid emails: " & validEmails & "<br>");
writeOutput("Invalid emails: " & invalidEmails);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Validate email domains
                        emailList = "john@company.com,jane@COMPANY.COM,bob@partner.org,alice@vendor.net";
                        allowedDomains = "company.com,partner.org";

                        writeOutput("Email list: " & emailList & "<br>");
                        writeOutput("Allowed domains: " & allowedDomains & "<br><br>");

                        // Check each email
                        validEmails = "";
                        invalidEmails = "";

                        for (i = 1; i <= ListLen(emailList); i++) {
                            email = ListGetAt(emailList, i);
                            domain = ListLast(email, "@");
                            
                            if (ListContainsNoCase(allowedDomains, domain)) {
                                validEmails = ListAppend(validEmails, email);
                                writeOutput("✅ " & email & " - Valid domain<br>");
                            } else {
                                invalidEmails = ListAppend(invalidEmails, email);
                                writeOutput("❌ " & email & " - Invalid domain<br>");
                            }
                        }

                        writeOutput("<br><strong>Summary:</strong><br>");
                        writeOutput("Valid emails: " & validEmails & "<br>");
                        writeOutput("Invalid emails: " & invalidEmails);
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