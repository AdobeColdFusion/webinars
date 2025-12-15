<cfif structKeyExists(form, "arrayItemArrayInsertAt") and structKeyExists(form, "position")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayInsertAt")>
        <cfset session.myArrayArrayInsertAt = []>
    </cfif>
    <!--- Add the form field value to the session array at specified position --->
    <cfif form.arrayItemArrayInsertAt neq "" and isNumeric(form.position)>
        <cfset arrayInsertAt(session.myArrayArrayInsertAt, form.position, form.arrayItemArrayInsertAt)>
    </cfif>
</cfif>

<!--- Display the current array contents --->
<cfoutput>
<cfif structKeyExists(session, "myArrayArrayInsertAt")>
    <cfloop array="#session.myArrayArrayInsertAt#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("arrayItemArrayInsertAt").value = "";
document.getElementById("position").value = "";
document.getElementById("arrayItemArrayInsertAt").focus();
</script>
