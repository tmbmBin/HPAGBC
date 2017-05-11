<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPrint.aspx.vb" Inherits="UI.CashRpt.Web.FrmPrint" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>未命名頁面</title>
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <script language="javascript">
        function UCBDate_Change(calendar) {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBBDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
        }
        function UCEDate_Change(calendar) {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBEDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;<table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse; width: 680px;" bordercolor="#666668" cellpadding="5" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table cellspacing="1" cellpadding="1" width="100%" border="0">
                                    <tr style="<%=ShowFlag(1)%>">
                                        <td align="right" width="90">日期區間</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px" ToolTip="滑鼠快點二下選擇日期"></asp:TextBox>至<asp:TextBox ID="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px" ToolTip="滑鼠快點二下選擇日期"></asp:TextBox>
                                            <asp:Label ID="Label2" runat="server">(日期範例:095/09/28)</asp:Label></td>
                                        <td></td>
                                    </tr>
                                    <tr style="<%=ShowFlag(2)%>">
                                        <td align="right" width="90">年度</td>
                                        <td width="160">
                                            <asp:DropDownList ID="DDLAcmYear" runat="server" Width="130px"></asp:DropDownList></td>
                                        <td align="right">帳別</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_Sort" runat="server" Width="130px">
                                            </asp:DropDownList>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr style="<%=ShowFlag(3)%>">
                                        <td align="right" width="90">經費單位</td>
                                        <td width="160">
                                            <asp:DropDownList ID="DDLBgtDep" runat="server" Width="130px" AutoPostBack="True"></asp:DropDownList></td>
                                        <td align="right">執行單位</td>
                                        <td align="left">
                                            <asp:DropDownList ID="DDLWorkDep" runat="server" Width="130px"></asp:DropDownList></td>
                                        <td></td>
                                    </tr>
                                    <tr style="<%=ShowFlag(4)%>">
                                        <td align="right" width="90">計畫科目</td>
                                        <td colspan="3" valign="top">
                                            <asp:DropDownList ID="DDLPlan" runat="server" AutoPostBack="True" Width="473px"></asp:DropDownList></td>
                                        <td></td>
                                    </tr>
                                    <tr style="<%=ShowFlag(5)%>">
                                        <td align="right" width="90">用途別科目</td>
                                        <td colspan="3" valign="top">
                                            <asp:DropDownList ID="DDLOul" runat="server"
                                                Width="473px">
                                            </asp:DropDownList></td>
                                        <td></td>
                                    </tr>
                                    <tr style="<%=ShowFlag(8)%>">
                                        <td align="right" width="90">廠商</td>
                                        <td>
                                            <asp:TextBox ID="txt_PayName" runat="server"></asp:TextBox></td>
                                        <td align="right">經手人</td>
                                        <td>
                                            <asp:TextBox ID="txt_acmWorkUserNo" runat="server" Width="130px"></asp:TextBox>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr style="<%=ShowFlag(9)%>">
                                        <td align="right" width="90">摘要</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txt_acpSubMemo" runat="server" Width="470px"></asp:TextBox></td>
                                        <td></td>
                                    </tr>
                                    <tr style="<%=ShowFlag(6)%>">
                                        <td align="right" width="90">清單批號</td>
                                        <td width="160">
                                            <asp:DropDownList ID="DDLBatNo" runat="server">
                                            </asp:DropDownList></td>
                                        <td align="right">
                                            <asp:Label ID="labAccNo" runat="server" Text="繳款帳戶"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="ddlAccNo" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr style="<%=ShowFlag(7)%>">
                                        <td align="right" width="90">報表種類</td>
                                        <td>
                                            <asp:DropDownList ID="DDLRptName" runat="server" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right">登記狀況</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_Status" runat="server" Width="130px">
                                            </asp:DropDownList>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr style="display: none">
                                        <td align="right" style="display: none">撥入狀況</td>
                                        <td align="left" style="display: none">
                                            <asp:DropDownList ID="DDLCashInStatus" runat="server" AutoPostBack="True"
                                                Width="130px">
                                                <asp:ListItem Value="0">未撥入</asp:ListItem>
                                                <asp:ListItem Value="1">已撥入</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellspacing="1" cellpadding="1" width="100%" border="0">
                                    <tr>
                                        <td align="right" width="90">
                                            <asp:Button ID="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px" Visible="false"></asp:Button></td>
                                        <td align="right">
                                            <asp:Button ID="BtnPrintList" runat="server" Width="120px"
                                                Text="差旅整批清單" Style="height: 21px"></asp:Button>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnEtcList" runat="server" Text="電支款項明細表" Visible="false" />
                                        </td>
                                        <td align="left">
                                            <asp:Button ID="BtnPrintTotal" runat="server" Text="零用金清單總表" Width="120px"
                                                Visible="False" />
                                        </td>
                                        <td>
                                            <asp:Button ID="btnPrintPayList" runat="server" Text="經費支出憑證清單" Width="120px" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CBDownLoad" runat="server" Text="轉製成EXCEL" Checked="True" Visible="True"></asp:CheckBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse; width: 900px;" cellpadding="5">
            <tr>
                <td style="width: 102px">
                    <asp:Button ID="btn_Show" runat="server" Text="預覽報表" /></td>
                <td>
                    <asp:Label ID="lab_Msg" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:DataGrid runat="server" ID="DataGrid1">
                        <HeaderStyle Height="30px" Font-Size="Small" Font-Bold="True" Wrap="False" VerticalAlign="Middle" HorizontalAlign="Center" BackColor="#ffcccc"></HeaderStyle>
                    </asp:DataGrid>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField DataField="月" HeaderText="月">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="日" HeaderText="日">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="憑證編號" HeaderText="憑證編號">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="科目" HeaderText="科目" />
                            <asp:BoundField DataField="受款人" HeaderText="受款人" />
                            <asp:BoundField DataField="摘要" HeaderText="摘要" />
                            <asp:BoundField DataField="支出" HeaderText="支出">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="收入" HeaderText="收入">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="餘額" HeaderText="餘額">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Literal ID="Literal1" runat="server">查無資料!</asp:Literal>
                        </EmptyDataTemplate>
                        <HeaderStyle Height="30px" Font-Size="Small" Font-Bold="True" Wrap="False" VerticalAlign="Middle" HorizontalAlign="Center" BackColor="#ffcccc"></HeaderStyle>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <ComponentArt:Calendar ID="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></ComponentArt:Calendar>
        <ComponentArt:Calendar ID="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></ComponentArt:Calendar>
    </form>
</body>
</html>
