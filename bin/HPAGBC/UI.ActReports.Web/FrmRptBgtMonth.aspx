<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmRptBgtMonth.aspx.vb" Inherits="UI.ActReports.Web.FrmRptBgtMonth" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet"/>

    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1-fix.min.js")%>" type="text/javascript"></script>

      <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/MyLibraryJs/MyLibraryJs.min.js")%>" type="text/javascript"></script>
       <%-- ↓↓其他 plugin↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.cookie/jquery.cookie.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.blockUI/jquery.blockUI.min.js")%>" type="text/javascript"></script>
    <%-- ↑↑其他 plugin↑↑ --%>
    <script language="javascript" type="text/javascript">

        $(function () {
            //2013.12.02：Add：查詢資料時，先出現資料處理中的訊息
            $("#BtnPrint").click(function () {
                MyLibraryJs.JqPluginExt.fnBlockUIForDownload($("[id$='hdfDownloadToken']"), "hdfDownloadToken", "資料產生中...");
            });


        });
        function UCBDate_Change(calendar) {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBBDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
        }
        function UCEDate_Change(calendar) {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBEDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
        }




	</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <table style=" table-layout:fixed; margin-top:10px;margin-left:10px; border-collapse:collapse" borderColor="#666668" cellPadding="5" width="800" bgColor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="BORDER-COLLAPSE: collapse; table-layout:fixed" borderColor="#ffffff" cellPadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table style="BORDER-COLLAPSE: collapse" width="100%" border="0" cellpadding="1" cellspacing="0" >
                                    <tr>
                                        <td style="width:90px; text-align:right">日期區間：</td>
                                        <td style="width:390px; text-align:left" colspan="4">
                                            <asp:textbox id="TBBDate" style="text-align:center" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px" Visible=false></asp:textbox>
                                            至
                                            <asp:textbox id="TBEDate" style="text-align:center" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
                                            <asp:label id="Label2" runat="server">(日期範例:095/09/28)</asp:label>
                                        </td>                                         
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right">預算年度：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLBgtYear" runat="server" Width="150px"></asp:dropdownlist></td>
                                        <td style="width:90px; text-align:right">帳別名稱：</td>
                                        <td><asp:dropdownlist id="DDLTeamName" runat="server" Width="150px"></asp:dropdownlist></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right">預算來源：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLBgtSource" runat="server" Width="150px"></asp:dropdownlist></td>
                                        <td style="width:90px; text-align:right">經資門別：</td>
                                        <td><asp:dropdownlist id="DDLAccKind" runat="server" Width="150px"></asp:dropdownlist></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right">經費單位：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLBgtDep" 
                                                runat="server" Width="150px" AutoPostBack="True"></asp:dropdownlist></td>
                                        <td style="width:90px; text-align:right">執行單位：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="150px"></asp:dropdownlist></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style="display:none">
                                        <td style="width:90px; text-align:right">承辦業務：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLBizName" runat="server" Width="150px"></asp:dropdownlist></td>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right">審核狀態：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLPassFlag" runat="server" Width="150px">
                                            <asp:ListItem Value="">......</asp:ListItem>
                                            <asp:ListItem Value="1">已審核</asp:ListItem>
                                            <asp:ListItem Value="0">未審核</asp:ListItem>
                                            </asp:dropdownlist></td>
                                        <td style="width:90px; text-align:right">保留狀態：</td>
                                        <td><asp:dropdownlist id="DDLBgtKindSet" runat="server" Width="150px">
                                            <asp:ListItem Value="">......</asp:ListItem>
                                            <asp:ListItem Value="0">本年度預算</asp:ListItem>
                                            <asp:ListItem Value="1">應付歲出款</asp:ListItem>
                                            <asp:ListItem Value="2">保留準備數</asp:ListItem>
                                            </asp:dropdownlist></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right; vertical-align:top">計畫名稱：</td>
                                        <td  style="vertical-align:top" colspan="3"><asp:dropdownlist id="DDLPlan" 
                                                runat="server" Width="395px" AutoPostBack="True"></asp:dropdownlist></td>                                        
                                        <td><asp:CheckBoxList ID="CBLPlanLevel" runat="server" RepeatColumns="2" 
                                                RepeatDirection="Horizontal" Visible="False"></asp:CheckBoxList></td>                                        
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right; vertical-align:top">用途別：</td>
                                        <td style="vertical-align:top" colspan="3"><asp:dropdownlist id="DDLOul" runat="server" Width="395px"></asp:dropdownlist></td>                                        
                                        <td><asp:CheckBoxList ID="CBLOulLevel" runat="server" RepeatColumns="2" 
                                                RepeatDirection="Horizontal" Visible="False"></asp:CheckBoxList></td>                                        
                                    </tr>

                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table  style="BORDER-COLLAPSE: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr>
                                        <td><input id="hdfDownloadToken" type="hidden" runat="server" />
                                            <asp:Button ID="BtnList" runat="server" Text="列出資料" />
                                            <asp:Button ID="BtnPrint" runat="server" Text="列印報表" />
                                            <asp:checkbox id="CBExcel" runat="server" Text="轉製成EXCEL" Checked="True"></asp:checkbox>
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>
        <table style="MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" border=0>
        <tr>
            <td>
                <asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
										    <asp:BoundColumn DataField="項目名稱" HeaderText="項目名稱"></asp:BoundColumn>
											<asp:BoundColumn   DataField="預算數" HeaderText="預算數" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn   DataField="凍結數" HeaderText="凍結數" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn   DataField="節約數" HeaderText="節約數" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn   DataField="刪減數" HeaderText="刪減數" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="一月" HeaderText="一月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
											<asp:BoundColumn DataField="二月" HeaderText="二月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
											<asp:BoundColumn DataField="三月" HeaderText="三月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="第一期小計" HeaderText="第一期小計" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="四月" HeaderText="四月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
											<asp:BoundColumn DataField="五月" HeaderText="五月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
											<asp:BoundColumn DataField="六月" HeaderText="六月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="第二期小計" HeaderText="第二期小計" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="七月" HeaderText="七月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
											<asp:BoundColumn DataField="八月" HeaderText="八月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
											<asp:BoundColumn DataField="九月" HeaderText="九月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="第三期小計" HeaderText="第三期小計" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>                                            
											<asp:BoundColumn DataField="十月" HeaderText="十月"  DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
											<asp:BoundColumn DataField="十一月" HeaderText="十一月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
											<asp:BoundColumn DataField="十二月" HeaderText="十二月" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="第四期小計" HeaderText="第四期小計" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                    </Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid>
                </td>
        </tr>
    </table>    
    		<componentart:calendar id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></componentart:calendar>
        <componentart:calendar id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></componentart:calendar>
         
    </div>
    </form>
</body>
</html>
