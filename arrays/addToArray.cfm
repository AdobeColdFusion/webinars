<cfif structKeyExists(form, "arrayItem")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArray")>
        <cfset session.myArray = []>
    </cfif>
    <!--- Add the form field value to the session array --->
    <cfset arrayAppend(session.myArray, form.arrayItem)>
</cfif>

<!--- Display the current array contents --->
<cfoutput>
<cfif structKeyExists(session, "myArray")>
    <cfloop array="#session.myArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("arrayItem").focus();
</script>