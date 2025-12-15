<cfif structKeyExists(form, "position_start") and structKeyExists(form, "position_end") and structKeyExists(form, "value")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArraySet")>
        <cfset session.myArrayArraySet = session.myArray>
    </cfif>
    <!--- Set the array element at the specified position --->
    <cfif isNumeric(form.position_start) and isNumeric(form.position_end) and isDefined("form.value")>
        <cfset arraySet(session.myArrayArraySet, form.position_start, form.position_end, form.value)>
        I set this
    </cfif>
</cfif>

<!--- Display the modified array --->
<cfoutput>
<cfif structKeyExists(session, "myArrayArraySet")>
    <cfloop array="#session.myArrayArraySet#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("position").value = "";
document.getElementById("value").value = "";
document.getElementById("position").focus();
</script>
