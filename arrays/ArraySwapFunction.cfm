<cfif structKeyExists(form, "position1") and structKeyExists(form, "position2")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArraySwap")>
        <cfset session.myArrayArraySwap = session.myArray>
    </cfif>
    <!--- Swap the array elements at the specified positions --->
    <cfif isNumeric(form.position1) and isNumeric(form.position2)>
        <cfset arraySwap(session.myArrayArraySwap, form.position1, form.position2)>
    </cfif>
</cfif>

<!--- Display the array after swap --->
<cfoutput>
<cfif structKeyExists(session, "myArrayArraySwap")>
    <div class="arrayItemContainer" style="color: orange; font-weight: bold;">Elements at positions #form.position1# and #form.position2# swapped</div>
    <cfloop array="#session.myArrayArraySwap#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("position1").value = "";
document.getElementById("position2").value = "";
document.getElementById("position1").focus();
</script>
