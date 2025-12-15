<cfif cgi.request_method eq "POST" and structKeyExists(form, "operation")>
    <!--- Check if the session array exists, if not, create it --->
    <cfif NOT structKeyExists(session, "myArrayArrayReduce")>
        <cfset session.myArrayArrayReduce = session.myArray>
    </cfif>
    
    <!--- Define reduction functions --->
    <cfset sumFunction = function(accumulator, element) { 
        if (isNumeric(element)) {
            return accumulator + element;
        } else {
            return accumulator;
        }
    }>
    <cfset concatFunction = function(accumulator, element) { 
        return accumulator & element; 
    }>
    <cfset maxFunction = function(accumulator, element) { 
        if (isNumeric(element)) {
            return max(accumulator, element);
        } else {
            return accumulator;
        }
    }>
    <cfset minFunction = function(accumulator, element) { 
        if (isNumeric(element)) {
            return min(accumulator, element);
        } else {
            return accumulator;
        }
    }>
    <cfset countFunction = function(accumulator, element) { 
        return accumulator + 1; 
    }>
    
    <!--- Apply the selected reduction operation --->
    <cfswitch expression="#form.operation#">
        <cfcase value="sum">
            <cfif structKeyExists(form, "initialValue") and form.initialValue neq "" and isNumeric(form.initialValue)>
                <cfset result = arrayReduce(session.myArrayArrayReduce, sumFunction, form.initialValue)>
            <cfelse>
                <cfset result = arrayReduce(session.myArrayArrayReduce, sumFunction, 0)>
            </cfif>
        </cfcase>
        <cfcase value="concat">
            <cfif structKeyExists(form, "initialValue") and form.initialValue neq "">
                <cfset result = arrayReduce(session.myArrayArrayReduce, concatFunction, form.initialValue)>
            <cfelse>
                <cfset result = arrayReduce(session.myArrayArrayReduce, concatFunction, "")>
            </cfif>
        </cfcase>
        <cfcase value="max">
            <cfif structKeyExists(form, "initialValue") and form.initialValue neq "" and isNumeric(form.initialValue)>
                <cfset result = arrayReduce(session.myArrayArrayReduce, maxFunction, form.initialValue)>
            <cfelse>
                <cfset result = arrayReduce(session.myArrayArrayReduce, maxFunction, -999999)>
            </cfif>
        </cfcase>
        <cfcase value="min">
            <cfif structKeyExists(form, "initialValue") and form.initialValue neq "" and isNumeric(form.initialValue)>
                <cfset result = arrayReduce(session.myArrayArrayReduce, minFunction, form.initialValue)>
            <cfelse>
                <cfset result = arrayReduce(session.myArrayArrayReduce, minFunction, 999999)>
            </cfif>
        </cfcase>
        <cfcase value="count">
            <cfif structKeyExists(form, "initialValue") and form.initialValue neq "" and isNumeric(form.initialValue)>
                <cfset result = arrayReduce(session.myArrayArrayReduce, countFunction, form.initialValue)>
            <cfelse>
                <cfset result = arrayReduce(session.myArrayArrayReduce, countFunction, 0)>
            </cfif>
        </cfcase>
    </cfswitch>
</cfif>

<!--- Display the result --->
<cfoutput>
<cfif structKeyExists(variables, "result")>
    <div class="arrayItemContainer" style="color: purple; font-weight: bold;">Reduced result: #encodeForHtml(result)#</div>
</cfif>
</cfoutput>
