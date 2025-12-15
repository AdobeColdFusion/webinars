<cfif cgi.request_method eq "POST" and structKeyExists(form, "checkIndex")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayIsDefined")>
        <cfset session.myArrayArrayIsDefined = session.myArray>
    </cfif>
    <!--- Check if the element exists at the specified index --->
    <cfif isNumeric(form.checkIndex)>
        <cfset isDefined = arrayIsDefined(session.myArrayArrayIsDefined, form.checkIndex)>
    </cfif>
</cfif>

<!--- Display the result --->
<cfoutput>
<cfif structKeyExists(variables, "isDefined")>
    <cfif isDefined>
        <div class="arrayItemContainer" style="color: green;">Element at index #form.checkIndex# is DEFINED</div>
    <cfelse>
        <div class="arrayItemContainer" style="color: red;">Element at index #form.checkIndex# is NOT DEFINED</div>
    </cfif>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("checkIndex").value = "";
document.getElementById("checkIndex").focus();
</script>
