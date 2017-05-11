
//2013.11.11：Edit：抽出搬到 FrmTrlPrePay.js 內，因為要和 UI.ToMasterDb.Web 共用此頁
function fnCallReportMenu(parParams) {

    var strParams;
    strParams = parParams;
    //strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("TBAcmWordNum").title + "&acmwordnum=" + document.all("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %>  + "&acmkidnum=<%=strDefKidNum  %>" + "&page1qty=7&page2qty=43" ;
    window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=P" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');

}


//2013.11.11：Edit：抽出搬到 FrmTrlPrePay.js 內，因為要和 UI.ToMasterDb.Web 共用此頁
function fnCallPayDtlDialog(parParams) {
    parParams += "&datastage=P&SessID=" + document.getElementById("TBPayDtlData").value;
    var strReturnVal = showModalDialog("../AppCtrlCustom/FrmPayMethod.aspx?" + parParams, window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
    if (strReturnVal != "Cancel") {
        document.all("TBPayDtlData").value = strReturnVal;
        //document.all("TextBox1").value=  strReturnVal;
    }
}