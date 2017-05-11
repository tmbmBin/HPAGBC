$(function () {

    var acmActKind = $("[MyName='hdfAcmActKind']").val();
    var $gpTrl = $("[MyName='gpTrl'], [MyName='TBdlAcvDesc']");

    //2013.08.12：Add
    //2013.09.10：Edit：一律隱藏
    if (acmActKind == "1") {  //差旅
        if ($gpTrl.length > 0) {
            $gpTrl.each(function () {
                $(this).hide();
            });
        }
    } else {
        if ($gpTrl.length > 0) {
            $gpTrl.each(function () {
                //$(this).show();
                $(this).hide();
            });
        }
    }


    var $TBPayMoney = $("[MyName='TBPayMoney']");

    //2013.11.20：Add
    if ($TBPayMoney.length > 0) {
        $("[MyName='TBdlAcvMoney']").blur(function () {
            GetTotalPayMoney();
            CheckOverPay($(this));
            //CheckUpLevlMoney(this);
        });

        $("[id$='CBdlDel']").click(function () {
            GetTotalPayMoney();
            CheckOverPay($(this));
        });
    }
});


/// 檢查 報支金額是否超過原申請金額，並控制是否允許新增一列
//#region CheckOverPay
function CheckOverPay(jqSender) {
    /// <summary>
    /// 檢查 報支金額是否超過原申請金額，並控制是否允許新增一列
    /// </summary>
    /// <param name="jqSender">明細控制項</param>
    /// <remarks>2013.11.20：Add</remarks>

    var $trSender = jqSender.parentsUntil("tr").parent();
    var $TBdlAcvMoneySender = $("[MyName='TBdlAcvMoney']", $trSender);
    var MyParentIndex = $TBdlAcvMoneySender.attr("MyParentIndex");

    var $TBdgAcvMoney = $("[MyName='TBdgAcvMoney'][MyIndex='" + MyParentIndex + "']");
    var $TBdlAcvMoneyes = $("[MyName='TBdlAcvMoney'][MyParentIndex='" + MyParentIndex + "']");
    var $BtnSplit = $("[MyName='BtnSplit'][MyIndex='" + MyParentIndex + "']");

    if ($TBdgAcvMoney.length > 0 && $TBdlAcvMoneyes.length > 0) {
        var fAcvMoney = MyLibraryJs.StringExt.fnGetFloat($TBdgAcvMoney.val());
        var fAcvMoneyGroupTotal = 0;

        $TBdlAcvMoneyes.each(function () {
            var $TBdlAcvMoney = $(this);
            var $tr = $(this).parentsUntil("tr").parent();
            var $CBdlDel = $("[id$='CBdlDel']", $tr);

            var acvMoney = MyLibraryJs.StringExt.fnGetFloat($TBdlAcvMoney.val());

            if (!$CBdlDel[0].checked) {
                fAcvMoneyGroupTotal = MyLibraryJs.MathExt.fnFloatAdd(fAcvMoneyGroupTotal, acvMoney);
            }
        });


        if (fAcvMoney < fAcvMoneyGroupTotal) {
            var tmpNo = MyLibraryJs.StringExt.fnGetInt(MyParentIndex) + 1;
            alert("動支序號為 " + tmpNo + " 報支金額總數大於原動支金額。請重新修改。");
            $BtnSplit.attr("disabled", "disabled");
        } else if (fAcvMoney == fAcvMoneyGroupTotal) {
            $BtnSplit.attr("disabled", "disabled");
        } else {
            $BtnSplit.removeAttr("disabled");
        }
    }
}
//#endregion





function GetTotalPayMoney(parObj) {
    var dblTotal = 0;
    var objPayMoney;
    // dblTotal = 0;
    var bolTarge = false;

    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];

        if (e.getAttribute("MyName") == "TBdlAcvMoney") {
            if (e.value != "") {
                var $tr = $(e).parentsUntil("tr").parent();
                var $CBdlDel = $("[id$='CBdlDel']", $tr);
                //2013.11.04：Fix：打勾移除的不可以被算在內
                if (!$CBdlDel[0].checked) {
                    dblTotal += parseFloat(replaceString(e.value, ",", ""));
                }

            }
        }

        if (e.getAttribute("MyName") == "TBPayMoney" && bolTarge == false) {

            bolTarge = true;
            objPayMoney = e;

        }
    } // next i


    objPayMoney.value = dblTotal;

}


function check_Num() {
    if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45) || (event.keyCode == 46)) {
        return true;
    }
    else { event.keyCode = 0; false; }
}


