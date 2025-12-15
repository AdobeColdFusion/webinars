<cfif structKeyExists(form, "arrayItemArrayPush")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayPush")>
        <cfset session.myArrayArrayPush = []>
    </cfif>
    <!--- Push the form field value to the session array --->
    <cfif form.arrayItemArrayPush neq "">
        <cfset newLength = arrayPush(session.myArrayArrayPush, form.arrayItemArrayPush)>
    </cfif>
</cfif>

<!--- Display the current array contents --->
<cfoutput>
<cfif structKeyExists(session, "myArrayArrayPush")>
    <div class="arrayItemContainer" style="color: blue; font-weight: bold;">New array length: #arrayLen(session.myArrayArrayPush)#</div>
    <cfloop array="#session.myArrayArrayPush#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("arrayItemArrayPush").value = "";
document.getElementById("arrayItemArrayPush").focus();
</script>

