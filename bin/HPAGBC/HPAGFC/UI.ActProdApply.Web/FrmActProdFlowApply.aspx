﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActProdFlowApply.aspx.vb" Inherits="UI.ActProdApply.Web.FrmActProdFlowApply" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="Microsoft.Security.Application" %>
<%--20151008 [Add]:附加檔案功能--%>
<%@ Register Assembly="Sys.FileUploadManager" Namespace="Sys.FileUploadManager.ServerControl" TagPrefix="TM" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
    <script language="javascript" src="../ScriptFiles/ShowBgtWeb/ShowBudget.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/JSPlanPicker.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/setSeleGroup.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/setFrameSize.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/TableSum.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/TableTools.js" type="text/javascript"></script>
<%--    <script language="javascript" src="../ScriptFiles/SearchNum.js" type="text/javascript"></script>--%>
    <script language="javascript" src="../ScriptFiles/JSComFun.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/jquery-1.9.1-fix.min.js" type="text/javascript"></script>

    <script language="javascript" src="../ScriptFiles/pubFn.js" type="text/javascript"></script>
</head>

<script language="javascript" type="text/javascript">

    function fnCallPhraseDialog(thisName) {

        var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

        if (strReturnVal != "Cancel") {
            getObjByID(thisName).value = getObjByID(thisName).value + strReturnVal;
        }
    }


    function UCDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        document.getElementById("TBAcmMarkDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
    }

    function UCNeedDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        document.getElementById("TBAcmNeedDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
    }

    function UCReturnDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        document.getElementById("TBAcpReturnDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
    }

    function UCPrePayDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        document.getElementById("TBAcpPrePayDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
    }


    function UCPassDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        document.getElementById("TBAcmPassDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
    }
    function UCRequireDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        document.getElementById("TBAcmRequireDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
    }

    function fnCallSearchDialog() {

        var strReturnVal = showModalDialog("FrmSearch.aspx?showtype=1&mod=" + "<%=strModFlag %>", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

        if (strReturnVal != "Cancel") {
            getObjByID("TBFindSql").value = strReturnVal;
        }
    }



    function setEmpName(parObj) {
        var tmpArray;

        tmpArray = parObj.options[parObj.selectedIndex].innerText.split(" ");
        getObjByID("TBEmpName").value = tmpArray[1];
    }


    function checkVisaKind(parVal) {

        //			if (parseFloat(replaceString(parVal,",","")) >0 && parseFloat(replaceString(parVal,",","")) <=10000 )
        //			{

        //				getObjByID("CBAllowanceFlag").checked=true;
        //			}
        //			else
        //			{
        //				getObjByID("CBAllowanceFlag").checked=false;
        //			}
    }







    function fnCallReportMenu() {

        var strParams;
        strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + getObjByID("TBAcmWordNum").title + "&acmwordnum=" + getObjByID("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %> + "&acmkidnum=<%=strDefKidNum  %>" + "&page1qty=7&page2qty=43";
            window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=M" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');

        }





        function fnCallTelDialog(thisName) {

            var strEmpNo = getObjByID("DDLStaffName").value;

            if (strEmpNo != "") {
                var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmbasPayName.aspx?staffno=" + strEmpNo + "&funtype=1", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
                if (strReturnVal != "Cancel") 
                    getObjByID(thisName).value = strReturnVal;
            }
        }

        function ShowProdData() {
            if (getObjByID("CBDocFlag").checked == true || getObjByID("CBAcmActKind").checked == true) {
                try { getObjByID("TRTmpProdData").style.display = "none"; } catch (e) { }
                try { getObjByID("TRTmpProdData1").style.display = "none"; } catch (e) { }
            }
            else {
                try { getObjByID("TRTmpProdData").style.display = "block"; } catch (e) { }
                try { getObjByID("TRTmpProdData1").style.display = "block"; } catch (e) { }
            }

            //20151015 [add]:增加選擇請修單時,請購項目隱藏
            var selectedIndex = getObjByID("DDLAcmFormName").selectedIndex;
            if (selectedIndex > -1) {
                var selectedValue = getObjByID("DDLAcmFormName").options[selectedIndex].value;
                if (selectedValue == "請修單") {
                    try { getObjByID("TRTmpProdData").style.display = "none"; } catch (e) { }
                    try { getObjByID("TRTmpProdData1").style.display = "none"; } catch (e) { }
                }
            }

            //20151023 [add]:增加業務單位隱藏動支項目
            var CheckMod =<%=strCheckModFlag %> +'';
            //alert(CheckMod);
            if (CheckMod == "9") {
                //<%--20160805 預算科目登錄改由申請者進行登打。(改為申請者可打可不打(原本隱藏),控帳人員一定要打)--%>
                // try { getObjByID("TRTmpActData").style.display = "none"; } catch (e) { }
                try { getObjByID("TDAcmMoney").style.display = "none"; } catch (e) { }
            }
            else {
                try { getObjByID("TDAcmMoney").style.display = "none"; } catch (e) { }
            }
        }

            function ShowTmpPayData(parSObj, parTObj) {
                if (getObjByID("CBAutoTempPay").checked == true) {
                    try { getObjByID("TRTmpPayData").style.display = "block"; } catch (e) { }
                    try { getObjByID("TRTmpPayData1").style.display = "block"; } catch (e) { }

                }
                else {
                    try { getObjByID("TRTmpPayData").style.display = "none"; } catch (e) { }
                    try { getObjByID("TRTmpPayData1").style.display = "none"; } catch (e) { }


                }
            }


            function ShowAddVisaData(parSObj, parTObj) {
                if (getObjByID("CBAddVisa").checked == true) {
                    try { getObjByID("TDAddVisaData1").style.display = "block"; } catch (e) { }
                    try { getObjByID("TDAddVisaData2").style.display = "block"; } catch (e) { }
                }
                else {
                    try { getObjByID("TDAddVisaData1").style.display = "none"; } catch (e) { }
                    try { getObjByID("TDAddVisaData2").style.display = "none"; } catch (e) { }

                }
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

            //20151105 [add]:增加請購總金額自動帶回動支金額
            function SetAcmMoney1() {
                var objTarget;
                var sourceTarget;

                //20151110 [add]:增加不等於請修單時,請購總金額才自動帶回動支金額
                var selectedIndex = getObjByID("DDLAcmFormName").selectedIndex;
                if (selectedIndex > -1) {
                    var selectedValue = getObjByID("DDLAcmFormName").options[selectedIndex].value;
                    if (selectedValue != "請修單") {
                        for (var i = 0; i < document.forms[0].elements.length; i++) {
                            var e = document.forms[0].elements[i];
                            if (e.getAttribute("MyName") == "TBAcmMoney1") {
                                objTarget = e;
                            }
                            if (e.getAttribute("MyName") == "TBExtraTotal") {
                                sourceTarget = e;
                            }
                        }
                        objTarget.value = sourceTarget.value;
                        $(document).on("keyup", "[MyName='TBExtraTotal']", function () {
                            $("[MyName='TBAcmMoney1']").val(NumToFStr($(this).val()));
                        });
                        //alert(objTarget.id);
                        //alert(sourceTarget.id);
                        //objTarget.setExpression("value", sourceTarget.id + ".value", "");
                    }
                }
            }
</script>
<style type="text/css">
    .styTitle4C {
        width: 75px;
        text-align: right;
    }

    .styTitle5C {
        width: 85px;
        text-align: right;
    }

    .styData90W {
        width: 90px;
        text-align: left;
    }

    .styData120W {
        width: 120px;
        text-align: left;
    }

    .styData100W {
        width: 100px;
        text-align: left;
    }
</style>


<style>
    /* 可摺疊標題 */
    .sFoldTitle {
        background-color: #6699FF;
        CURSOR: hand;
    }

    .sFoldTitleFont {
        font-size: 10pt;
        color: #FFFFFF;
        padding-top: 4px;
        padding-left: 4px;
    }
    /* DataGrid寬高 */
    .DIV0_width {
        width: 590px;
        height: auto;
        overflow: hidden;
        border-style: groove;
        border-width: 1px;
    }

    .DIV1_width {
        width: 590px;
        height: 166px;
        overflow: auto;
        border-style: groove;
        border-width: 1px;
    }

    .DIV1_noWidth {
        width: auto;
        height: auto;
        overflow-x: scroll;
        border-style: groove;
        border-width: 1px;
    }

    .DIV2_width {
        width: 590px;
        height: 95px;
        overflow: auto;
        border-style: groove;
        border-width: 1px;
    }

    .DIV2_noWidth {
        width: auto;
        height: auto;
        overflow-x: scroll;
        border-style: groove;
        border-width: 1px;
    }

    .DIV3_width {
        width: 590px;
        height: 87px;
        overflow: auto;
        border-style: groove;
        border-width: 1px;
    }

    .DIV3_noWidth {
        width: auto;
        height: auto;
        overflow-x: scroll;
        border-style: groove;
        border-width: 1px;
    }

    .DIV1_FreezingCol {
        LEFT: expression(document.getElementById("div_grid_acpDtlExtra").scrollLeft+1);
        /*freezingDiv is the name of the div to make your datagrid scrollable */
        POSITION: relative;
        z-index: 9;
        border-top: 0px solid #FFFFFF;
        border-bottom: 0px solid;
        border-left: 0px solid #003366;
        border-right: 0px solid #FFFFFF;
    }

    .DIV1_FreezingCol2 {
        LEFT: expression(document.getElementById("div_grid_acpDtlExtra").scrollLeft+1);
        /*freezingDiv is the name of the div to make your datagrid scrollable */
        POSITION: relative;
        z-index: 9;
        border-top: 0px solid #FFFFFF;
        border-bottom: 0px solid;
        border-left: 0px solid #003366;
        border-right: 1px solid #FFFFFF;
    }
</style>

<script language="javascript" type="text/javascript">
<!--

    function show_item(item, sender) {
        var item_style = getObjByID(item).style;

        if (typeof sender != "undefined") {
            if (document.getElementById(sender).src.slice(-8) == 'plus.gif') {
                item_style.display = "block";
            }
            else {
                item_style.display = "none";
            }
        }
        else {

            if (item_style.display == 'none') {
                item_style.display = "block";
            }
            else {
                item_style.display = "none";
            }
        }
    }

    function sync_title_img(sender) {
        if (sender.style.display == 'block') {
            document.getElementById("img_" + sender.id).src = "images/minus.gif";
        }
        else {
            document.getElementById("img_" + sender.id).src = "images/plus.gif";
        }
    }


    function scale_item(sender) {
        var pORm;
        if (document.getElementById(sender).src.slice(-8) == 'plus.gif')
            pORm = "+";
        else
            pORm = "-";

        //	scale_item_by(pORm, "table");
        //	scale_item_by(pORm, "td");
        scale_item_by(pORm, "div");
        //	scale_item_by(pORm, "hr");

        if (pORm == "+")
            document.getElementById(sender).src = "images/minus.gif";
        else
            document.getElementById(sender).src = "images/plus.gif";
    }

    function scale_item_by(pORm, tagName) {
        var obj = document.getElementsByTagName(tagName);
        for (var i = 0; i < obj.length; i++)
            try {
                if (obj[i].alt != undefined)
                    //alert(obj[i].alt);
                    if (pORm == "+") {
                        obj[i].className = obj[i].alt + "_noWidth";
                    }
                    else {
                        obj[i].className = obj[i].alt + "_width";
                    }
            } catch (e) {; }
    }

    function GetIEVer() {
        var x;
        for (i = 0; i < 10; i++) {
            for (z = 0; z < 10; z++) {
                if (navigator.appVersion.match("MSIE " + i + "." + z) != null)
                    x = i + "." + z;
            }
        }
        return x;
    }

    function SetCookie(sName, sValue) {
        keepDay = 7;
        setDay = new Date();
        setDay.setTime(setDay.getTime() + (keepDay * 1000 * 60 * 60 * 24));
        expDay = setDay.toGMTString();

        document.cookie = sName + "=" + escape(sValue) + "; expires=" + expDay;
    }

    function GetCookie(sName) {
        var aCookie = document.cookie.split("; ");
        for (var i = 0; i < aCookie.length; i++) {
            var aCrumb = aCookie[i].split("=");
            if (sName == aCrumb[0])
                return unescape(aCrumb[1]);
        }
        return null;
    }

    function GetPageName() {
        var strHref = window.location.href;
        var pageName = strHref.slice(strHref.lastIndexOf("/") + 1);
        pageName = (pageName + "?").split("?")[0];
        return pageName;
        //	return (window.location.href).slice((window.location.href).lastIndexOf("/") + 1);
    }

    function jRight(text, numb) {
        var str = text;
        str = str.substring(str.length - numb, str.length);
        return str;
    }

    function set_cookies() {
        try { SetCookie(GetPageName() + ":FoldTitle_12", FoldTitle_12.style.display); } catch (e) {; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_20", FoldTitle_20.style.display); } catch (e) {; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_11", FoldTitle_11.style.display); } catch (e) {; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_40", FoldTitle_40.style.display); } catch (e) {; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_42", FoldTitle_42.style.display); } catch (e) {; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_50", FoldTitle_50.style.display); } catch (e) {; } //折疊項目

        try { SetCookie(GetPageName() + ":div_UCActVisa", div_UCActVisa.className); } catch (e) {; } //縮放表格
        try { SetCookie(GetPageName() + ":div_UCProdApply", div_UCProdApply.className); } catch (e) {; } //縮放表格
    }

    function get_cookies() {
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_12"), "FoldTitle_12", "img_FoldTitle_12"); } catch (e) {; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_20"), "FoldTitle_20", "img_FoldTitle_20"); } catch (e) {; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_11"), "FoldTitle_11", "img_FoldTitle_11"); } catch (e) {; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_40"), "FoldTitle_40", "img_FoldTitle_40"); } catch (e) {; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_42"), "FoldTitle_42", "img_FoldTitle_42"); } catch (e) {; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_50"), "FoldTitle_50", "img_FoldTitle_50"); } catch (e) {; } //折疊項目

        try { SetDiv(GetCookie(GetPageName() + ":div_UCActVisa"), "div_UCActVisa", "img12"); } catch (e) {; } //縮放表格
        try { SetDiv(GetCookie(GetPageName() + ":div_UCProdApply"), "div_UCProdApply", "img20"); } catch (e) {; } //縮放表格
    }

    function SetFold(sValue, item, sender) {
        if (sValue == "block") {
            document.getElementById(item).style.display = "block";
            document.getElementById(sender).src = "images/minus.gif";
        }
        else {
            document.getElementById(item).style.display = "none";
            document.getElementById(sender).src = "images/plus.gif";
        }
    }

    function SetDiv(sValue, item, sender) {
        document.getElementById(item).className = sValue;
        if (jRight(sValue, 7) == "noWidth") {
            document.getElementById(sender).src = "images/minus.gif";
        }
        else {
            document.getElementById(sender).src = "images/plus.gif";
        }
    }
    $(function () {
        if ($("#hdnTBA1Disable").val() == '1') {
            $("[MyName='TBAcmMoney1']").focus(function () {
                $(this).blur();
            });
        }
    });
    //-->
