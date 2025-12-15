<cfif structKeyExists(form, "arrayItemarrayDelete")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayDelete")>
        <cfset session.myArrayArrayDelete = []>
        <cfset session.myArrayArrayDelete = session.myArray>
    </cfif>
    <!--- Add the form field value to the session array --->
    <cfif form.arrayItemarrayDelete neq "">
        <cfset arrayDelete(session.myArrayArrayDelete, form.arrayItemarrayDelete)>
    </cfif>
</cfif>
<cfif structKeyExists(form, "arrayItemarrayDelete")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayDeleteNoCase")>
        <cfset session.myArrayArrayDeleteNoCase = []>
        <cfset session.myArrayArrayDeleteNoCase = session.myArray>
    </cfif>
    <!--- Add the form field value to the session array --->
    <cfif form.arrayItemarrayDelete neq "">
        <cfset arrayDeleteNoCase(session.myArrayArrayDeleteNoCase, form.arrayItemarrayDelete)>
    </cfif>
</cfif>

<!--- Display the current array contents --->

<cfoutput>
Current array contents (case-sensitive):
<cfif structKeyExists(session, "myArrayArrayDelete")>
    <cfloop array="#session.myArrayArrayDelete#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
<br />
Current array contents (case-insensitive):
<cfif structKeyExists(session, "myArrayArrayDeleteNoCase")>
    <cfloop array="#session.myArrayArrayDeleteNoCase#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("arrayItemarrayDelete").value = "";
document.getElementById("arrayItemarrayDelete").focus();
</script>