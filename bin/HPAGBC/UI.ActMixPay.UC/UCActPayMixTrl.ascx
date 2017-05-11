<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayMixTrl.ascx.vb" Inherits="UI.ActMixPay.UC.UCActPayMixTrl" %>

<script type="text/javascript">
<!--

    function fnCallTravelDialog(MenuID) {

        var w_width = screen.width * 0.9;                 // 設定開啟視窗的寬度
        var w_height = screen.height * 0.8;               // 設定開啟視窗的高度
        var x = (screen.width - w_width) / 2;             // 計算螢幕與開啟視窗的寬度
        var y = (screen.height - w_height) / 2 - 50;      // 計算螢幕與開啟視窗的高度
        var config = 'scrollbars=yes,width=' + w_width + ',height=' + w_height + ',top=' + y + ',left=' + x;  // 將新獲取的設定用字串方式先串起來

        //alert(MenuID);
        // 將設定值放入函數中
        window.open('../UI.TsbPayee.Web/Travel.aspx?MenuID=' + MenuID, 'TravelWindow', config);
    }

    //function fnCallPhraseDialog(thisName) {
    //    var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
    //    if (strReturnVal != "Cancel") {
    //        document.all(thisName).value = document.all(thisName).value + strReturnVal;
    //    }
    //}

    //function UCMDate_Change(calendar) {
    //    var vDay = new Date(calendar.GetSelectedDate());
    //    //document.getElementById("UCTravelData_TBBDate").value = (vDay.getFullYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
    //    var tmpYear;
    //    tmpYear = "0" + (vDay.getFullYear() - 1911);
    //    tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

    //    var tmpMonth = "0" + (vDay.getMonth() + 1);
    //    tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

    //    var tmpDay = "0" + vDay.getDate();
    //    tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

    //    for (var i = 0; i < document.forms[0].elements.length; i++) {
    //        var e = document.forms[0].elements[i];
    //        if (e.getAttribute("MyName") == "TBAcmMarkDate") {

    //            e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
    //            break;

    //        }
    //    }
    //    //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
    //}

    //function UCPassDate_Change(calendar) {
    //    var vDay = new Date(calendar.GetSelectedDate());
    //    //document.getElementById("UCTravelData_TBBDate").value = (vDay.getFullYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
    //    var tmpYear;
    //    tmpYear = "0" + (vDay.getFullYear() - 1911);
    //    tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

    //    var tmpMonth = "0" + (vDay.getMonth() + 1);
    //    tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

    //    var tmpDay = "0" + vDay.getDate();
    //    tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

    //    for (var i = 0; i < document.forms[0].elements.length; i++) {
    //        var e = document.forms[0].elements[i];
    //        if (e.getAttribute("MyName") == "TBAcmPassDate") {
    //            e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
    //            break;
    //        }
    //    }

    //}

    //function setEmpName(parObj) {
    //    document.all("TBEmpName").value = parObj.options[parObj.selectedIndex].innerText;
    //}
    //function UCReturnDate_Change(calendar) {
    //    var vDay = new Date(calendar.GetSelectedDate());
    //    var tmpYear;
    //    tmpYear = "0" + (vDay.getFullYear() - 1911);
    //    tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

    //    var tmpMonth = "0" + (vDay.getMonth() + 1);
    //    tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

    //    var tmpDay = "0" + vDay.getDate();
    //    tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

    //    for (var i = 0; i < document.forms[0].elements.length; i++) {
    //        var e = document.forms[0].elements[i];
    //        if (e.getAttribute("MyName") == "TBAcpReturnDate") {
    //            e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
    //            break;
    //        }
    //    }

    //}

    //function UCPrePayDate_Change(calendar) {
    //    var vDay = new Date(calendar.GetSelectedDate());
    //    var tmpYear;
    //    tmpYear = "0" + (vDay.getFullYear() - 1911);
    //    tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

    //    var tmpMonth = "0" + (vDay.getMonth() + 1);
    //    tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

    //    var tmpDay = "0" + vDay.getDate();
    //    tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

    //    for (var i = 0; i < document.forms[0].elements.length; i++) {
    //        var e = document.forms[0].elements[i];
    //        if (e.getAttribute("MyName") == "TBAcpPrePayDate") {
    //            e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
    //            break;
    //        }
    //    }

    //}


    //-->
</script>




