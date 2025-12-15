<cfscript>
listofNumbers = '"1","2","3","4","5","6","7","8","9","10"'; 
writeOutput(listlen(listofNumbers)); // Outputs the number of items in the list
writeOutput(listGetAt(listofNumbers, 5)); // Outputs the 5th item in the list
</cfscript>