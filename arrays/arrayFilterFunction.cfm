
        <cfscript>
            itemsGreater = arrayFilter(session.myArray, function(value,index) {
                return value.len() > form.arrayItemarrayFilter; 
            });
            writeDump(itemsGreater);
        </cfscript>

