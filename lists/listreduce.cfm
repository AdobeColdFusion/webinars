<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListReduce - ColdFusion List Functions Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="index.cfm" class="back-link">← Back to All Functions</a>
        
        <div class="header">
            <h1>ListReduce</h1>
            <p>Reduces a list to a single value using a callback function</p>
        </div>
        
        <div class="content-card">
            <div class="section">
                <h2>Description</h2>
                <div class="description">
                    <p><strong>ListReduce</strong> processes each element in a list and accumulates a single result. This function is most useful for:</p>
                    <ul style="margin-left: 20px; margin-top: 10px;">
                        <li>Calculating totals, sums, or aggregates</li>
                        <li>Building complex objects from list data</li>
                        <li>Combining multiple values into one result</li>
                        <li>Data transformation and analysis</li>
                    </ul>
                </div>
            </div>
            
            <div class="section">
                <h2>Syntax</h2>
                <div class="code-block">
ListReduce(list, callback, initialValue [, delimiter])
                </div>
            </div>
            
            <div class="section">
                <h2>Examples</h2>
                
                <div class="example-grid">
                    <div class="example-item">
                        <h4>Basic Usage</h4>
                        <div class="code-block">
// Sum all numbers in a list
numbers = "10,20,30,40,50";
total = ListReduce(numbers, function(accumulator, item) {
    return accumulator + val(item);
}, 0);

writeOutput("Numbers: " & numbers & "<br>");
writeOutput("Total: " & total);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Sum all numbers in a list
                            numbers = "10,20,30,40,50";
                            total = ListReduce(numbers, function(accumulator, item) {
                                return accumulator + val(item);
                            }, 0);

                            writeOutput("Numbers: " & numbers & "<br>");
                            writeOutput("Total: " & total);
                            </cfscript>
                        </div>
                    </div>
                    
                    <div class="example-item">
                        <h4>String Concatenation</h4>
                        <div class="code-block">
// Concatenate strings with separator
words = "Hello,World,ColdFusion,Development";
sentence = ListReduce(words, function(accumulator, item) {
    if (len(accumulator) == 0) {
        return item;
    } else {
        return accumulator & " " & item;
    }
}, "");

writeOutput("Words: " & words & "<br>");
writeOutput("Sentence: " & sentence);
                        </div>
                        <div class="output-block">
                            <cfscript>
                            // Concatenate strings with separator
                            words = "Hello,World,ColdFusion,Development";
                            sentence = ListReduce(words, function(accumulator, item) {
                                if (len(accumulator) == 0) {
                                    return item;
                                } else {
                                    return accumulator & " " & item;
                                }
                            }, "");

                            writeOutput("Words: " & words & "<br>");
                            writeOutput("Sentence: " & sentence);
                            </cfscript>
                        </div>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Shopping Cart Total</h4>
                    <div class="code-block">
// Calculate shopping cart total with tax
cartItems = "laptop:999.99,keyboard:49.99,mouse:25.50,monitor:299.99";
taxRate = 0.08; // 8% tax

// Extract prices and calculate total
total = ListReduce(cartItems, function(accumulator, item) {
    price = val(ListLast(item, ":"));
    return accumulator + price;
}, 0);

taxAmount = total * taxRate;
finalTotal = total + taxAmount;

writeOutput("Cart items: " & cartItems & "<br>");
writeOutput("Subtotal: $" & numberFormat(total, "999.99") & "<br>");
writeOutput("Tax (" & (taxRate * 100) & "%): $" & numberFormat(taxAmount, "999.99") & "<br>");
writeOutput("Final total: $" & numberFormat(finalTotal, "999.99"));
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Calculate shopping cart total with tax
                        cartItems = "laptop:999.99,keyboard:49.99,mouse:25.50,monitor:299.99";
                        taxRate = 0.08; // 8% tax

                        // Extract prices and calculate total
                        total = ListReduce(cartItems, function(accumulator, item) {
                            price = val(ListLast(item, ":"));
                            return accumulator + price;
                        }, 0);

                        taxAmount = total * taxRate;
                        finalTotal = total + taxAmount;

                        writeOutput("Cart items: " & cartItems & "<br>");
                        writeOutput("Subtotal: $" & numberFormat(total, "999.99") & "<br>");
                        writeOutput("Tax (" & (taxRate * 100) & "%): $" & numberFormat(taxAmount, "999.99") & "<br>");
                        writeOutput("Final total: $" & numberFormat(finalTotal, "999.99"));
                        </cfscript>
                    </div>
                </div>
                
                <div class="example-item">
                    <h4>Real-World: Data Analysis</h4>
                    <div class="code-block">
// Analyze user scores and find statistics
userScores = "john:85,jane:92,bob:78,alice:95,dave:88";
scores = ListReduce(userScores, function(accumulator, item) {
    score = val(ListLast(item, ":"));
    return ListAppend(accumulator, score);
}, "");

// Calculate statistics
totalScore = ListReduce(scores, function(accumulator, item) {
    return accumulator + val(item);
}, 0);

averageScore = totalScore / ListLen(scores);

// Find highest and lowest scores
highestScore = ListReduce(scores, function(accumulator, item) {
    currentScore = val(item);
    if (currentScore > accumulator) {
        return currentScore;
    } else {
        return accumulator;
    }
}, 0);

lowestScore = ListReduce(scores, function(accumulator, item) {
    currentScore = val(item);
    if (currentScore < accumulator || accumulator == 0) {
        return currentScore;
    } else {
        return accumulator;
    }
}, 0);

writeOutput("User scores: " & userScores & "<br>");
writeOutput("Total score: " & totalScore & "<br>");
writeOutput("Average score: " & numberFormat(averageScore, "99.9") & "<br>");
writeOutput("Highest score: " & highestScore & "<br>");
writeOutput("Lowest score: " & lowestScore);
                    </div>
                    <div class="output-block">
                        <cfscript>
                        // Analyze user scores and find statistics
                        userScores = "john:85,jane:92,bob:78,alice:95,dave:88";
                        scores = ListReduce(userScores, function(accumulator, item) {
                            score = val(ListLast(item, ":"));
                            return ListAppend(accumulator, score);
                        }, "");

                        // Calculate statistics
                        totalScore = ListReduce(scores, function(accumulator, item) {
                            return accumulator + val(item);
                        }, 0);

                        averageScore = totalScore / ListLen(scores);

                        // Find highest and lowest scores
                        highestScore = ListReduce(scores, function(accumulator, item) {
                            currentScore = val(item);
                            if (currentScore > accumulator) {
                                return currentScore;
                            } else {
                                return accumulator;
                            }
                        }, 0);

                        lowestScore = ListReduce(scores, function(accumulator, item) {
                            currentScore = val(item);
                            if (currentScore < accumulator || accumulator == 0) {
                                return currentScore;
                            } else {
                                return accumulator;
                            }
                        }, 0);

                        writeOutput("User scores: " & userScores & "<br>");
                        writeOutput("Total score: " & totalScore & "<br>");
                        writeOutput("Average score: " & numberFormat(averageScore, "99.9") & "<br>");
                        writeOutput("Highest score: " & highestScore & "<br>");
                        writeOutput("Lowest score: " & lowestScore);
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