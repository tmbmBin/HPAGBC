<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActMain1.ascx.vb" Inherits="UI.ActProdApply.Web.UCActMain1" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%--20151022 [Add]:附加檔案功能--%>
<%@ Register Assembly="Sys.FileUploadManager" Namespace="Sys.FileUploadManager.ServerControl" TagPrefix="TM" %>

<script language="javascript">

    function UCM1Date_Change(calendar) {
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
            if (e.getAttribute("MyName") == "TBAcmMarkDate1") {

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
        //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
    }


    function UCRequireDate_Change(calendar) {
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
            if (e.getAttribute("MyName") == "TBAcmRequireDate") {

                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;

            }
        }
        //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
    }



    function UCReturnDate_Change(calendar) {
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
            if (e.getAttribute("MyName") == "TBAcpReturnDate") {

                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;

            }
        }
        //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
    }




    function UCPrePayDate_Change(calendar) {
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
            if (e.getAttribute("MyName") == "TBAcpPrePayDate") {

                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;

            }
        }
        //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
    }




    function setEmpName(parObj) {
        document.all("TBEmpName").value = parObj.options[parObj.selectedIndex].innerText;
    }

    //        function UCReturnDate_Change(calendar) {
    //            var vDay = new Date(calendar.GetSelectedDate());
    //            document.getElementById("TBAcpReturnDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
    //        }

    //        function UCPrePayDate_Change(calendar) {
    //            var vDay = new Date(calendar.GetSelectedDate());
    //            document.getElementById("TBAcpPrePayDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
    //        }