</script>

<%--20151013 [Edit]:加入附加檔案功能需修改 head 位置--%>
<%--</head>--%>
<body topmargin="5" leftmargin="10" rightmargin="0" bottommargin="50" onload='get_cookies();ShowTmpPayData();ShowProdData();ShowAddVisaData();' onunload='set_cookies()'>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="hdnTBA1Disable" />
        <table id="TablePass" runat="server" style="display: block; margin-top: 0px; margin-left: 0px; border-collapse: collapse; display: none" cellpadding="5" width="600" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668" valign="top" align="left">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668">
                                <table border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout: fixed">
                                    <tr style="display: block">
                                        <td style="color: #FF0000; width: 75px;" align="right">
                                            <asp:Label ID="LBPassDate" runat="server" Text="核支日期"></asp:Label></td>
                                        <td style="width: 110px;">
                                            <asp:TextBox ID="TBAcmPassDate" runat="server" MyName="TBAcmPassDate" Style="text-align: center; background-color: #FFE0C0" Width="90px" ondblclick="JavaScript: UCPassDate.Show();"></asp:TextBox></td>
                                        <td style="color: #FF0000; width: 85px;" align="right">&nbsp;</td>
                                        <td style="width: 110px;"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td style="height: 10px"></td>
            </tr>
        </table>
        <table border="0" cellpadding="0" style="border-collapse: collapse">
            <tr>
                <td valign="top">
                    <!-- 左框架START -->
                    <table cellpadding="0" style="border-collapse: collapse" border="0">
                        <tr>
                            <td valign="top">
                                <table cellpadding="0" style="border-collapse: collapse" border="1" bordercolor="#666668" bgcolor="#DADEE9">
                                    <tr>
                                        <td style="padding-top: 1px" onpropertychange="try{childNodes.width = this.clientWidth;}catch(e){;};">
                                            <!-- ↓審核原因 -->
                                            <!-- 審核原因↑ -->
                                            <!-- ↓審核 -->
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
                                                <%--20150825 [mdf]:修改 顯示 審核選項 勾選 --%>
                                                <%--<tr style="display:none">--%>
                                                <tr>
                                                    <td style="padding: 5px">

                                                        <table cellpadding="0" style="border-collapse: collapse; width: 600px" border="0">
                                                            <tr>
                                                                <td align="right">
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox
                                                                                    ID="CBAcmPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left"
                                                                                    Text="會計室審核" Visible="False" />
                                                                                <asp:CheckBox ID="CBAcmUnitPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Visible="True" Text="單位審核" />
                                                                            </td>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBSecrearyFlag" runat="server" Font-Size="X-Small"
                                                                                    TextAlign="Left" Text="秘書室審核" Visible="False" /></td>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox
                                                                                    ID="CBAccPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left"
                                                                                    Text="會計室審核" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- 審核↑ -->
                                            <!-- ↓區塊(1) -->
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
                                                <tr>
                                                    <td style="padding: 0px">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="table-layout: fixed; width: 600px">
                                                            <tr>
                                                                <td style="text-align: left; width: 370px">
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBAllowanceFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="零用金" Visible="True" onclick="chkTmpPayAndCash();" /></td>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBSeparateFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="分期付款" Visible="True" /></td>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBEPayment" runat="server" Font-Size="X-Small" TextAlign="Right" Text="電子支付" Visible="True" onclick="chkTmpPayAndCash();" /></td>
                                                                            <%--20151015 [mdf]:隱藏 簽文勾選選項,改為表單名稱下拉式選單--%>
                                                                            <%--20151021 [mdf]:還原 簽文勾選選項--%>
                                                                            <%--20151029 [mdf]:隱藏 簽文勾選選項--%>
                                                                            <%--  <td style="padding-right: 5px" nowrap >
                                                                                <asp:CheckBox ID="CBDocFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="簽文" onclick="ShowProdData();" /></td>--%>
                                                                            <td style="padding-right: 5px; display: none" nowrap>
                                                                                <asp:CheckBox ID="CBDocFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="簽文" onclick="ShowProdData();" /></td>
                                                                            <td style="padding-right: 5px; display: none" nowrap>
                                                                                <asp:CheckBox ID="CBAcmActKind" runat="server" Font-Size="X-Small" TextAlign="Right" Text="國外差旅" onclick="ShowProdData();" /></td>
                                                                            <%--20151015 [add]:增加表單名稱下拉式選單--%>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:DropDownList ID="DDLAcmFormName" runat="server" AutoPostBack="true" Width="100" Visible="true" Style="background-color: #FFFFE0">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="text-align: right">
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr>
                                                                            <td style="padding-right: 5px; display: none" nowrap>
                                                                                <asp:CheckBox ID="CBAutoTempPay" runat="server" Font-Size="X-Small" TextAlign="Right" Text="逕行暫付" Visible="True" onclick="ShowTmpPayData(this);chkTmpPayAndCash();" /></td>
                                                                            <td style="padding-right: 5px; display: none" nowrap>
                                                                                <asp:CheckBox ID="CBAutoBid" runat="server" Font-Size="X-Small" TextAlign="Right" Text="自動決標" Visible="True" onclick="chkTmpPayAndCash();" /></td>
                                                                         <%--20151126 [mdf]:簽核流程單據不加簽,隱藏加簽勾選--%>
                                                                          <%--  <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBAddVisa" runat="server" Font-Size="X-Small" TextAlign="Right" Text="加簽" Visible="True" onclick="ShowAddVisaData(this);" /></td>--%>
                                                                          <td style="padding-right: 5px; display:1none" nowrap>
																		     <span id="AddVisaFlagControl" runat="server">
                                                                                <asp:CheckBox ID="CBAddVisa" runat="server" Font-Size="X-Small" TextAlign="Right" Text="加簽" Visible="True" onclick="ShowAddVisaData(this);" />
																		     </span>
																		  </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- 區塊(1)↑ -->
                                            <!-- ↓區塊(2) -->
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
                                                <tr>
                                                    <td style="padding: 0px">
                                                        <table cellpadding="1" cellspacing="0" style="table-layout: fixed" border="0">

                                                            <tr style="display: none">
                                                                <td width="100" align="right">
                                                                    <asp:TextBox ID="TBAcmNoPrv" runat="server" Width="42px" Height="19px" Visible="false"></asp:TextBox></td>
                                                                <td width="100">&nbsp;</td>
                                                                <td width="100" align="right">
                                                                    <asp:TextBox ID="TBCateGrpFlag" runat="server" Width="42px" Visible="false"></asp:TextBox></td>
                                                                <td width="100">
                                                                    <asp:Label ID="LBProdNum" runat="server" Style="font-size: 10pt" Visible="false"></asp:Label>
                                                                </td>
                                                                <td width="100" align="right">&nbsp;</td>
                                                                <td width="100">&nbsp;</td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td align="right" colspan="4">
                                                                    <asp:Label ID="Label2" runat="server" Font-Size="X-Small" ForeColor="Red"
                                                                        Text="流程選擇錯誤將會導致無法核銷，請確認選擇正確的流程。=&gt;"></asp:Label>
                                                                </td>
                                                                <td width="100" align="right">
                                                                    <asp:Literal ID="ltCateGrpText" runat="server" Text="本局/分局" Visible="false"></asp:Literal>
                                                                </td>
                                                                <td width="100">
                                                                    <asp:DropDownList ID="CBCateGrpFlag" runat="server" AutoPostBack="true" Width="100%" Visible="false">
                                                                        <asp:ListItem Text="不區分" Value=""></asp:ListItem>

                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100" align="right">動支編號</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="TBAcmWordNum" runat="server" Style="text-align: center" BackColor="Transparent" Width="90px" onfocus="this.blur();"></asp:TextBox></td>
                                                                <td width="100" align="right">動支金額</td>
                                                                <%--20151020 [mdf]:隱藏原動支金額--%>
                                                                <%--  <td width="100">
                                                                    <asp:TextBox ID="TBAcmMoney" runat="server" MyName="TBAcmMoney" Style="text-align: right" BackColor="Transparent" Width="90" onfocus="this.blur();" onpropertychange="checkVisaKind(this.value);"></asp:TextBox></td>--%>
                                                                <td width="100" id="TDAcmMoney">
                                                                    <asp:TextBox ID="TBAcmMoney" runat="server" MyName="TBAcmMoney" Style="text-align: right" BackColor="Transparent" Width="90" onfocus="this.blur();" onpropertychange="checkVisaKind(this.value);"></asp:TextBox></td>
                                                                <%--20151019 [add]:可編輯動支金額--%>
                                                                <td width="100" id="TDAcmMoney1">
                                                                    <asp:TextBox ID="TBAcmMoney1" runat="server" MyName="TBAcmMoney1" Style="text-align: right" Width="90" onpropertychange="checkVisaKind(this.value);"></asp:TextBox></td>
                                                                <td width="100" align="right" id="TDAddVisaData1">原簽單號</td>
                                                                <td width="100" id="TDAddVisaData2">
                                                                    <asp:TextBox ID="TBAcmTopWordNum" runat="server" Width="90px"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100" align="right">動支日期</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="TBAcmMarkDate" runat="server" Style="text-align: center; background-color: #FFFFE0" Width="90px" ondblclick="JavaScript: UCDate.Show();"></asp:TextBox></td>
                                                                <td width="100" align="right">請辦單位</td>
                                                                <td width="100">
                                                                    <asp:DropDownList ID="DDLWorkDep" Style="background-color: #FFFFE0"
                                                                        runat="server" Width="90px" AutoPostBack="True">
                                                                    </asp:DropDownList></td>
                                                                <td width="100" align="right">請辦人員</td>
                                                                <%--20151027 [mdf]:隱藏原請辦人員 textbox改用下拉式選單--%>
                                                                <%-- <td>
                                                                    <asp:TextBox ID="TBEmpName" runat="server" Style="background-color: #FFFFE0" Width="90px" Enabled="False"></asp:TextBox></td>--%>
                                                                <td style="display: none">
                                                                    <asp:TextBox ID="TBEmpName" runat="server" Style="background-color: #FFFFE0" Width="90px" Enabled="False"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:DropDownList ID="DDLStaffName" Style="background-color: #FFFFE0"
                                                                        runat="server" Width="90px" Enabled="false">
                                                                    </asp:DropDownList></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100" align="right">事由(名稱)</td>
                                                                <td width="500" colspan="5" nowrap>
                                                                    <asp:TextBox ID="TBAcmSubMemo" runat="server" Width="472px" Style="background-color: #ffffe0" Rows="2" TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnSubPhrase" runat="server" style="height: 22px; width: 18px" value="..." onclick="fnCallPhraseDialog('TBAcmSubMemo');" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100" align="right">控帳事由</td>
                                                                <td width="500" colspan="5" nowrap>
                                                                    <asp:TextBox ID="TBAcmMemo" runat="server" Width="472px" Rows="2" TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnPhrase" runat="server" style="height: 22px; width: 18px" value="..." onclick="fnCallPhraseDialog('TBAcmMemo');" /></td>
                                                            </tr>
                                                            <tr id="TRTmpPayData" style="display: none">
                                                                <td width="100" align="right" style="display: none">支付日期</td>
                                                                <td width="100" style="display: none">
                                                                    <asp:TextBox ID="TBAcpPrePayDate" runat="server" Width="90px" ondblclick="JavaScript: UCPrePayDate.Show();"></asp:TextBox></td>
                                                                <td width="100" align="right" style="display: none">支付時間</td>
                                                                <td width="100" style="display: none">
                                                                    <asp:TextBox ID="TBAcpPayHour" runat="server" Width="50px"
                                                                        onkeypress="return check_Num()"></asp:TextBox>(小時)</td>
                                                                <td width="100" align="right">轉正日期</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="TBAcpReturnDate" runat="server" Width="90px" ondblclick="JavaScript: UCReturnDate.Show();"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td width="100" align="right">需要日期</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="TBAcmRequireDate" runat="server" Style="background-color: #FFFFE0" Width="90px" Enabled="False" ondblclick="JavaScript: UCRequireDate.Show();"></asp:TextBox></td>
                                                                <td width="100" align="right">&nbsp;</td>
                                                                <td width="100">&nbsp;</td>
                                                                <td align="right">
                                                                    <asp:Label ID="Label1" runat="server" Text="原留單號" ToolTip="請輸入當初保留金額的動支編號" Visible="false"></asp:Label></td>
                                                                <td>
                                                                    <asp:TextBox ID="TBAcmReserveWordNum" runat="server" Width="90px" Visible="false"></asp:TextBox></td>
                                                            </tr>
                                                            <%--20151008 [add]:新增承辦人分機--%>
                                                            <tr>
                                                                <td width="100" align="right">承辦人分機</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="txtacmExt" runat="server" Width="60px"></asp:TextBox></td>
                                                                <%--20151027 [add]:新增加會資訊小組--%>
                                                                <%--20160805 移除加會資訊小組之功能--%>
                                                                <td width="100" align="right">&nbsp<div style="display:none;">加會資訊小組</div></td>
                                                                <td width="100">
                                                                    <div style="display:none;">
                                                                        <asp:CheckBox
                                                                            ID="CBAcmAddInMisFlag" runat="server" TextAlign="Left"
                                                                            Text="" />
                                                                    </div>
                                                                </td>
                                                                <%--20151118 [add]:新增正式人員選單--%>
                                                                <td width="100" align="right">正式人員</td>
                                                                 <td>
                                                                 <asp:DropDownList ID="DDLBPMAccount" Style="background-color: #FFFFE0"
                                                                        runat="server" Width="90px" Enabled="false">
                                                                 </asp:DropDownList></td>

                                                            </tr>
                                                            <%--20151008 [Add]:附加檔案功能--%>
                                                            <tr>
                                                                <td width="100px" align="right">附 件
                                                                </td>
                                                                <td width="500px" colspan="5" nowrap>
                                                                    <TM:FileUploadManagerX ID="FileUploadManagerX1" runat="server" EnableFileManage="True" EnableRemoveConfirm="true"
                                                                        EnableRemoveConfirmWithFileName="true" Filter="*.*" FilterDescript="All Files (*.*)" MaxLengthLimit="4096000"
                                                                        MaxQueueLimit="5" MaxUploadLimit="1" RemoveConfirmText="是否確定刪除檔案?" Visible="False" />
                                                                    <TM:FileUploadedList ID="FileUploadedList1" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100" align="right"></td>
                                                                <td width="500" colspan="5" nowrap>
                                                                    <asp:Label ID="LBShowAllAcmWord" runat="server"></asp:Label></td>

                                                            </tr>
                                                            <%--20151015 [add]:儲存目前表單名稱--%>
                                                            <tr style="display: none">
                                                                <td width="100" align="right"></td>
                                                                <td width="500" colspan="5" nowrap>
                                                                    <asp:Label ID="LBNowFormName" runat="server"></asp:Label></td>
                                                            </tr>
                                                             <%--20151118 [add]:儲存目前正式人員代碼--%>
                                                            <tr style="display: none">
                                                                <td width="100" align="right"></td>
                                                                <td width="500" colspan="5" nowrap>
                                                                    <asp:Label ID="LBNowBPMAccount" runat="server"></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- ↓區塊(3) -->
                                            <%--20151023 [add]:增加 動支項目 區塊 --%>
                                            <span id="TRTmpActData">
                                                <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                                            </span>
                                            <!-- 區塊(3)↑ -->
                                            <%--20150825 [add]:增加 請購內容 區塊 --%>
                                            <!-- ↓區塊(2) -->
                                            <span id="TRTmpProdData">
                                                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                            </span>
                                            <!-- 區塊(2)↑ -->
                                            <!-- ↓區塊(4) -->
                                            <!-- 區塊(4)↑ -->
                                            <!-- ↓區塊(5) -->
                                            <!-- 區塊(5)↑ -->
                                            <!-- ↓區塊(6) -->
                                            <!-- 區塊(6)↑ -->
                                            <!-- ↓區塊(6) -->
                                            <!-- 區塊(6)↑ -->

                                            <!-- Insert 區塊 here -->
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <!-- ↓歷史資料 -->
                    <table cellpadding="0" style="border-collapse: collapse; margin-top: 5" border="1" bordercolor="#666668" bgcolor="#DADEE9">
                        <tr>
                            <td>
                                <table cellpadding="5" style="border-collapse: collapse" border="1" bordercolor="#FFFFFF">
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <%--20151029 [mdf]:增加簽核作業隱藏期標--%>
                                                    <td style="<%=strHideFlowUIFlag %>">
                                                        <asp:Button ID="BtnAdd" runat="server" Text="新增" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnEdit" runat="server" Text="修改" Width="50px" Height="22px"></asp:Button></td>
                                                    <%--20151028 [mdf]:簽證作業(簽核),隱藏刪除按鈕--%>
                                                    <%--20151029 [mdf]:增加簽核作業隱藏期標--%>
                                                    <%--<td>
                                                        <asp:Button ID="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:Button></td>--%>
                                                    <td style="<%=strHideFlowUIFlag %>">
                                                        <asp:Button ID="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:Button></td>
                                                    <%--20151118 [mdf]:增加簽核送出按鈕--%>
                                                    <td>
                                                        <asp:Button ID="BtnSend" runat="server" Text="送出" Width="50px" Height="22px" Visible="false"></asp:Button></td>
                                                    <%--20151029 [mdf]:增加簽核作業隱藏期標--%>
                                                    <td style="<%=strHideFlowUIFlag %>">
                                                        <asp:Button ID="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"></asp:Button></td>
                                                    <%--20150825 [mdf]:修改 顯示 列印按鈕 --%>
                                                    <%--<td><input type="button" id="BtnPrint1" runat="server" 
                                            style="width: 50px; height: 22px" value="列印" onclick="fnCallReportMenu();" 
                                            visible="False" /></td>--%>
                                                    <td>
                                                        <input type="button" id="BtnPrint1" runat="server"
                                                            style="width: 50px; height: 22px" value="列印" onclick="fnCallReportMenu();"
                                                            visible="True" /></td>
                                                    <td style="font-size: 10pt">
                                                        <asp:CheckBox ID="CBCopy" runat="server" Text="新增拷貝本筆"
                                                            Visible="False" /></td>
                                                    <%--20151029 [mdf]:增加簽核作業隱藏期標--%>
                                                    <td style="<%=strHideFlowUIFlag %>">
                                                        <asp:TextBox ID="TBSearchSql" runat="server" Style="text-align: center; width: 90px" onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" onblur="if(this.value==''){this.value='尋找動支編號';}" onfocus="this.select()" onclick="this.value=''" AutoPostBack="True">尋找動支編號</asp:TextBox><input type="button" style="height: 22px; width: 16px; font-family: Webdings; font-size: 8pt" value="s"></td>
                                                    <td>
                                                        <input type="hidden" id="TBFindSql" runat="server" name="TBFindSql" /></td>
                                                    <td>
                                                        <input type="hidden" id="TBOrderTxt" runat="server" name="TBOrderTxt" /><input type="hidden" id="TBModFlag" runat="server" name="TBModFlag" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <%--20151029 [mdf]:增加簽核作業隱藏期標--%>
                                        <td style="<%=strHideFlowUIFlag %>">
                                            <div id="_freezingDiv" class="DIV0_width">
                                                <asp:DataGrid ID="DataGrid1" runat="server" Width="100%"
                                                    AutoGenerateColumns="False" AllowSorting="True" PageSize="5"
                                                    AllowPaging="True">
                                                    <HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
                                                    <ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
                                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                                    <Columns>
                                                        <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Small"></ItemStyle>
                                                            <HeaderStyle Width="30px" />
                                                        </asp:ButtonColumn>
                                                        <asp:BoundColumn DataField="acmYear" HeaderText="年度">
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn Visible="False" DataField="acmNo" HeaderText="簽證系統號" SortExpression="acmNo">
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="acmMarkDate" HeaderText="請示日期" SortExpression="acmMarkDate">
                                                            <HeaderStyle Width="60px"></HeaderStyle>
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="動支編號" SortExpression="acmWordNum">
                                                            <HeaderStyle Width="80px"></HeaderStyle>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="DepName" HeaderText="承辦單位" SortExpression="DepName"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="acmWorkUserNo" HeaderText="承辦人員" SortExpression="acmWorkUserNo">
                                                            <HeaderStyle Width="60px"></HeaderStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="acmMoney" HeaderText="動支金額" DataFormatString="{0:#,#}" SortExpression="acmMoney">
                                                            <HeaderStyle Width="70px"></HeaderStyle>
                                                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="acmMemo" HeaderText="控帳事由" SortExpression="acmMemo"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="acmModifyUser" HeaderText="最後異動" SortExpression="acmModifyUser">
                                                            <HeaderStyle Width="60px"></HeaderStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn Visible="False" DataField="M1Counter" HeaderText="M1Counter-10">
                                                            <HeaderStyle Width="60px"></HeaderStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn Visible="False" DataField="M2Counter" HeaderText="M2Counter-11">
                                                            <HeaderStyle Width="60px"></HeaderStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn Visible="False" DataField="PCounter" HeaderText="PCounter-12">
                                                            <HeaderStyle Width="60px"></HeaderStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn Visible="False" DataField="acmBgtKind" HeaderText="結轉-13">
                                                            <HeaderStyle Width="60px"></HeaderStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn Visible="False" DataField="acmWordNum" HeaderText="動支編號-14">
                                                            <HeaderStyle Width="60px"></HeaderStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn Visible="False" DataField="P1Counter" HeaderText="P1Counter-15">
                                                            <HeaderStyle Width="60px"></HeaderStyle>
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
                                                </asp:DataGrid>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <%--20151029 [mdf]:增加簽核作業隱藏期標--%>
                                        <td style="<%=strHideFlowUIFlag %>">
                                            <table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
                                                <tr>
                                                    <td><font size="2">共 <asp:Label ID="LBRecordCnt" runat="server" style="text-align:center"></asp:Label> 筆資料</font></td>
                                                    <td align="right">
                                                        <table cellpadding="0" style="border-collapse: collapse" border="0">
                                                            <tr>
                                                                <td><font size="2">只列出｜</font></td>
                                                                <td>
                                                                    <asp:DropDownList ID="DDLSortMonth" runat="server" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">…</asp:ListItem>
                                                                        <asp:ListItem Value="1">&nbsp;&nbsp;1月</asp:ListItem>
                                                                        <asp:ListItem Value="2">&nbsp;&nbsp;2月</asp:ListItem>
                                                                        <asp:ListItem Value="3">&nbsp;&nbsp;3月</asp:ListItem>
                                                                        <asp:ListItem Value="4">&nbsp;&nbsp;4月</asp:ListItem>
                                                                        <asp:ListItem Value="5">&nbsp;&nbsp;5月</asp:ListItem>
                                                                        <asp:ListItem Value="6">&nbsp;&nbsp;6月</asp:ListItem>
                                                                        <asp:ListItem Value="7">&nbsp;&nbsp;7月</asp:ListItem>
                                                                        <asp:ListItem Value="8">&nbsp;&nbsp;8月</asp:ListItem>
                                                                        <asp:ListItem Value="9">&nbsp;&nbsp;9月</asp:ListItem>
                                                                        <asp:ListItem Value="10">10月</asp:ListItem>
                                                                        <asp:ListItem Value="11">11月</asp:ListItem>
                                                                        <asp:ListItem Value="12">12月</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DDLSortDep" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                                                                <td>
                                                                    <asp:DropDownList ID="DDLSortPassFlag" runat="server" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">未審核</asp:ListItem>
                                                                        <asp:ListItem Value="1">已審核</asp:ListItem>
                                                                        <asp:ListItem Value="">不區分</asp:ListItem>
                                                                    </asp:DropDownList></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <!--歷史資料↑ -->
                    <!-- 左框架END -->
                </td>
                <td width="5"></td>
                <td valign="top" width="200">
                    <iframe id="iFrame" name="iFrame" border="0" frameborder="0" scrolling="no" width="200" height="520"></iframe>
                </td>
            </tr>
        </table>

        <ComponentArt:Calendar ID="UCDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmMarkDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:Calendar>


        <ComponentArt:Calendar ID="UCNeedDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCNeedDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmNeedDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:Calendar>
        <ComponentArt:Calendar ID="UCPassDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCPassDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmPassDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:Calendar>
        <ComponentArt:Calendar ID="UCReturnDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCReturnDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpReturnDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:Calendar>
        <ComponentArt:Calendar ID="UCPrePayDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCPrePayDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpPrePayDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:Calendar>
        <ComponentArt:Calendar ID="UCRequireDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCRequireDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmRequireDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:Calendar>

        <script language="javascript" type="text/javascript">
            if (getObjByID("BtnSave").disabled) setShowBudget();
        </script>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
    window.cart_calendar_PostBackOnSameSelection = true; //COMPONENTART:CALENDAR
    //20151105 [add]:增加請購總金額自動帶回動支金額
    SetAcmMoney1();
</script>
