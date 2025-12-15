<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CFML Structs Factory</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style.css">
</head>
<body hx-get="addToStruct.cfm" hx-target="#inputSpan" hx-trigger="load">
    <h1 class="title">CFML Structs Factory</h1>
    <div id="inputDiv" class="inputDiv">
        <form>
        <input type="text" id="structKey" name="structKey" placeholder="Key">
        <input type="text" id="structValue" name="structValue" placeholder="Value">
        <button hx-post="addToStruct.cfm" hx-target="#inputSpan" id="addStructItem">Add Struct Item</button>
        <button type="button" id="clearStruct" hx-post="clearStruct.cfm" hx-target="#inputSpan">Clear Struct</button>
        </form>
        <span id="inputSpan"></span>
    </div>
    <div id="controlsDiv" class="controlsDiv">
    <button class="controlButton" id="isStructButton" hx-get="isStruct.cfm" hx-target="#outputDiv">
        isStruct()
    </button>
    <button class="controlButton" id="structAppendButton" hx-get="structAppend.cfm" hx-target="#outputDiv">
        StructAppend()
    </button>
    <button class="controlButton" id="structClearButton" hx-get="structClear.cfm" hx-target="#outputDiv">
        StructClear()
    </button>
    <button class="controlButton" id="structCopyButton" hx-get="structCopy.cfm" hx-target="#outputDiv">
        StructCopy()
    </button>
    <button class="controlButton" id="structCountButton" hx-get="structCount.cfm" hx-target="#outputDiv">
        StructCount()
    </button>
    <button class="controlButton" id="structDeleteButton" hx-get="structDelete.cfm" hx-target="#outputDiv">
        StructDelete()
    </button>
    <button class="controlButton" id="structEachButton" hx-get="structEach.cfm" hx-target="#outputDiv">
        StructEach()
    </button>
    <button class="controlButton" id="structFindButton" hx-get="structFind.cfm" hx-target="#outputDiv">
        StructFind()
    </button>
    <button class="controlButton" id="structFindKeyButton" hx-get="structFindKey.cfm" hx-target="#outputDiv">
        StructFindKey()
    </button>
    <button class="controlButton" id="structFindValueButton" hx-get="structFindValue.cfm" hx-target="#outputDiv">
        StructFindValue()
    </button>
    <button class="controlButton" id="structFilterButton" hx-get="structFilter.cfm" hx-target="#outputDiv">
        StructFilter()
    </button>
    <button class="controlButton" id="structGetButton" hx-get="structGet.cfm" hx-target="#outputDiv">
        StructGet()
    </button>
    <button class="controlButton" id="structGetMetadataButton" hx-get="structGetMetadata.cfm" hx-target="#outputDiv">
        StructGetMetadata()
    </button>
    <button class="controlButton" id="structInsertButton" hx-get="structInsert.cfm" hx-target="#outputDiv">
        StructInsert()
    </button>
    <button class="controlButton" id="structIsCaseSensitiveButton" hx-get="structIsCaseSensitive.cfm" hx-target="#outputDiv">
        StructIsCaseSensitive()
    </button>
    <button class="controlButton" id="structIsOrderedButton" hx-get="structIsOrdered.cfm" hx-target="#outputDiv">
        StructIsOrdered()
    </button>
    <button class="controlButton" id="structIsEmptyButton" hx-get="structIsEmpty.cfm" hx-target="#outputDiv">
        StructIsEmpty()
    </button>
    <button class="controlButton" id="structKeyArrayButton" hx-get="structKeyArray.cfm" hx-target="#outputDiv">
        StructKeyArray()
    </button>
    <button class="controlButton" id="structKeyExistsButton" hx-get="structKeyExists.cfm" hx-target="#outputDiv">
        StructKeyExists()
    </button>
    <button class="controlButton" id="structKeyListButton" hx-get="structKeyList.cfm" hx-target="#outputDiv">
        StructKeyList()
    </button>
    <button class="controlButton" id="structMapButton" hx-get="structMap.cfm" hx-target="#outputDiv">
        StructMap()
    </button>
    <button class="controlButton" id="structNewButton" hx-get="structNew.cfm" hx-target="#outputDiv">
        StructNew()
    </button>
    <button class="controlButton" id="structSetMetadataButton" hx-get="structSetMetadata.cfm" hx-target="#outputDiv">
        StructSetMetadata()
    </button>
    <button class="controlButton" id="structSortButton" hx-get="structSort.cfm" hx-target="#outputDiv">
        StructSort()
    </button>
    <button class="controlButton" id="structReduceButton" hx-get="structReduce.cfm" hx-target="#outputDiv">
        StructReduce()
    </button>
    <button class="controlButton" id="structToSortedButton" hx-get="structToSorted.cfm" hx-target="#outputDiv">
        StructToSorted()
    </button>
    <button class="controlButton" id="structUpdateButton" hx-get="structUpdate.cfm" hx-target="#outputDiv">
        StructUpdate()
    </button>
    </div>
    <div id="outputDiv" class="outputDiv"></div>
</body>
<script src="https://unpkg.com/htmx.org@1.9.12"></script>
</html>


