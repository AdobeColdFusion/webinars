<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListPrepend - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListPrepend</h1>
            <p>Adds an element to the beginning of a list</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListPrepend</strong> adds a new element to the beginning of a list. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Adding priority items to the front of lists</li>
                        <li>Building lists in reverse order</li>
                        <li>Prepending headers or prefixes to data</li>
                        <li>Creating ordered lists with newest items first</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListPrepend(list, value [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Add item to beginning of list
originalList = "banana,orange,grape";
newList = ListPrepend(originalList, "apple");
writeOutput("Original: " & originalList & "<br>");
writeOutput("New: " & newList);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Add item to beginning of list
                            originalList = "banana,orange,grape";
                            newList = ListPrepend(originalList, "apple");
                            writeOutput("Original: " & originalList & "<br>");
                            writeOutput("New: " & newList);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>Priority Queue</h4>
                        <div class="code-block">
// Add high priority task to front
taskList = "review code,write tests,update docs";
highPriorityTask = "fix critical bug";
updatedTasks = ListPrepend(taskList, highPriorityTask);
writeOutput("Original: " & taskList & "<br>");
writeOutput("Updated: " & updatedTasks);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Add high priority task to front
                            taskList = "review code,write tests,update docs";
                            highPriorityTask = "fix critical bug";
                            updatedTasks = ListPrepend(taskList, highPriorityTask);
                            writeOutput("Original: " & taskList & "<br>");
                            writeOutput("Updated: " & updatedTasks);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: News Feed</h4>
                    <div class="code-block">
// Add breaking news to top of feed
newsFeed = "sports update,weather report,local news";
breakingNews = "BREAKING: Major announcement";
updatedFeed = ListPrepend(newsFeed, breakingNews);

writeOutput("Original feed: " & newsFeed & "<br>");
writeOutput("Updated feed: " & updatedFeed);

// Display as numbered list
writeOutput("<br><br><strong>News Feed:</strong><br>");
for (i = 1; i <= ListLen(updatedFeed); i++) {
    news = ListGetAt(updatedFeed, i);
    writeOutput(i & ". " & news & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Add breaking news to top of feed
                        newsFeed = "sports update,weather report,local news";
                        breakingNews = "BREAKING: Major announcement";
                        updatedFeed = ListPrepend(newsFeed, breakingNews);

                        writeOutput("Original feed: " & newsFeed & "<br>");
                        writeOutput("Updated feed: " & updatedFeed);

                        // Display as numbered list
                        writeOutput("<br><br><strong>News Feed:</strong><br>");
                        for (i = 1; i <= ListLen(updatedFeed); i++) {
                            news = ListGetAt(updatedFeed, i);
                            writeOutput(i & ". " & news & "<br>");
                        }
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: File Path Processing</h4>
                    <div class="code-block">
// Add root directory to file paths
filePaths = "images/logo.png,styles/main.css,scripts/app.js";
rootPath = "/var/www/html";
fullPaths = ListPrepend(filePaths, rootPath, "/");

writeOutput("File paths: " & filePaths & "<br>");
writeOutput("Full paths: " & fullPaths);

// Create absolute URLs
writeOutput("<br><br><strong>Absolute URLs:</strong><br>");
for (i = 1; i <= ListLen(fullPaths); i++) {
    path = ListGetAt(fullPaths, i);
    writeOutput("file://" & path & "<br>");
}
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Add root directory to file paths
                        filePaths = "images/logo.png,styles/main.css,scripts/app.js";
                        rootPath = "/var/www/html";
                        fullPaths = ListPrepend(filePaths, rootPath, "/");

                        writeOutput("File paths: " & filePaths & "<br>");
                        writeOutput("Full paths: " & fullPaths);

                        // Create absolute URLs
                        writeOutput("<br><br><strong>Absolute URLs:</strong><br>");
                        for (i = 1; i <= ListLen(fullPaths); i++) {
                            path = ListGetAt(fullPaths, i);
                            writeOutput("file://" & path & "<br>");
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