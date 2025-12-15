<!--- Average contents of array --->
<cfoutput>
<cfif structKeyExists(session, "myArray")>
    <cfscript>
        arrayEach(session.myArray,function(value,index) {
            writeOutput("Index #index#: " & UCase(value) & "<br />");
        });
    </cfscript>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("arrayItemarrayEach").value = "";
document.getElementById("arrayItemarrayEach").focus();
document.getElementById("inputSpan").value = "";
</script>