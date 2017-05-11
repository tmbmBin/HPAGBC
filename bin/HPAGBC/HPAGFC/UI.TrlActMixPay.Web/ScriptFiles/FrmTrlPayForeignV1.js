
//2013.11.11：Edit：抽出搬到 FrmTrlPayForeignV1.js 內，因為要和 UI.ToMasterDb.Web 共用此頁
function fnCallReportMenuAct(parParams) {

    var strParams;
    strParams = parParams;
    window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=PM" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');

}


//2013.08.20：Add：增加黏存單付款方式
//2013.11.11：Edit：抽出搬到 FrmTrlPayForeignV1.js 內，因為要和 UI.ToMasterDb.Web 共用此頁
function fnCallPayDtlDialog(parParams) {
    parParams += "&datastage=P&SessID=" + document.getElementById("TBPayDtlData").value;
    var strReturnVal = showModalDialog("../AppCtrlCustom/FrmPayMethod.aspx?" + parParams, window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
    if (strReturnVal != "Cancel") {
        document.all("TBPayDtlData").value = strReturnVal;
        //document.all("TextBox1").value=  strReturnVal;
    }
}