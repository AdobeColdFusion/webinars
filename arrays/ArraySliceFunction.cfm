<cfif cgi.request_method eq "POST" and structKeyExists(form, "start") and structKeyExists(form, "end")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArraySlice")>
        <cfset session.myArrayArraySlice = session.myArray>
    </cfif>
    <!--- Extract the slice from the array --->
    <cfif isNumeric(form.start) and isNumeric(form.end)>
        <cfset slicedArray = arraySlice(session.myArrayArraySlice, form.start, form.end)>
    </cfif>
 </cfif>

<!--- Display the sliced array --->
<cfoutput>
<cfif structKeyExists(variables, "slicedArray")>
    <div class="arrayItemContainer" style="color: blue; font-weight: bold;">Slice from position #form.start# to #form.end#:</div>
    <cfloop array="#slicedArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
<script>
document.getElementById("arrayItem").value = "";
document.getElementById("start").value = "";
document.getElementById("end").value = "";
document.getElementById("start").focus();
</script>
