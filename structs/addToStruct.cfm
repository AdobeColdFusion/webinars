<cfif structKeyExists(form, "structKey") and structKeyExists(form, "structValue")>
    <!--- Check if the session struct exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myStruct")>
        <cfset session.myStruct = {}>
    </cfif>
    <!--- Add the form field values to the session struct --->
    <cfif form.structKey neq "">
        <cfset session.myStruct[form.structKey] = form.structValue>
    </cfif>
</cfif>

<!--- Display the current struct contents --->
<cfoutput>
<cfif structKeyExists(session, "myStruct")>
    <cfloop collection="#session.myStruct#" item="key">
        <div class="structItemContainer">
            <span class="structKey">#encodeForHtml(key)#:</span> 
            <span class="structValue">#encodeForHtml(session.myStruct[key])#</span>
        </div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("structKey").value = "";
document.getElementById("structValue").value = "";
document.getElementById("structKey").focus();
</script>


