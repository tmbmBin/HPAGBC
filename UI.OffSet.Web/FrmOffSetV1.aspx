﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmOffSetV1.aspx.vb" Inherits="UI.OffSet.Web.FrmOffSetV1" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<html>
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../ScriptFiles/jquery-1.9.1-fix.min.js"></script>
    <script language="javascript" src="../ScriptFiles/ShowBgtWeb/ShowPayBudget.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/SearchNum.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/setSeleGroup.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/TableSum.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/TableTools.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">

        function fnCallPhraseDialog(thisName) {
            var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

            if (strReturnVal != "Cancel") {
                document.all(thisName).value = document.all(thisName).value + strReturnVal;
                //Form1.TBMemo.value=Form1.TBMemo.value+strReturnVal;
            }
            //Form1.TBFindSql.value=strReturnVal;
        }
        function fnCallPayDtlDialog(parParams) {
            parParams += "&datastage=P1&SessID=" + document.getElementById("TBPayDtlData").value;
            var strReturnVal = showModalDialog("../AppCtrlCustom/FrmPayMethod.aspx?" + parParams, window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
            if (strReturnVal != "Cancel") {
                document.all("TBPayDtlData").value = strReturnVal;
                //document.all("TextBox1").value=  strReturnVal;
            }
        }

        function UCDate_Change(calendar) {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBAcpMarkDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
        }

        function UCPassDate_Change(calendar) {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBAcpPassDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
        }

        function fnCallSearchDialog() {
            var strReturnVal = showModalDialog("FrmSearchPay1.aspx?showtype=1&mod=" + "<%=strModFlag %>", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {
        //				Form1.TBFindSql.value=strReturnVal;
        document.all("TBFindSql").value = strReturnVal;
    }
    //Form1.TBFindSql.value=strReturnVal;
}


function fnCallReportMenu() {

    var strParams;
    strParams = document.all("TBPrintVal").value;  // "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("TBAcmWordNum").title + "&acmwordnum=" + document.all("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %> + "&acppayno="+ document.all("TBAcpPayNo").value + "&acmkidnum=<%=strDefKidNum  %>" + "&page1qty=6&page2qty=43" ;
	window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=P1" + "&page1qty=6&page2qty=43" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');


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

    </script>


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

    <script language="javascript">
<!--

    function show_item(item, sender) {
        var item_style = document.all[item].style;

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
        try { SetCookie(GetPageName() + ":FoldTitle_18", FoldTitle_18.style.display); } catch (e) {; }	//折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_21", FoldTitle_21.style.display); } catch (e) {; }	//折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_16", FoldTitle_16.style.display); } catch (e) {; }	//折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_41", FoldTitle_41.style.display); } catch (e) {; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_1B", FoldTitle_1B.style.display); } catch (e) {; } //折疊項目

        try { SetCookie(GetPageName() + ":div_UCActPayVisa1", div_UCActPayVisa1.className); } catch (e) {; }	//縮放表格
        try { SetCookie(GetPageName() + ":div_UCPayDtlProd", div_UCPayDtlProd.className); } catch (e) {; }	//縮放表格
        try { SetCookie(GetPageName() + ":div_UCPayName", div_UCPayName.className); } catch (e) {; } //縮放表格
        try { SetCookie(GetPageName() + ":div_UCActPayProd", div_UCActPayProd.className); } catch (e) {; } //縮放表格
    }

    function get_cookies() {
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_18"), "FoldTitle_18", "img_FoldTitle_18"); } catch (e) {; }	//折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_21"), "FoldTitle_21", "img_FoldTitle_21"); } catch (e) {; }	//折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_16"), "FoldTitle_16", "img_FoldTitle_16"); } catch (e) {; }	//折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_41"), "FoldTitle_41", "img_FoldTitle_41"); } catch (e) {; }	//折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_1B"), "FoldTitle_1B", "img_FoldTitle_1B"); } catch (e) {; } //折疊項目

        try { SetDiv(GetCookie(GetPageName() + ":div_UCActPayVisa1"), "div_UCActPayVisa1", "img18"); } catch (e) {; }	//縮放表格
        try { SetDiv(GetCookie(GetPageName() + ":div_UCPayDtlProd"), "div_UCPayDtlProd", "img21"); } catch (e) {; }	//縮放表格
        try { SetDiv(GetCookie(GetPageName() + ":div_UCPayName"), "div_UCPayName", "img16"); } catch (e) {; } //縮放表格
        try { SetDiv(GetCookie(GetPageName() + ":div_UCActPayProd"), "div_UCActPayProd", "img1B"); } catch (e) {; } //縮放表格



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

    //-->
    </script>

</head>

<body topmargin="5" leftmargin="10" rightmargin="0" bottommargin="50" onload='get_cookies()' onunload='set_cookies()'>
    <form id="form1" runat="server">
        <!-- ↓審核原因 -->
         <%--20151222 [mdf]:顯示核支日期--%>
<%--         <table id="TablePass" runat="server" style="margin-top: 0px; margin-left: 0px; border-collapse: collapse; display: none" cellpadding="5" width="600" bgcolor="#dadee9">--%>
        <table id="TablePass" runat="server" style="margin-top: 0px; margin-left: 0px; border-collapse: collapse" cellpadding="5" width="600" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668" valign="top" align="left">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668">
                                <table border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout: fixed">
                                    <tr>
                                        <td style="color: #FF0000; width: 75px;" align="right">
                                            <asp:Label ID="LBPassDate" runat="server" Text="核支日期"></asp:Label></td>
                                        <td style="width: 110px;">
                                            <asp:TextBox ID="TBAcpPassDate" runat="server" MyName="TBAcpPassDate" Style="text-align: center; background-color: #FFE0C0" Width="90px" ondblclick="JavaScript:UCPassDate.Show();"></asp:TextBox></td>
                                        <td style="color: #FF0000; width: 85px;" align="right"></td>
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
                <td style="height: 5px"></td>
            </tr>
        </table>
        <!-- 審核原因↑ -->

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
                                            <!-- ↓審核 -->
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
                                                <tr>
                                                    <td style="padding: 5px">

                                                        <table cellpadding="0" style="border-collapse: collapse; width: 600px" border="0">
                                                            <tr>
                                                                <td>
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBAllowanceFalg"
                                                                                    runat="server" Font-Size="X-Small" TextAlign="Right" Text="零用金支付"
                                                                                    Enabled="False" Visible="False" /></td>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBSeparateFlag"
                                                                                    runat="server" Font-Size="X-Small" TextAlign="Right" Text="分期付款"
                                                                                    Enabled="False" Visible="False" /></td>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBDocFlag" runat="server"
                                                                                    Font-Size="X-Small" TextAlign="Right" Text="簽文" Enabled="False"
                                                                                    Visible="False" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right">
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBAcpUnitPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="單位審核"/>
                                                                            </td>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBSecrearyFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="秘書室審核" Enabled="False" Visible="False" /></td>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBAccPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="會計室審核" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- 審核↑ -->
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%;" border="1" bordercolor="#FFFFFF">
                                                <tr>
                                                    <td style="padding: 0px">
                                                        <table cellpadding="2" cellspacing="0" style="table-layout: fixed" border="0">
                                                            <tr>
                                                                <td width="100" align="right">動支編號</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="TBAcmWordNum" runat="server" Style="text-align: center" BackColor="Transparent" Width="90px" onfocus="this.blur();"></asp:TextBox></td>
                                                                <td width="100" align="right">預付日期</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="TBAcmMarkDate" runat="server" Style="text-align: center" BackColor="Transparent" Width="90px" onfocus="this.blur();"></asp:TextBox></td>
                                                                <td width="100" align="right">預付金額</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="TBAcmMoney" runat="server" MyName="TBAcmMoney" Style="text-align: right" BackColor="Transparent" Width="90px" onfocus="this.blur();"></asp:TextBox></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>

                                            <!-- ↓區塊(1) -->
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
                                                <tr>
                                                    <td style="padding: 0px">
                                                        <table cellpadding="2" cellspacing="0" style="table-layout: fixed" border="0">
                                                            <tr>
                                                                <td width="100" align="right">轉正日期</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="TBAcpMarkDate" runat="server" Style="text-align: center; background-color: #FFFFE0" Width="90px" ondblclick="JavaScript: UCDate.Show();" Enabled="False"></asp:TextBox></td>
                                                                <td width="100" align="right">轉正金額</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="TBAcpMoney" runat="server" MyName="TBPayMoney" Style="text-align: right" BackColor="Transparent" Width="90px" onfocus="this.blur();" onkeypress="return check_Num()"></asp:TextBox></td>
                                                                <td width="100" align="right">轉正次數</td>
                                                                <td width="100">
                                                                    <asp:DropDownList ID="DDLAcpPayNo1" runat="server" Width="90px" AutoPostBack="True"></asp:DropDownList></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100" align="right">群組編號</td>
                                                                <td width="100">
                                                                    <asp:TextBox ID="TBAcpGroupNo" runat="server" MaxLength="10" Width="90px" Enabled="False"></asp:TextBox></td>
                                                                <td width="100" align="right">&nbsp;</td>
                                                                <td width="100">&nbsp;</td>
                                                                <td width="100" align="right">&nbsp;</td>
                                                                <td width="100">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">核銷事由</td>
                                                                <td width="500" colspan="5" nowrap>
                                                                    <asp:TextBox ID="TBAcpSubMemo"
                                                                        MyName="TBAcpSubMemo" runat="server" Style="background-color: #ffffe0"
                                                                        Width="472px" Rows="2" Enabled="False" TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnSubPhrase" runat="server" style="height: 22px; width: 18px" value="..." onclick="fnCallPhraseFun('TBAcpSubMemo');" disabled="disabled" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">控帳事由</td>
                                                                <td width="500" colspan="5" nowrap>
                                                                    <asp:TextBox ID="TBAcpMemo" MyName="TBAcpMemo" runat="server" Width="472px" Rows="2" Enabled="False" TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnPhrase" runat="server" style="height: 22px; width: 18px" value="..." onclick="fnCallPhraseFun('TBAcpMemo');" disabled="disabled" /></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- 區塊(1)↑ -->
                                            <!-- ↓區塊(2) -->
                                            <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                                            <!-- 區塊(2)↑ -->
                                            <!-- ↓區塊(3) -->
                                            <!-- 區塊(3)↑ -->
                                            <!-- ↓區塊(4) -->
                                            <!-- 區塊(4)↑ -->
                                            <!-- ↓區塊(5) -->
                                            <!-- 區塊(5)↑ -->
                                            <!-- Insert 區塊 here -->
                                            <span id="TRTmpProdData" style="display: none">
                                                <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
                                            </span>
                                            <span id="TRTmpProdData1" style="display: none">
                                                <asp:PlaceHolder ID="PlaceHolder7" runat="server"></asp:PlaceHolder>
                                            </span>
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
                                                <tr style="display: none">
                                                    <td style="padding: 0px">
                                                        <table cellpadding="2" cellspacing="0" style="table-layout: fixed" border="0">
                                                            <tr>
                                                                <td>
                                                                    <input id="BtnPayDtlData" runat="server" type="button" value="黏存單付款說明" />
                                                                    <input runat="server" id="TBPayDtlData" type="hidden" />
                                                                    <asp:Label ID="Label1" runat="server" Text="←本功能請編輯存檔主資料後，才能繼續編輯黏存單付款說明。"
                                                                        Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                                                </td>
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
                    <!-- ↓歷史資料 -->
                    <table cellpadding="0" style="border-collapse: collapse; margin-top: 5" border="1" bordercolor="#666668" bgcolor="#DADEE9">
                        <tr>
                            <td>
                                <table cellpadding="5" style="border-collapse: collapse" border="1" bordercolor="#FFFFFF">
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="BtnAdd" runat="server" Text="新增" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnEdit" runat="server" Text="修改" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <input type="button" id="BtnPrint" runat="server"
                                                            style="width: 50px; height: 22px" value="列印" onclick="fnCallReportMenu();"
                                                            visible="True" /></td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:TextBox ID="TBSearchSql" runat="server" Style="text-align: center; width: 90px" onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" onblur="if(this.value==''){this.value='尋找動支編號';}" onfocus="this.select()" onclick="this.value=''" AutoPostBack="True">尋找動支編號</asp:TextBox><input type="button" style="height: 22px; width: 16px; font-family: Webdings; font-size: 8pt" value="s"></td>
                                                    <td>
                                                        <input type="hidden" id="TBFindSql" runat="server" name="TBFindSql" /></td>
                                                    <td>
                                                        <input type="hidden" id="TBOrderTxt" runat="server" name="TBOrderTxt" /><input type="hidden" id="TBModFlag" runat="server" name="TBModFlag" /></td>
                                                    <td>
                                                        <input type="hidden" id="TBPrintVal" runat="server" name="TBPrintVal" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="_freezingDiv" class="DIV0_width">
                                                <asp:DataGrid ID="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="5">
                                                    <HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
                                                    <ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
                                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                                    <Columns>
                                                        <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
                                                            <HeaderStyle Width="30px" Font-Size="X-Small" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                        </asp:ButtonColumn>
                                                        <asp:BoundColumn DataField="acmYear" HeaderText="年度">
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="請示日期">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="LBdgAcmMarkDate" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmMarkDate").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="動支編號">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="LBdgAcmWordNum" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="承辦單位">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="LBdgAcmWorkUnitNo" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.WorkDepName").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWorkUnitNo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="承辦人員">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="LBdgAcmWorkUserNo" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWorkUserNo").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmEmpNo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="暫付金額">
                                                            <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="LBdgAcmMoney" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpMoney", "{0:#,#}").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="控帳事由">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="LBdgAcmMemo" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmMemo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="最後異動">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="LBdgAcpModifyUser" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpModifyUser").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="再簽次號" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="LBdgAcmNo1" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo1").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="報支次號">
                                                            <HeaderStyle Width="30px" Font-Size="X-Small" />
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="LBdgAcpPayNo" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpPayNo").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpPayYear").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
                                                </asp:DataGrid>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
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
        <ComponentArt:Calendar ID="UCDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCDate_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpMarkDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar>
        <ComponentArt:Calendar ID="UCPassDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCPassDate_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpPassDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar>

        <script language="javascript" type="text/javascript"> setShowBudget();</script>
    </form>
</body>
</html>
