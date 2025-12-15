<cfif structKeyExists(form, "arrayItemArrayPrepend")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayPrepend")>
        <cfset session.myArrayArrayPrepend = []>
    </cfif>
    <!--- Prepend the form field value to the session array --->
    <cfif form.arrayItemArrayPrepend neq "">
        <cfset arrayPrepend(session.myArrayArrayPrepend, form.arrayItemArrayPrepend)>
    </cfif>
</cfif>

<!--- Display the current array contents --->
<cfoutput>
<cfif structKeyExists(session, "myArrayArrayPrepend")>
    <cfloop array="#session.myArrayArrayPrepend#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("arrayItemArrayPrepend").value = "";
document.getElementById("arrayItemArrayPrepend").focus();
</script>
