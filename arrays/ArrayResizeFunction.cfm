<cfif structKeyExists(form, "newSize")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayResize")>
        <cfset session.myArrayArrayResize = session.myArray>
    </cfif>
    <!--- Resize the array --->
    <cfif isNumeric(form.newSize)>
        <cfset arrayResize(session.myArrayArrayResize, form.newSize)>
    </cfif>
</cfif>

<!--- Display the resized array --->
<cfoutput>
<cfif structKeyExists(session, "myArrayArrayResize")>
    <div class="arrayItemContainer" style="color: blue; font-weight: bold;">Array resized to #arrayLen(session.myArrayArrayResize)# elements</div>
    <cfloop array="#session.myArrayArrayResize#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("newSize").value = "";
document.getElementById("newSize").focus();
</script>
