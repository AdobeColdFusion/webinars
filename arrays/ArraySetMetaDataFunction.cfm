<cfif structKeyExists(form, "position") and structKeyExists(form, "metadataKey") and structKeyExists(form, "metadataValue")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArraySetMetaData")>
        <cfset session.myArrayArraySetMetaData = session.myArray>
    </cfif>
    <!--- Set metadata for the array element at the specified position --->
    <cfif isNumeric(form.position)>
        <cfset metadata = {}>
        <cfset metadata[form.metadataKey] = form.metadataValue>
        <cfset arraySetMetaData(session.myArrayArraySetMetaData, form.position, metadata)>
    </cfif>
</cfif>

<!--- Display the array with metadata --->
<cfoutput>
<cfif structKeyExists(session, "myArrayArraySetMetaData")>
    <div class="arrayItemContainer" style="color: green; font-weight: bold;">Metadata set for position #form.position#</div>
    <cfloop array="#session.myArrayArraySetMetaData#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("position").value = "";
document.getElementById("metadataKey").value = "";
document.getElementById("metadataValue").value = "";
document.getElementById("position").focus();
</script>
