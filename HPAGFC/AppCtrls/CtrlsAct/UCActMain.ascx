<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActMain.ascx.vb" Inherits="AppCtrls.UCActMain" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
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

    function fnCallPhraseDialog(thisName) {
        var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
        if (strReturnVal != "Cancel") {
            document.all(thisName).value = document.all(thisName).value + strReturnVal;
        }
    }

    function UCMDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        //document.getElementById("UCTravelData_TBBDate").value = (vDay.getFullYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
        var tmpYear;
        tmpYear = "0" + (vDay.getFullYear() - 1911);
        tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

        var tmpMonth = "0" + (vDay.getMonth() + 1);
        tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

        var tmpDay = "0" + vDay.getDate();
        tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];
            if (e.getAttribute("MyName") == "TBAcmMarkDate") {

                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;

            }
        }
        //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
    }

    function UCPassDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        //document.getElementById("UCTravelData_TBBDate").value = (vDay.getFullYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
        var tmpYear;
        tmpYear = "0" + (vDay.getFullYear() - 1911);
        tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

        var tmpMonth = "0" + (vDay.getMonth() + 1);
        tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

        var tmpDay = "0" + vDay.getDate();
        tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];
            if (e.getAttribute("MyName") == "TBAcmPassDate") {
                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;
            }
        }

    }

    function setEmpName(parObj) {
        document.all("TBEmpName").value = parObj.options[parObj.selectedIndex].innerText;
    }
    function UCReturnDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        var tmpYear;
        tmpYear = "0" + (vDay.getFullYear() - 1911);
        tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

        var tmpMonth = "0" + (vDay.getMonth() + 1);
        tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

        var tmpDay = "0" + vDay.getDate();
        tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];
            if (e.getAttribute("MyName") == "TBAcpReturnDate") {
                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;
            }
        }

    }

    function UCPrePayDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        var tmpYear;
        tmpYear = "0" + (vDay.getFullYear() - 1911);
        tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

        var tmpMonth = "0" + (vDay.getMonth() + 1);
        tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

        var tmpDay = "0" + vDay.getDate();
        tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];
            if (e.getAttribute("MyName") == "TBAcpPrePayDate") {
                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;
            }
        }

    }


    //-->
</script>

