<cfif cgi.request_method eq "POST" and structKeyExists(form, "dimension")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayNew")>
        <cfset session.myArrayArrayNew = session.myArray>
    </cfif>
    
    <!--- Create new array based on form parameters --->
    
        <cfset newArray = arrayNew(form.dimension)>
    
    
    <!--- Store the new array in session for display --->
    <cfset session.myArrayArrayNew = newArray>
</cfif>

<!--- Display the new array --->
<cfoutput>
<cfif structKeyExists(variables, "newArray")>
    <div class="arrayItemContainer" style="color: blue; font-weight: bold;">Created #form.dimension#-dimensional array</div>
    <cfif form.dimension eq 1>
        <cfset newArray[1] = "Value 1">
        <cfloop array="#newArray#" index="element">
            <div class="arrayItemContainer">#encodeForHtml(element)#</div>
            <cfset newArray[1] = "Value 1">
        </cfloop>
        <cfdump  var="#newArray#" />
    <cfelseif form.dimension eq 2>
        <cfset newArray[1][1] = "Value 1">
        <cfset newArray[1][2] = "Value 2">
        <cfloop array="#newArray#" index="row" >
            <div class="arrayItemContainer">
                Row: <cfloop array="#row#" index="element">[#encodeForHtml(element)#] </cfloop>
            </div>
        </cfloop>
        <cfdump  var="#newArray#" />
    <cfelseif form.dimension eq 3>
        <cfset newArray[1][1][1] = "Value 1">
        <cfset newArray[1][1][2] = "Value 2">
        <cfset newArray[1][2][1] = "Value 3">
        <cfset newArray[1][2][2] = "Value 4">
        <cfloop array="#newArray#" index="layer" >
            <div class="arrayItemContainer">
                Layer: <cfloop array="#layer#" index="row">
                    [<cfloop array="#row#" index="element">#encodeForHtml(element)# </cfloop>]
                </cfloop>
            </div>
        </cfloop>
        <cfdump  var="#newArray#" />
    </cfif>
</cfif>
</cfoutput>
