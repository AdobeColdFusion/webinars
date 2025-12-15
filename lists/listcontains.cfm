<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListContains - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListContains</h1>
            <p>Checks if a list contains a substring (case-sensitive)</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListContains</strong> checks if any element in a list contains a specified substring. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Partial string matching in lists</li>
                        <li>Searching for patterns within list elements</li>
                        <li>Filtering lists based on content</li>
                        <li>Text analysis and processing</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListContains(list, substring [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Check if list contains substring
fileList = "config.txt,readme.md,index.cfm,styles.css";
containsConfig = ListContains(fileList, "config");
containsJs = ListContains(fileList, "js");

writeOutput("File list: " & fileList & "<br>");
writeOutput("Contains 'config': " & containsConfig & "<br>");
writeOutput("Contains 'js': " & containsJs);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Check if list contains substring
                            fileList = "config.txt,readme.md,index.cfm,styles.css";
                            containsConfig = ListContains(fileList, "config");
                            containsJs = ListContains(fileList, "js");

                            writeOutput("File list: " & fileList & "<br>");
                            writeOutput("Contains 'config': " & containsConfig & "<br>");
                            writeOutput("Contains 'js': " & containsJs);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Case Sensitivity</h4>
                        <div class="code-block">
// Case-sensitive search
productList = "Laptop,Keyboard,Mouse,Monitor";
containsLaptop = ListContains(productList, "laptop");
containsLap = ListContains(productList, "Lap");

writeOutput("Product list: " & productList & "<br>");
writeOutput("Contains 'laptop': " & containsLaptop & "<br>");
writeOutput("Contains 'Lap': " & containsLap);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Case-sensitive search
                            productList = "Laptop,Keyboard,Mouse,Monitor";
                            containsLaptop = ListContains(productList, "laptop");
                            containsLap = ListContains(productList, "Lap");

                            writeOutput("Product list: " & productList & "<br>");
                            writeOutput("Contains 'laptop': " & containsLaptop & "<br>");
                            writeOutput("Contains 'Lap': " & containsLap);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Content Filtering</h4>
                    <div class="code-block">
// Filter content based on keywords
articleTitles = "ColdFusion Development Guide,JavaScript Basics,CFML Tutorial,Web Design Tips";
searchTerm = "CF";

writeOutput("Article titles: " & articleTitles & "<br>");
writeOutput("Search term: " & searchTerm & "<br>");

if (ListContains(articleTitles, searchTerm)) {
    writeOutput("✅ Found articles containing '" & searchTerm & "'<br>");
    
    // Show matching articles
    writeOutput("<br><strong>Matching Articles:</strong><br>");
    for (i = 1; i <= ListLen(articleTitles); i++) {
        title = ListGetAt(articleTitles, i);
        if (find(searchTerm, title) > 0) {
            writeOutput("📄 " & title & "<br>");
        }
    }
} else {
    writeOutput("❌ No articles found containing '" & searchTerm & "'");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Filter content based on keywords
                        articleTitles = "ColdFusion Development Guide,JavaScript Basics,CFML Tutorial,Web Design Tips";
                        searchTerm = "CF";

                        writeOutput("Article titles: " & articleTitles & "<br>");
                        writeOutput("Search term: " & searchTerm & "<br>");

                        if (ListContains(articleTitles, searchTerm)) {
                            writeOutput("✅ Found articles containing '" & searchTerm & "'<br>");
                            
                            // Show matching articles
                            writeOutput("<br><strong>Matching Articles:</strong><br>");
                            for (i = 1; i <= ListLen(articleTitles); i++) {
                                title = ListGetAt(articleTitles, i);
                                if (find(searchTerm, title) > 0) {
                                    writeOutput("📄 " & title & "<br>");
                                }
                            }
                        } else {
                            writeOutput("❌ No articles found containing '" & searchTerm & "'");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Type Detection</h4>
                    <div class="code-block">
// Detect file types by extension
fileList = "document.pdf,image.jpg,script.js,data.xlsx,config.cfm";
webFiles = "";
imageFiles = "";
documentFiles = "";

writeOutput("File list: " & fileList & "<br><br>");

// Categorize files
for (i = 1; i <= ListLen(fileList); i++) {
    file = ListGetAt(fileList, i);
    
    if (find(".cfm", file) > 0 || find(".js", file) > 0 || find(".css", file) > 0) {
        webFiles = ListAppend(webFiles, file);
        writeOutput("🌐 " & file & " - Web file<br>");
    } else if (find(".jpg", file) > 0 || find(".png", file) > 0 || find(".gif", file) > 0) {
        imageFiles = ListAppend(imageFiles, file);
        writeOutput("🖼️ " & file & " - Image file<br>");
    } else if (find(".pdf", file) > 0 || find(".doc", file) > 0 || find(".xlsx", file) > 0) {
        documentFiles = ListAppend(documentFiles, file);
        writeOutput("📄 " & file & " - Document file<br>");
    }
}

writeOutput("<br><strong>File Summary:</strong><br>");
writeOutput("Web files: " & webFiles & "<br>");
writeOutput("Image files: " & imageFiles & "<br>");
writeOutput("Document files: " & documentFiles);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Detect file types by extension
                        fileList = "document.pdf,image.jpg,script.js,data.xlsx,config.cfm";
                        webFiles = "";
                        imageFiles = "";
                        documentFiles = "";

                        writeOutput("File list: " & fileList & "<br><br>");

                        // Categorize files
                        for (i = 1; i <= ListLen(fileList); i++) {
                            file = ListGetAt(fileList, i);
                            
                            if (find(".cfm", file) > 0 || find(".js", file) > 0 || find(".css", file) > 0) {
                                webFiles = ListAppend(webFiles, file);
                                writeOutput("🌐 " & file & " - Web file<br>");
                            } else if (find(".jpg", file) > 0 || find(".png", file) > 0 || find(".gif", file) > 0) {
                                imageFiles = ListAppend(imageFiles, file);
                                writeOutput("🖼️ " & file & " - Image file<br>");
                            } else if (find(".pdf", file) > 0 || find(".doc", file) > 0 || find(".xlsx", file) > 0) {
                                documentFiles = ListAppend(documentFiles, file);
                                writeOutput("📄 " & file & " - Document file<br>");
                            }
                        }

                        writeOutput("<br><strong>File Summary:</strong><br>");
                        writeOutput("Web files: " & webFiles & "<br>");
                        writeOutput("Image files: " & imageFiles & "<br>");
                        writeOutput("Document files: " & documentFiles);
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