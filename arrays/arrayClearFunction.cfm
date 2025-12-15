<!--- Average contents of array --->
<cfoutput>
<cfif structKeyExists(session, "myArray")>
    <cfscript>
        writeOutput(arrayClear(session.myArray));
    </cfscript>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("inputSpan").innerHTML = "";
document.getElementById("inputSpanArrayClear").innerHTML = "";
</script>