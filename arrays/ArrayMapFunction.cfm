<cfif cgi.request_method eq "POST" and structKeyExists(form, "transformation")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayMap")>
        <cfset session.myArrayArrayMap = session.myArray>
    </cfif>
    
    <!--- Define transformation functions --->
    <cfset uppercaseFunction = function(element) { return uCase(element); }>
    <cfset lowercaseFunction = function(element) { return lCase(element); }>
    <cfset lengthFunction = function(element) { return len(element); }>
    <cfset reverseFunction = function(element) { return reverse(element); }>
    <cfset doubleFunction = function(element) { 
        if (isNumeric(element)) {
            return element * 2;
        } else {
            return element;
        }
    }>
    
    <!--- Apply the selected transformation --->
    <cfswitch expression="#form.transformation#">
        <cfcase value="uppercase">
            <cfset transformedArray = arrayMap(session.myArrayArrayMap, uppercaseFunction)>
        </cfcase>
        <cfcase value="lowercase">
            <cfset transformedArray = arrayMap(session.myArrayArrayMap, lowercaseFunction)>
        </cfcase>
        <cfcase value="length">
            <cfset transformedArray = arrayMap(session.myArrayArrayMap, lengthFunction)>
        </cfcase>
        <cfcase value="reverse">
            <cfset transformedArray = arrayMap(session.myArrayArrayMap, reverseFunction)>
        </cfcase>
        <cfcase value="double">
            <cfset transformedArray = arrayMap(session.myArrayArrayMap, doubleFunction)>
        </cfcase>
    </cfswitch>
</cfif>

<!--- Display the transformed array --->
<cfoutput>
<cfif structKeyExists(variables, "transformedArray")>
    <cfloop array="#transformedArray#" index="element">
        <div class="arrayItemContainer">#encodeForHtml(element)#</div>
    </cfloop>
</cfif>
</cfoutput>
