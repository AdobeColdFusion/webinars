<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CFML Arrays Factory</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style.css">
</head>
<body hx-get="addToArray.cfm" hx-target="#inputSpan" hx-trigger="load">
    <h1 class="title">CFML Arrays Factory</h1>
    <div id="inputDiv" class="inputDiv">
        <form>
        
        <input type="text" id="arrayItem" name="arrayItem">
        <button hx-post="addToArray.cfm" hx-target="#inputSpan" id="addArrayItem">Add Array Item</button>
        <button type="button" id="clearArray" hx-post="clearArray.cfm" hx-target="#inputSpan">Clear Array</button>
        </form>
        <span id="inputSpan"></span>
    </div>
    <div id="controlsDiv" class="controlsDiv">
    <button class="controlButton" id="arrayAppendButton" hx-get="arrayAppend.cfm" hx-target="#outputDiv">
        ArrayAppend()
    </button>
    <button class="controlButton" id="arrayAvgButton" hx-get="arrayAvg.cfm" hx-target="#outputDiv">
        ArrayAvg()
    </button>
    <button class="controlButton" id="arrayClearButton" hx-get="arrayClear.cfm" hx-target="#outputDiv">
        ArrayClear()
    </button>
    <button class="controlButton" id="arrayContainsButton" hx-get="arrayContains.cfm" hx-target="#outputDiv">
        ArrayContains()|ArrayContainsNoCase()
    </button>
    <button class="controlButton" id="arrayDeleteButton" hx-get="arrayDelete.cfm" hx-target="#outputDiv">
        ArrayDelete()|ArrayDeleteNoCase()
    </button>
    <button class="controlButton" id="arrayDeleteAtButton" hx-get="ArrayDeleteAt.cfm" hx-target="#outputDiv">
        ArrayDeleteAt()
    </button>
    <button class="controlButton" id="arrayEachButton" hx-get="ArrayEach.cfm" hx-target="#outputDiv">
        ArrayEach()
    </button>
    <button class="controlButton" id="arrayFilterButton" hx-get="arrayFilter.cfm" hx-target="#outputDiv">
        ArrayFilter()
    </button>
    <button class="controlButton" id="arrayFindButton" hx-get="arrayFind.cfm" hx-target="#outputDiv">
        ArrayFind()|ArrayFindNoCase()
    </button>
    <button class="controlButton" id="arrayFindAllButton" hx-get="arrayFindAll.cfm" hx-target="#outputDiv">
        ArrayFindAll()|ArrayFindAllNoCase()
    </button>
    <button class="controlButton" id="arrayInsertAtButton" hx-get="ArrayInsertAt.cfm" hx-target="#outputDiv">
        ArrayInsertAt()
    </button>
    <button class="controlButton" id="arrayIsDefinedButton" hx-get="ArrayIsDefined.cfm" hx-target="#outputDiv">
        ArrayIsDefined()
    </button>
    <button class="controlButton" id="arrayIsEmptyButton" hx-get="ArrayIsEmpty.cfm" hx-target="#outputDiv">
        ArrayIsEmpty()
    </button>
    <button class="controlButton" id="arrayLenButton" hx-get="ArrayLen.cfm" hx-target="#outputDiv">
        ArrayLen()
    </button>
    <button class="controlButton" id="arrayMapButton" hx-get="ArrayMap.cfm" hx-target="#outputDiv">
        ArrayMap()
    </button>
    <button class="controlButton" id="arrayMaxButton" hx-get="ArrayMax.cfm" hx-target="#outputDiv">
        ArrayMax()
    </button>
    <button class="controlButton" id="arrayMinButton" hx-get="ArrayMin.cfm" hx-target="#outputDiv">
        ArrayMin()
    </button>
    <button class="controlButton" id="arrayNewButton" hx-get="ArrayNew.cfm" hx-target="#outputDiv">
        ArrayNew()
    </button>
    <button class="controlButton" id="arrayPrependButton" hx-get="ArrayPrepend.cfm" hx-target="#outputDiv">
        ArrayPrepend()
    </button>
    <button class="controlButton" id="arrayReduceButton" hx-get="ArrayReduce.cfm" hx-target="#outputDiv">
        ArrayReduce()
    </button>
    <button class="controlButton" id="arrayResizeButton" hx-get="ArrayResize.cfm" hx-target="#outputDiv">
        ArrayResize()
    </button>
    <button class="controlButton" id="arraySetButton" hx-get="ArraySet.cfm" hx-target="#outputDiv">
        ArraySet()
    </button>
    <button class="controlButton" id="arraySetMetaDataButton" hx-get="ArraySetMetaData.cfm" hx-target="#outputDiv">
        ArraySetMetaData()
    </button>
    <button class="controlButton" id="arraySliceButton" hx-get="ArraySlice.cfm" hx-target="#outputDiv">
        ArraySlice()
    </button>
    <button class="controlButton" id="arraySortButton" hx-get="ArraySort.cfm" hx-target="#outputDiv">
        ArraySort()
    </button>
    <button class="controlButton" id="arraySumButton" hx-get="ArraySum.cfm" hx-target="#outputDiv">
        ArraySum()
    </button>
    <button class="controlButton" id="arraySwapButton" hx-get="ArraySwap.cfm" hx-target="#outputDiv">
        ArraySwap()
    </button>
    <button class="controlButton" id="arrayToListButton" hx-get="ArrayToList.cfm" hx-target="#outputDiv">
        ArrayToList()
    </button>
    <button class="controlButton" id="arrayPushButton" hx-get="ArrayPush.cfm" hx-target="#outputDiv">
        ArrayPush()
    </button>
    <button class="controlButton" id="arrayPopButton" hx-get="ArrayPop.cfm" hx-target="#outputDiv">
        ArrayPop()
    </button>
    </div>
    <div id="outputDiv" class="outputDiv"></div>
</body>
<script src="https://unpkg.com/htmx.org@1.9.12"></script>
</html>