<table _ondblclick="alert('14:UCActMain.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
    <tr>
        <td style="padding: 0px">
            <table cellpadding="2" cellspacing="0" style="table-layout: fixed; width: 100%" border="0">
                <tr style="<%= strShowETCFlag %>">
                    <td style="width: 100px; text-align: right"></td>
                    <td width="100"></td>
                    <td width="100" align="right">電支付號</td>
                    <td width="100">
                        <asp:TextBox ID="TBAcpEtcPayWordNum" runat="server" MaxLength="20"
                            Width="90px" Enabled="False"></asp:TextBox></td>
                    <td width="100" align="right"></td>
                    <td width="100"></td>
                </tr>
                <tr>
                    <td style="width: 100px; text-align: right">動支編號</td>
                    <td style="width: 100px;">
                        <asp:TextBox ID="TBAcmWordNum" runat="server" Style="text-align: center" BackColor="Transparent" Width="90px" onfocus="this.blur();">09601234</asp:TextBox></td>
                    <td style="width: 100px; text-align: right">報支金額</td>
                    <td style="width: 100px;">
                        <asp:TextBox ID="TBAcmMoney" runat="server" MyName="TBAcmMoney" Style="text-align: right" BackColor="Transparent" Width="90px" onfocus="this.blur();" onpropertychange="checkVisaKind(this.value);"></asp:TextBox></td>
                    <td style="width: 100px; text-align: right" id="TDAddVisaData1">原簽單號</td>
                    <td style="width: 100px;" id="TDAddVisaData2">
                        <asp:TextBox ID="TBAcmTopWordNum" runat="server" Width="90px" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td width="100" align="right">請示日期</td>
                    <td width="100">
                        <asp:TextBox ID="TBAcmMarkDate" runat="server" MyName="TBAcmMarkDate" Style="text-align: center; background-color: #FFFFE0" Width="90px" ondblclick="JavaScript: UCMDate.Show();" Enabled="False"></asp:TextBox></td>
                    <td width="100" align="right">承辦單位</td>
                    <td width="100">
                        <asp:DropDownList ID="DDLWorkDep" runat="server" Style="background-color: #FFFFE0" Width="90px" Enabled="False" AutoPostBack="True"></asp:DropDownList></td>
                    <td width="100" align="right">承辦人員</td>
                    <td width="100">
                        <asp:TextBox ID="TBEmpName" runat="server" Style="background-color: #FFFFE0" Width="90px" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">群組編號</td>
                    <td>
                        <asp:TextBox ID="TBAcpGroupNo" runat="server" MaxLength="10" Width="90px" Enabled="False"></asp:TextBox></td>
                    <td align="right" style="<%= strShowETCFlag %>">&nbsp;</td>
                    <td style="<%= strShowETCFlag %>">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="TBAcmCateGrpFlag" runat="server" Width="90px" Visible="false"></asp:TextBox></td>
                </tr>
                <tr style="<%= strShowPayNameFlag %>">
                    <td width="100" align="right">廠商名稱</td>
                    <td width="500" colspan="5">
                        <asp:TextBox ID="TBPayName" runat="server" Width="490px" MaxLength="100" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="100" align="right">核銷事由</td>
                    <td width="500" colspan="5">
                        <asp:TextBox ID="TBacpTrlAbsenceNo" runat="server" Style="display: none"></asp:TextBox>
                        <!---請假單號--->
                        <asp:TextBox ID="TBAcmSubMemo" Style="background-color: #ffffe0" runat="server"
                            Width="470px" Enabled="False" MyName="TBAcmSubMemo" Rows="3"
                            TextMode="MultiLine"></asp:TextBox><input id="BtnSubPhrase" runat="server" style="height: 22px; width: 18px" type="button" value="..." disabled="disabled" /></td>
                </tr>
                <tr>
                    <td style="text-align: right;">控帳事由</td>
                    <td colspan="5">
                        <asp:TextBox ID="TBAcmMemo" runat="server" MyName="TBAcmMemo" Width="470px" MaxLength="250" Enabled="False" Rows="3" TextMode="MultiLine"></asp:TextBox>
                        <input type="button" id="BtnPhrase" runat="server" style="height: 22px; width: 18px" value="..." disabled="disabled" /></td>
                </tr>
                <tr style="display: none">
                    <td width="100" align="right">匯出批號</td>
                    <td width="100">
                        <asp:TextBox ID="TBGroupNo" runat="server" Width="90px" MaxLength="10" Enabled="False"></asp:TextBox></td>
                    <td width="100" align="right">附單據</td>
                    <td width="100">
                        <asp:TextBox ID="TBPayCnt" runat="server" Style="text-align: right" Width="90px" onkeypress="return check_Num()" Enabled="False"></asp:TextBox></td>
                    <td width="100" align="right"></td>
                    <td width="100">
                        <asp:TextBox ID="TBAcmNoPrv" runat="server" Width="90px"></asp:TextBox></td>
                </tr>
                <tr id="TRTmpPayData">
                    <td width="100" align="right" style="display: none">支付日期</td>
                    <td width="100" style="display: none">
                        <asp:TextBox ID="TBAcpPrePayDate" MyName="TBAcpPrePayDate" runat="server" Width="90px" ondblclick="JavaScript: UCPrePayDate.Show();" Enabled="False"></asp:TextBox></td>
                    <td width="100" align="right" style="display: none">支付時間</td>
                    <td width="100" style="display: none">
                        <asp:TextBox ID="TBAcpPayHour" MyName="TBAcpPayHour" runat="server" Width="50px" onkeypress="return check_Num()" Enabled="False"></asp:TextBox>(小時)</td>
                    <td width="100" align="right" style="<%= strShowETCFlag %>">轉正日期</td>
                    <td width="100" style="<%= strShowETCFlag %>">
                        <asp:TextBox ID="TBAcpReturnDate" MyName="TBAcpReturnDate" runat="server" Width="90px" ondblclick="JavaScript: UCReturnDate.Show();" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr id="TRTmpTrlData" style="<%= strShowTrlFlag %>">
                    <td style="width: 160px;" colspan="5">
                        <input id="BtnTravel" runat="server" disabled="disabled" style="height: 23px; width: 100px" type="button" value="選取差旅資料" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<ComponentArt:Calendar ID="UCMDate" runat="server" ClientSideOnSelectionChanged="UCMDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:Calendar>
<ComponentArt:Calendar ID="UCPassDate" runat="server" ClientSideOnSelectionChanged="UCPassDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:Calendar>
<ComponentArt:Calendar ID="UCReturnDate" runat="server" ClientSideOnSelectionChanged="UCReturnDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:Calendar>
<ComponentArt:Calendar ID="UCPrePayDate" runat="server" ClientSideOnSelectionChanged="UCPrePayDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:Calendar>
