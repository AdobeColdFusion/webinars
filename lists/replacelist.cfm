<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReplaceList - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ReplaceList</h1>
            <p>Replaces multiple values in a string using lists of search and replacement values</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ReplaceList</strong> performs multiple find-and-replace operations on a string using two lists: one containing values to find, and another containing their corresponding replacements. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Bulk text replacement operations</li>
                        <li>Data transformation and normalization</li>
                        <li>Template processing and variable substitution</li>
                        <li>Character encoding and formatting conversions</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ReplaceList(string, list1, list2 [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Replace multiple values at once
text = "Hello world, how are you today?";
findList = "Hello,world,how,you";
replaceList = "Hi,earth,what,we";

result = ReplaceList(text, findList, replaceList);

writeOutput("Original: " & text & "<br>");
writeOutput("Find: " & findList & "<br>");
writeOutput("Replace: " & replaceList & "<br>");
writeOutput("Result: " & result);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Replace multiple values at once
                            text = "Hello world, how are you today?";
                            findList = "Hello,world,how,you";
                            replaceList = "Hi,earth,what,we";

                            result = ReplaceList(text, findList, replaceList);

                            writeOutput("Original: " & text & "<br>");
                            writeOutput("Find: " & findList & "<br>");
                            writeOutput("Replace: " & replaceList & "<br>");
                            writeOutput("Result: " & result);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Case Sensitivity</h4>
                        <div class="code-block">
// ReplaceList is case-sensitive
text = "The cat and the dog are friends";
findList = "cat,dog";
replaceList = "kitten,puppy";

result = ReplaceList(text, findList, replaceList);

writeOutput("Original: " & text & "<br>");
writeOutput("Find: " & findList & "<br>");
writeOutput("Replace: " & replaceList & "<br>");
writeOutput("Result: " & result);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // ReplaceList is case-sensitive
                            text = "The cat and the dog are friends";
                            findList = "cat,dog";
                            replaceList = "kitten,puppy";

                            result = ReplaceList(text, findList, replaceList);

                            writeOutput("Original: " & text & "<br>");
                            writeOutput("Find: " & findList & "<br>");
                            writeOutput("Replace: " & replaceList & "<br>");
                            writeOutput("Result: " & result);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Text Formatting</h4>
                    <div class="code-block">
// Replace formatting markers with tags
text = "This is a *bold* text with _italic_ and `code` elements";
markers = "*,_,`";
tags = "BOLD,ITALIC,CODE";

formattedText = ReplaceList(text, markers, tags);

writeOutput("Original: " & text & "<br>");
writeOutput("Markers: " & markers & "<br>");
writeOutput("Tags: " & tags & "<br>");
writeOutput("Formatted: " & formattedText);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Replace formatting markers with tags
                        text = "This is a *bold* text with _italic_ and `code` elements";
                        markers = "*,_,`";
                        tags = "BOLD,ITALIC,CODE";

                        formattedText = ReplaceList(text, markers, tags);

                        writeOutput("Original: " & text & "<br>");
                        writeOutput("Markers: " & markers & "<br>");
                        writeOutput("Tags: " & tags & "<br>");
                        writeOutput("Formatted: " & formattedText);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Currency Formatting</h4>
                    <div class="code-block">
// Format currency symbols and abbreviations
prices = "Product costs $10.99, Sale price is $5.50, Regular price $25.00";
currencies = "$,USD,€,EUR,£,GBP";
formatted = "USD $,USD,EUR €,EUR,GBP £,GBP";

formattedPrices = ReplaceList(prices, currencies, formatted);

writeOutput("Original: " & prices & "<br>");
writeOutput("Currencies: " & currencies & "<br>");
writeOutput("Formatted: " & formatted & "<br>");
writeOutput("Result: " & formattedPrices);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Format currency symbols and abbreviations
                        prices = "Product costs $10.99, Sale price is $5.50, Regular price $25.00";
                        currencies = "$,USD,€,EUR,£,GBP";
                        formatted = "USD $,USD,EUR €,EUR,GBP £,GBP";

                        formattedPrices = ReplaceList(prices, currencies, formatted);

                        writeOutput("Original: " & prices & "<br>");
                        writeOutput("Currencies: " & currencies & "<br>");
                        writeOutput("Formatted: " & formatted & "<br>");
                        writeOutput("Result: " & formattedPrices);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Template Variable Replacement</h4>
                    <div class="code-block">
// Replace template variables with actual values
template = "Dear {name}, your order #{orderId} for {product} has been shipped to {address}";
variables = "{name},{orderId},{product},{address}";
values = "John Smith,12345,Widget Pro,123 Main St";

personalized = ReplaceList(template, variables, values);

writeOutput("Template: " & template & "<br>");
writeOutput("Variables: " & variables & "<br>");
writeOutput("Values: " & values & "<br>");
writeOutput("Personalized: " & personalized);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Replace template variables with actual values
                        template1 = "Dear {name}, your order ##{orderId} for {product} has been shipped to {address}";
                        variables1 = "{name},{orderId},{product},{address}";
                        values1 = "John Smith,12345,Widget Pro,123 Main St";

                        personalized = ReplaceList(template1, variables1, values1);

                        writeOutput("Template: " & template1 & "<br>");
                        writeOutput("Variables: " & variables1 & "<br>");
                        writeOutput("Values: " & values1 & "<br>");
                        writeOutput("Personalized: " & personalized);
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Extension Conversion</h4>
                    <div class="code-block">
// Convert file extensions to different formats
files = "document.txt,image.jpg,data.csv,report.pdf";
oldExtensions = ".txt,.jpg,.csv,.pdf";
newExtensions = ".doc,.png,.xlsx,.docx";

convertedFiles = ReplaceList(files, oldExtensions, newExtensions);

writeOutput("Original files: " & files & "<br>");
writeOutput("Old extensions: " & oldExtensions & "<br>");
writeOutput("New extensions: " & newExtensions & "<br>");
writeOutput("Converted: " & convertedFiles);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Convert file extensions to different formats
                        files = "document.txt,image.jpg,data.csv,report.pdf";
                        oldExtensions = ".txt,.jpg,.csv,.pdf";
                        newExtensions = ".doc,.png,.xlsx,.docx";

                        convertedFiles = ReplaceList(files, oldExtensions, newExtensions);

                        writeOutput("Original files: " & files & "<br>");
                        writeOutput("Old extensions: " & oldExtensions & "<br>");
                        writeOutput("New extensions: " & newExtensions & "<br>");
                        writeOutput("Converted: " & convertedFiles);
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