<table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="600" border="1">
    <tr>
        <td>
            <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="595px">
                <tr>
                    <td style="width: 90px; text-align: right">核銷年度：
                    </td>
                    <td style="width: 105px">
                        <asp:TextBox ID="ctl_AcpPayYear" runat="server" Style="text-align: center" onfocus="this.blur();"
                            BackColor="Transparent" Width="100px" Enabled="True" DBFieldName="acpPayYear"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right">核銷次號：
                    </td>
                    <td style="width: 105px">
                        <asp:TextBox ID="ctl_AcpPayNoPrv" runat="server" Style="text-align: center" onfocus="this.blur();"
                            BackColor="Transparent" Width="100px" Enabled="True" DBFieldName="acpPayNoPrv"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right">核銷金額：
                    </td>
                    <td>
                        <asp:TextBox ID="ctl_AcpMoney" runat="server" Style="text-align: center" onfocus="this.blur();"
                            BackColor="Transparent" Width="100px" Enabled="True" DBFieldName="acpMoney" MyName="TBPayMoney"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 90px; text-align: right;">群組編號：
                    </td>
                    <td style="width: 105px;">
                        <asp:TextBox ID="ctl_AcpGroupNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpGroupNo") %>'
                            Width="100px" Enabled="True" DBFieldName="acpGroupNo"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right">核銷日期：
                    </td>
                    <td>
                        <asp:TextBox ID="ctl_AcpMarkDate" onfocus="this.select()" Style="text-align: center"
                            onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                            runat="server" Text='<%# MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.acpMarkDate")  &"" ) %>'
                            Width="100px" Enabled="True" DBFieldName="acpMarkDate"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right">核銷人員：
                    </td>
                    <td>
                        <asp:TextBox ID="ctl_AcpMarkUserNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpMarkUserNo") %>'
                            Width="100px" Enabled="True" DBFieldName="acpMarkUserNo"></asp:TextBox>
                    </td>
                </tr>
                <tr id="trTrl" runat="server">
                    <td style="width: 90px; text-align: right">廠商名稱：
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="TBAcpPayName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayName")%>'
                            Width="95%" Enabled="True" DBFieldName="acpPayName"></asp:TextBox>
                    </td>
                </tr>
                <tr style="display: none">
                    <td style="width: 90px; text-align: right; display: none">電支付號：
                    </td>
                    <td style="width: 105px; display: none">
                        <asp:TextBox ID="TBAcpEtcPayWordNum" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpEtcPayWordNum")%>'
                            Width="100px" Enabled="True" DBFieldName="acpEtcPayWordNum"></asp:TextBox>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 90px; text-align: right">核銷事由：
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="TBacpTrlAbsenceNo" runat="server" Style="display: none"></asp:TextBox>
                        <!---請假單號--->
                        <asp:TextBox ID="ctl_AcpSubMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpSubMemo") %>'
                            Width="473px" Enabled="True" DBFieldName="acpSubMemo" Rows="3" TextMode="MultiLine"></asp:TextBox>
                     <%--   <input id="BtnSubPhrase" runat="server" style="height: 22px; width: 18px" type="button" value="..." disabled="disabled" />--%>
                    </td>
                </tr>
                <tr>
                    <td style="width: 90px; text-align: right">控帳事由：
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="ctl_AcpMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpMemo") %>'
                            Width="473px" Enabled="True" DBFieldName="acpMemo" Rows="3" TextMode="MultiLine"></asp:TextBox>
                      <%--  <input type="button" id="BtnPhrase" runat="server" style="height: 22px; width: 18px" value="..." disabled="disabled" />--%>
                    </td>
                </tr>
                <tr id="TRTmpTrlData" style="<%= strShowTrlFlag %>">
                    <td style="width: 160px;" colspan="5">
                        <input id="BtnTravel" runat="server" disabled="disabled" style="height: 23px; width: 100px" type="button" value="選取差旅資料" />
                    </td>
                </tr>
                <tr style="display: none">
                    <td style="width: 90px; text-align: right">動支年度：
                    </td>
                    <td style="width: 105px">
                        <asp:TextBox ID="ctl_AcmYear" runat="server" Width="100px" Enabled="True" DBFieldName="acmYear"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right; display: none">系統號：
                    </td>
                    <td style="width: 105px">
                        <asp:TextBox ID="ctl_AcmNo" runat="server" Width="100px" Enabled="True" DBFieldName="acmNo"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right">在簽號：
                    </td>
                    <td>
                        <asp:TextBox ID="ctl_AcmNo1" runat="server" Width="100px" Enabled="True" DBFieldName="acmNo1"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
