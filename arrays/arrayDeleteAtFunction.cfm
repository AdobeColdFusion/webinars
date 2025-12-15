<cfif structKeyExists(form, "arrayItemarrayDeleteAt")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayDeleteAt")>
        <cfset session.myArrayArrayDeleteAt = []>
        <cfset session.myArrayArrayDeleteAt = session.myArray>
    </cfif>
    <!--- Add the form field value to the session array --->
    <cfif form.arrayItemarrayDeleteAt neq "">
        <cfif isNumeric(form.arrayItemarrayDeleteAt)>
            <cfset arrayDeleteAt(session.myArrayArrayDeleteAt, form.arrayItemarrayDeleteAt)>
        <cfelse>
            Item to be deleted is not a valid numeric index.
            <cfabort />
        </cfif>
        <cfif form.arrayItemarrayDeleteAt gt arrayLen(session.myArrayArrayDeleteAt)>
            Item to be deleted is out of bounds.
            <cfabort />
        </cfif>
    </cfif>
</cfif>
<!--- Display the current array contents --->

<cfoutput>
Current array contents (removed item at position <cfoutput>#form.arrayItemarrayDeleteAt#</cfoutput>):
<cfif structKeyExists(session, "myArrayArrayDeleteAt")>
    <cfloop array="#session.myArrayArrayDeleteAt#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
<br />

</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("arrayItemarrayDeleteAt").value = "";
document.getElementById("arrayItemarrayDeleteAt").focus();
</script>