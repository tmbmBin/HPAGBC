function GetRowTotal(parObj, RetFlag, NotSetMoneyFlag) {
    var Obj, TRObj = FindTagName(parObj, "TR");
    if (!TRObj) return null;
    var i, j, Idx, Str;
    var CmpLen = "TBdgMoney".length;
    var QryObj;
    var PObjAry = new Array();
    var MObjAry = new Array();
    var MoneyIdxAry = new Array();//Ary:del+P1+M1+P2+M2+P3+M3
    var MinIdxAry = new Array();//Ary:MinMoneyIdx+MinPriceIdx
    for (j = 0; j < TRObj.cells.length; j++)
        for (i = 0; i < TRObj.cells[j].childNodes.length; i++) {
            Obj = TRObj.cells[j].childNodes[i];

            var myName = "";
            if ("undefined" != typeof (Obj.getAttribute))
                myName = Obj.getAttribute("MyName");

            if ("" != myName && null != myName) {
                if (!QryObj && myName == "TBdgProdQry") QryObj = Obj;
                else if (!MoneyIdxAry[0] && myName == "CBdgDel") MoneyIdxAry[0] = j;
                else if (!MinIdxAry[0] && myName == "TBdgMinMoney") MinIdxAry[0] = j;
                else if (!MinIdxAry[1] && myName == "TBdgMinPrice") MinIdxAry[1] = j;
                else {
                    Str = myName.substr(0, CmpLen);
                    if (Str == "TBdgPrice") {
                        Idx = atoi(myName.substr(CmpLen));
                        if (Idx > 0) {
                            PObjAry[Idx - 1] = Obj;
                            MoneyIdxAry[Idx * 2 - 1] = j;//cells
                        }
                    } else {
                        if (Str == "TBdgMoney") {
                            Idx = atoi(myName.substr(CmpLen));
                            if (Idx > 0) {
                                MObjAry[Idx - 1] = Obj;
                                MoneyIdxAry[Idx * 2] = j;//cells
                            }
                        }
                    }//if
                }//if 
            }//if                  
        }//for
    if (!NotSetMoneyFlag) {
        var PriceVal, QryVal = 0;
        if (QryObj && QryObj.value) {
            QryVal = GetNum(QryObj.value);
            if (!QryVal) QryObj.value = 0;
            else QryObj.value = NumToFStr(QryVal);
        }
        for (i = 0; i < MObjAry.length; i++)
            if (PObjAry[i] && MObjAry[i]) {
                PriceVal = GetNum(PObjAry[i].value);
                if (!PriceVal && PObjAry[i].value != "0") PObjAry[i].value = "";
                else PObjAry[i].value = NumToFStr(PriceVal);
                MObjAry[i].value = NumToFStr(QryVal * PriceVal, 0);
            }
    }//if
    if (RetFlag == 1) return MoneyIdxAry;
    else if (RetFlag == 2) return MinIdxAry;
    return GetMinCol(TRObj, MoneyIdxAry, MinIdxAry);//auto set min_total                             
}

function GetMinCol(parObj, MoneyIdxAry, MinIdxAry) {
    var Obj, TBObj = FindTagName(parObj, "TABLE");
    if (!TBObj) return null;
    if (!MoneyIdxAry) MoneyIdxAry = GetRowTotal(parObj, 1, true);
    var FindStrHead = "TBdgMoney";
    var CmpLen = FindStrHead.length;
    var MoneyAry = new Array();
    var i, j, k, Idx, DelFlag;
    for (k = 0; k < MoneyIdxAry.length - 1; k++) MoneyAry[k] = 0;
    for (j = 0; j < TBObj.rows.length; j++) {
        for (k = 0; k < MoneyIdxAry.length; k += 2) //Ary:del+P1+M1+P2+M2+P3+M3
            if (MoneyIdxAry[k] != null) {
                Obj = TBObj.rows[j].cells[MoneyIdxAry[k]].childNodes;
                DelFlag = false;
                for (i = 0; i < Obj.length; i++) {
                    var myName = "";
                    if ("undefined" != typeof (Obj[i].getAttribute))
                        myName = Obj[i].getAttribute("MyName");

                    if ("" == myName || null == myName)
                        continue;

                    if (k == 0) { //DelFlag  
                        if (myName == "CBdgDel")
                            DelFlag = Obj[i].checked;
                    } else  //TBdgMoney     
                        if (myName.substr(0, CmpLen) == FindStrHead) {
                            Idx = atoi(myName.substr(CmpLen));
                            if (Idx > 0) {
                                MoneyAry[Idx - 1] += atoi(Obj[i].value);
                                Obj[i].value = NumToFStr(Obj[i].value, 0);
                            }
                        }
                }//for-i
                if (DelFlag) break;
            }//if                
    }//for
    var MinMoney = 0, MinIdx = -1;
    for (k = 0; k < MoneyAry.length; k++) {
        if (k == 0 || (MoneyAry[k] && MoneyAry[k] < MinMoney))
        { MinMoney = MoneyAry[k]; MinIdx = k; }
    }

    Obj = FindObj("TBExtraTotal", "MyName", document.forms[0].elements);
    if (Obj) {
        Obj.value = NumToFStr(MinMoney);
        $("[MyName='TBExtraTotal']").trigger("keyup");
    }

    GetColTotal(MinIdx + 1, TBObj, MoneyIdxAry, MinIdxAry)

    return MinIdx + 1; //1:Money1 or 2:Money2 or 3:Money3           
}

function GetColTotal(MinIdx, parObj, MoneyIdxAry, MinIdxAry) {
    var Obj, TBObj = FindTagName(parObj, "TABLE");
    if (!TBObj) return null;
    if (!MoneyIdxAry) MoneyIdxAry = GetRowTotal(parObj, 1, true);
    if (!MinIdxAry) MinIdxAry = GetRowTotal(parObj, 2, true);
    var MinMoneyObj, MoneyObj, MinPriceObj, PriceObj;
    var j;
    if (!MinIdx) MinIdx = 1;
    if (MoneyIdxAry && MinIdxAry)
        for (j = 0; j < TBObj.rows.length; j++) {
            if (MinIdxAry[0] != null && MoneyIdxAry[MinIdx * 2] != null) {
                MinMoneyObj = FindObj("TBdgMinMoney", "MyName", TBObj.rows[j].cells[MinIdxAry[0]].childNodes);
                MoneyObj = FindObj("TBdgMoney" + MinIdx, "MyName", TBObj.rows[j].cells[MoneyIdxAry[MinIdx * 2]].childNodes);
                if (MinMoneyObj && MoneyObj) MinMoneyObj.value = atoi(MoneyObj.value);
            }
            if (MinIdxAry[1] != null && MoneyIdxAry[MinIdx * 2 - 1] != null) {
                MinPriceObj = FindObj("TBdgMinPrice", "MyName", TBObj.rows[j].cells[MinIdxAry[1]].childNodes);
                PriceObj = FindObj("TBdgPrice" + MinIdx, "MyName", TBObj.rows[j].cells[MoneyIdxAry[MinIdx * 2 - 1]].childNodes);
                if (MinPriceObj && PriceObj) MinPriceObj.value = atoi(PriceObj.value);
            }
        }//for 
}


