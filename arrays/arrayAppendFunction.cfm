<cfif structKeyExists(form, "arrayItemarrayAppend")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayAppend")>
        <cfset session.myArrayArrayAppend = []>
        I created the session array.
    </cfif>
    <!--- Add the form field value to the session array --->
    <cfif form.arrayItemarrayAppend neq "">
        <cfset arrayAppend(session.myArrayArrayAppend, form.arrayItemarrayAppend)>
    </cfif>
</cfif>

<!--- Display the current array contents --->
<cfoutput>
<cfif structKeyExists(session, "myArrayArrayAppend")>
    <cfloop array="#session.myArrayArrayAppend#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("arrayItemarrayAppend").value = "";
document.getElementById("arrayItemarrayAppend").focus();
</script>