</script>
<table cellpadding="1" cellspacing="1" style="table-layout: fixed; width: 100%; border: 0;">
    <tr style="display: none">
        <td align="right" style="width: 100px">&nbsp;</td>
        <td style="width: 110px">&nbsp;</td>
        <td align="right" style="width: 100px"></td>
        <td style="width: 120px"></td>
        <td align="right" style="width: 85px"></td>
        <td></td>
    </tr>
    <tr style="display: none">
        <td align="right" colspan="4">
            <asp:Label ID="Label1" runat="server" Font-Size="X-Small" ForeColor="Red"
                Text="流程選擇錯誤將會導致無法核銷，請確認選擇正確的流程。=&gt;"></asp:Label>
        </td>
        <td align="right" style="width: 85px">
            <asp:Literal ID="ltCateGrpText" runat="server" Text="本局/分局" Visible="true"></asp:Literal>
        </td>
        <td>
            <asp:DropDownList ID="DDLAcmCateGrpFlag" runat="server" AutoPostBack="true"
                Width="120px" Visible="True">
                <asp:ListItem Text="不區分" Value=""></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 100px; text-align: right">&nbsp;</td>
        <td style="width: 110px">&nbsp;</td>
        <td style="width: 100px; text-align: right">
            <asp:Label ID="LBMoneyTitle" runat="server" Text="再簽金額" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None"></asp:Label></td>
        <td style="width: 120px" id="TDAcmMoney1">
            <asp:TextBox ID="TBAcmMoney1" runat="server" Width="110px" BackColor="Transparent" onfocus="this.blur();" Style="text-align: right" MyName="TBAcmMoney1"></asp:TextBox></td>
        <%--20151029 [add]:可編輯再簽金額--%>
        <td style="width: 120px; display: none" id="TDAcmMoney2">
            <asp:TextBox ID="TBAcmMoney2" runat="server" Width="110px" Style="text-align: right" MyName="TBAcmMoney2" Enabled="False"></asp:TextBox>
        </td>
        <td style="width: 100px; text-align: right">
            <asp:Label ID="LBCountTitle" runat="server" Text="再簽次數" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DDLAcmNo1" runat="server" Width="90px" AutoPostBack="True">
                <asp:ListItem Value="">未再簽</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 100px; text-align: right">
            <asp:Label ID="LBDateTitle" runat="server" Text="再簽日期" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None"></asp:Label></td>
        <td style="width: 110px">
            <asp:TextBox ID="TBAcmMarkDate1" MyName="TBAcmMarkDate1"
                Style="background-color: #ffffe0; text-align: center" runat="server"
                Width="100px" ondblclick="JavaScript: UCM1Date.Show();" Enabled="False"></asp:TextBox></td>
        <td style="width: 100px; text-align: right">執行單位</td>
        <td style="width: 120px">
            <asp:DropDownList ID="DDLWorkDep"
                Style="background-color: #ffffe0" runat="server" Width="120px"
                Enabled="False">
            </asp:DropDownList></td>
        <td style="width: 100px; text-align: right">承辦人員</td>
        <%--20151027 [mdf]:隱藏原承辦人員 textbox改用下拉式選單--%>
        <%--  <td><asp:TextBox ID="TBEmpName" runat="server" Width="120px" 
                style="BACKGROUND-COLOR: #ffffe0" Enabled="False" ></asp:TextBox></td>--%>
        <td style="display: none">
            <asp:TextBox ID="TBEmpName" runat="server" Width="120px"
                Style="background-color: #ffffe0" Enabled="False"></asp:TextBox></td>
        <td>
            <asp:DropDownList ID="DDLStaffName" Style="background-color: #FFFFE0"
                runat="server" Width="90px" Enabled="false">
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td style="width: 100px; text-align: right">廠商名稱</td>
        <td colspan="5" style="width: 300px">
            <asp:TextBox ID="TBPayName" runat="server"
                Width="505px" Enabled="False" MaxLength="100"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 100px; text-align: right">事由(名稱)</td>
        <td colspan="5">
            <asp:TextBox ID="TBAcmSubMemo" Style="background-color: #ffffe0" runat="server"
                Width="480px" Enabled="False" MyName="TBAcmSubMemo" Rows="2" TextMode="MultiLine"></asp:TextBox>
            <input id="BtnSubPhrase" runat="server" type="button" value="..." disabled="disabled" />
        </td>
    </tr>
    <tr>
        <td style="width: 100px; text-align: right">控帳事由</td>
        <td colspan="5">
            <asp:TextBox ID="TBAcmMemo" runat="server" Width="480px" Enabled="False"
                MyName="TBAcmMemo" Rows="2" TextMode="MultiLine"></asp:TextBox>
            <input id="BtnPhrase" runat="server" type="button" value="..." disabled="disabled" />
        </td>
    </tr>
    <tr id="TRTmpPayData">
        <td style="width: 100px; text-align: right; display: none">支付日期</td>
        <td style="width: 100px; text-align: right; display: none">
            <asp:TextBox ID="TBAcpPrePayDate" runat="server" Width="90px"
                ondblclick="JavaScript: UCPrePayDate.Show();" Enabled="False"></asp:TextBox></td>
        <td style="width: 100px; text-align: right; display: none;">支付時間</td>
        <td style="width: 100px; text-align: right; display: none">
            <asp:TextBox ID="TBAcpPayHour" runat="server" Width="50px"
                onkeypress="return check_Num()" Enabled="False"></asp:TextBox>(小時)
        </td>
        <td style="width: 100px; text-align: right;">轉正日期</td>
        <td width="100">
            <asp:TextBox ID="TBAcpReturnDate" MyName="TBAcpReturnDate" runat="server" Width="90px"
                ondblclick="JavaScript: UCReturnDate.Show();" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr style="<%= strShowRequreDateFlag %>">
        <td style="text-align: right">需求日期</td>
        <td>
            <asp:TextBox ID="TBAcmRequireDate" MyName="TBAcmRequireDate" runat="server" Style="background-color: #FFFFE0" Width="90px" Enabled="False" ondblclick="JavaScript: UCRequireDate.Show();"></asp:TextBox></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr style="display: none">
        <td style="width: 100px; text-align: right; color: #FF0000; border-top: #ffffff 1pt solid;">審核日期</td>
        <td style="width: 110px; border-top: #ffffff 1pt solid;">
            <asp:TextBox ID="TBAcmPassDate" runat="server" Width="100px" Enabled="False" Style="background-color: #ffe0c0; text-align: center" MyName="TBAcmPassDate"></asp:TextBox></td>
        <td style="width: 100px; text-align: right; color: #FF0000; border-top: #ffffff 1pt solid; display: none">審核事由</td>
        <td style="width: 120px; border-top: #ffffff 1pt solid; display: none">
            <asp:TextBox ID="TBAcmPassMemo" Style="background-color: #ffe0c0" runat="server" Width="110px" Enabled="False"></asp:TextBox></td>
        <td style="width: 100px; text-align: right; color: #FF0000; border-top: #ffffff 1pt solid; display: none">審核金額</td>
        <td style="border-top: #ffffff 1pt solid; display: none">
            <asp:TextBox ID="TBAcmPassMoney" runat="server" Width="115px" Enabled="False" Style="background-color: #ffe0c0" MyName="TBAcmPassMoney"></asp:TextBox></td>
    </tr>
    <%--20151021 [add]:承辦人分機--%>
    <tr>
        <td style="width: 100px; text-align: right;">承辦人分機</td>
        <td style="width: 100px;">
            <asp:TextBox ID="txtacmExt" runat="server" Width="65px" Enabled="False"></asp:TextBox></td>
        <%--20151029 [add]:新增加會資訊小組--%>
        <%--20160805 移除加會資訊小組之功能--%>
        <td style="width: 100px; text-align: right;">&nbsp;<div style="display:none;">加會資訊小組</div></td>
        <td style="width: 100px;">
            <div style="display:none;">
                <asp:CheckBox ID="CBAcmAddInMisFlag" runat="server" TextAlign="Left" Text="" Enabled="False" />
            </div>
        </td>
		<%--20151119 [add]:新增正式人員選單--%>
        <td width="100" align="right">正式人員</td>
        <td>
            <asp:DropDownList ID="DDLBPMAccount" Style="background-color: #FFFFE0"
                runat="server" Width="90px" Enabled="false">
            </asp:DropDownList></td>
    </tr>
    <%--20151022 [Add]:附加檔案功能--%>
    <tr>
        <td style="width: 100px; text-align: right;">附　件
        </td>
        <td width="500px" colspan="5" nowrap>
            <TM:FileUploadManagerX ID="FileUploadManagerX1" runat="server" EnableFileManage="True" EnableRemoveConfirm="true"
                EnableRemoveConfirmWithFileName="true" Filter="*.*" FilterDescript="All Files (*.*)" MaxLengthLimit="4096000"
                MaxQueueLimit="5" MaxUploadLimit="1" RemoveConfirmText="是否確定刪除檔案?" Visible="False" />
            <TM:FileUploadedList ID="FileUploadedList1" runat="server" />
        </td>
    </tr>
    <%--20151015 [add]:儲存目前表單名稱--%>
    <tr style="display: none">
        <td style="width: 100px; text-align: right;"></td>
        <td width="500" colspan="5" nowrap>
            <asp:Label ID="UCLBNowFormName" runat="server"></asp:Label></td>
    </tr>
    <%--20151119 [add]:儲存目前正式人員代碼--%>
    <tr style="display: none">
        <td width="100" align="right"></td>
        <td width="500" colspan="5" nowrap>
            <asp:Label ID="LBNowBPMAccount" runat="server"></asp:Label></td>
    </tr>
</table>
<ComponentArt:Calendar ID="UCM1Date" runat="server" ClientSideOnSelectionChanged="UCM1Date_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:Calendar>
<ComponentArt:Calendar ID="UCPassDate" runat="server" ClientSideOnSelectionChanged="UCPassDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:Calendar>
<ComponentArt:Calendar ID="UCReturnDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCReturnDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpReturnDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:Calendar>
<ComponentArt:Calendar ID="UCPrePayDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCPrePayDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpPrePayDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:Calendar>
<ComponentArt:Calendar ID="UCRequireDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCRequireDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmRequireDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:Calendar>