function CheckUpLevlMoney(parObj) {
    var dblTotal = 0;
    var objDG;
    var bolFlag;
    bolFlag = 0;
    var bolFlag1 = 0;
    var objBtnSplit;
    var objBtnClose;

    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];
        			if (bolFlag == 0) {
        				objDG = document.forms[0].elements[i];

        				if (e.getAttribute("MyName") == "TBdgAcvMoney" && e.MyIndex == parObj.MyParentIndex) {
        					bolFlag = 1;
        				}
        			}

        			if (e.getAttribute("MyName") == "BtnSplit" && bolFlag1 == 0 && e.MyIndex == parObj.MyParentIndex) {
        				objBtnSplit = e;
        			}


        if (e.type == "checkbox" && e.parentNode.MyName == "BtnClose" && e.parentNode.MyIndex == parObj.MyParentIndex) {
            objBtnClose = e;
                }


        if (e.getAttribute("MyName") == "TBdgAdjustMoney" && e.getAttribute("MyIndex") == parObj.MyParentIndex) {
            if (e.value != "") {
                dblTotal += parseFloat(replaceString(e.value, ",", ""));
            }
        }

                if (e.getAttribute("MyName") == "TBdlAcvMoney" && e.getAttribute("MyParentIndex") == parObj.MyParentIndex) {
        				if (e.value != "") {
        					dblTotal += parseFloat(replaceString(e.value, ",", ""));
        				}
        			}
    } // next i

    		if (parseFloat(replaceString(objDG.value, ",", "")) - dblTotal < 0) {
    			var tmpNo
    			tmpNo = parseFloat(parObj.MyParentIndex) + 1;
    			alert("動支序號為 " + tmpNo + " 報支金額總數大於原動支金額。請重新修改。");
    			objBtnSplit.disabled = true;
    			parObj.onfocus;
    		}
    		else {
    			if (parseFloat(replaceString(objDG.value, ",", "")) - dblTotal == 0) {
    				objBtnSplit.disabled = true;
    		        objBtnClose.checked = true;
    			}
    			else {
    				objBtnSplit.disabled = false;
//   objBtnClose.checked = true;
    			}
     
    		}


}

//function GetAutoAdjMoney3(parObj, parIndex) {
//    var dblTotal = 0;

//    //紀錄簽證金額剩於數
//    var objDG;
//    var bolFlag;
//    bolFlag = 0;


//    //紀錄調整數，找到調整數物件，並記錄起來
//    var objAdj
//    var bolAdjFlag
//    bolAdjFlag = 0;

//    for (var i = 0; i < document.forms[0].elements.length; i++) {
//        var e = document.forms[0].elements[i];

//        //找簽證數
//        if (bolFlag == 0) {
//            //objDG =document.forms[0].elements[i];

//            if (e.MyName == "TBdgAcvMoney" && e.MyIndex == parIndex) {
//                objDG = e;
//                bolFlag = 1;
//            }
//        }

//        //找調整數
//        if (bolAdjFlag == 0) {
//            //objAdj =document.forms[0].elements[i];

//            if (e.MyName == "TBdgAdjustMoney" && e.MyIndex == parIndex) {
//                objAdj = e;
//                bolAdjFlag = 1;
//            }
//        }

//        //找出明細總和
//        if (e.MyName == "TBdlAcvMoney" && e.MyParentIndex == parIndex) {
//            if (e.value != "") {
//                dblTotal += parseFloat(replaceString(e.value, ",", ""));
//            }
//        }
//    } // next i


//    //2011.06.01：sender非checkbox也可以計算結案金額
//    if (parObj.type == "checkbox") {
//        if (parObj.checked == true) {

//            objAdj.value = parseFloat(replaceString(objDG.value, ",", "")) - dblTotal;
//            parObj.checked = true;
//        }
//        else {
//            objAdj.value = 0;
//            //parObj.checked=true;
//        }
//    } else {
//        objAdj.value = parseFloat(replaceString(objDG.value, ",", "")) - dblTotal;
//    }
//}


function GetAutoAdjMoney(parObj, parIndex) {
    var dblTotal
    dblTotal = 0;

    //紀錄簽證金額剩於數
    var objDG
    var bolFlag
    bolFlag = 0;


    //紀錄調整數，找到調整數物件，並記錄起來
    var objAdj
    var bolAdjFlag
    bolAdjFlag = 0;

    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];

        //找簽證數
        if (bolFlag == 0) {
            //objDG =document.forms[0].elements[i];

            if (e.getAttribute("MyName") == "TBdgAcvMoney" && e.getAttribute("MyIndex") == parIndex) {
                objDG = e;
                bolFlag = 1;
            }
        }

        //找調整數
        if (bolAdjFlag == 0) {
            //objAdj =document.forms[0].elements[i];

            if (e.getAttribute("MyName") == "TBdgAdjustMoney" && e.getAttribute("MyIndex") == parIndex) {
                objAdj = e;
                bolAdjFlag = 1;
            }
        }

        //找出明細總和
        if (e.getAttribute("MyName") == "TBdlAcvMoney" && e.getAttribute("MyParentIndex") == parIndex) {
            if (e.value != "") {
                dblTotal += parseFloat(replaceString(e.value, ",", ""));
            }
        }
    } // next i

    if (parObj.checked == true) {

        objAdj.value = parseFloat(replaceString(objDG.value, ",", "")) - dblTotal;
        parObj.checked = true;
    }
    else {
        objAdj.value = 0;
        //parObj.checked=true;
    }
}

