
function fnCallPhraseDialog(thisName) {
    var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {
        document.all(thisName).value = document.all(thisName).value + strReturnVal;
        //Form1.TBMemo.value=Form1.TBMemo.value+strReturnVal;
    }
    //Form1.TBFindSql.value=strReturnVal;
}

function fnCallPhraseDialog(thisName, parID ) {
    var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {
        document.all(thisName).value = document.all(thisName).value + strReturnVal;
        //Form1.TBMemo.value=Form1.TBMemo.value+strReturnVal;
    }
    //Form1.TBFindSql.value=strReturnVal;
}


////2013.08.20：Add：增加黏存單付款方式
////2013.11.11：Edit：抽出搬到 FrmTrlPayForeignV1.js 內，因為要和 UI.ToMasterDb.Web 共用此頁
//function fnCallPayDtlDialog(parParams) {
//    parParams += "&datastage=P&SessID=" + document.getElementById("TBPayDtlData").value;
//    var strReturnVal = showModalDialog("../AppCtrlCustom/FrmPayMethod.aspx?" + parParams, window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
//    if (strReturnVal != "Cancel") {
//        document.all("TBPayDtlData").value = strReturnVal;
//        //document.all("TextBox1").value=  strReturnVal;
//    }
//}


function fnCallSearchDialog() {
    var strReturnVal = showModalDialog("FrmSearchPay.aspx?showtype=1&mod=" + document.getElementById("TBModFlag").value, window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
    if (strReturnVal != "Cancel") {
        //				Form1.TBFindSql.value=strReturnVal;
        document.all("TBFindSql").value = strReturnVal;
    }
    //Form1.TBFindSql.value=strReturnVal;
}

function DisableAfterSubmit() {
    var obj = event.srcElement;
    var objs = document.getElementsByTagName('INPUT');
    for (var i = 0; i < objs.length; i++) {
        if (objs[i].type.toLowerCase() == 'submit') {
            objs[i].disabled = true;
        }
    }
}


function fnCallReportMenu(parParams) {

    var strParams;
    strParams = parParams;
    window.open("../UI.CDCTrlRpt.Web/FrmPrintMenu.aspx?visastage=P" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');

}

////2013.11.11：Edit：抽出搬到 FrmTrlPayForeignV1.js 內，因為要和 UI.ToMasterDb.Web 共用此頁
//function fnCallReportMenuAct(parParams) {

//    var strParams;
//    strParams = parParams;
//    window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=PM" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');

//}


function fnOpenTrlDataChoose() {
    var strParams = "";
    //    strParams = "mailYear=" + parMailYear + "&mailNo=" + parMailNo;

    var strReturnVal = showModalDialog("../UI.CDCAtd.Web/FrmSearchTrlData.aspx?" + strParams, window, "dialogWidth:400px;dialogHeight:300px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {
        document.all("TBAbsenceNo").value = strReturnVal;
    }
}
