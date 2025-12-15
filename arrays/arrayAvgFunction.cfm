<!--- Average contents of array --->
<cfoutput>
<cfif structKeyExists(session, "myArray")>
    <cfscript>
    function testForNumeric(array) {
        for (value in array) {
            if (!isNumeric(value)) {
                return false;
            }
        }
        return true;
    }
    if(testForNumeric(session.myArray)) {
        writeOutput(arrayAvg(session.myArray))
    }
    else {
        writeOutput("Array contains non-numeric values, cannot calculate average.");
    }
    </cfscript>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("arrayItemarrayAppend").value = "";
document.getElementById("arrayItemarrayAppend").focus();
document.getElementById("inputSpan").value = "";
</script>