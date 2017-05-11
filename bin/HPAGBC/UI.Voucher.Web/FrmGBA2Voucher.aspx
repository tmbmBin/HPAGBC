<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmGBA2Voucher.aspx.vb" Inherits="UI.Voucher.Web.FrmGBA2Voucher" %>

<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <style type="text/css">
        .Freezing {
            Z-INDEX: 10;
            POSITION: relative;
            TOP: expression(this.offsetParent.scrollTop+0);
            HEIGHT: 24px;
        }

        .FreezingCol0 {
            BORDER-RIGHT: 0px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }

        .FreezingCol1 {
            BORDER-RIGHT: 1px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }

        .FreezingCol2 {
            BORDER-RIGHT: 1px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }
    </style>
    <script type="text/javascript" src="../ScriptFiles/setAllCtrl.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3.min.js"></script>
    <%-- ↓↓ datepicker(民國) 所需檔案(Web.config也要設定)↓↓ --%>
    <script src="../jQuery/jquery.ui.datepicker.js" type="text/javascript"></script>
    <script src="../jQuery/jquery.ui.datepicker.zh-TW.init.chinese.js" type="text/javascript"></script>
    <script src="../TM.Style/TM.ServerControl.js" type="text/javascript"></script>
    <link href="../CSSFiles/layout.ui.datepicker.css" rel="stylesheet" type="text/css" />
    <link href="../TM.Style/TM.ServerControl.css" rel="stylesheet" type="text/css" />
    <%-- ↑↑ datepicker(民國) 所需檔案↑↑ --%>
    <script type="text/javascript">
		 
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" cellpadding="5"
            width="1500" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%"
                        border="1">
                        <tr>
                            <td>
                                <table cellpadding="1" border="0">
                                    <tr>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnSave" runat="server" Height="22" Text="傳票號碼登錄存檔"></asp:Button></td>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center">
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red">請存檔後再換頁。</asp:Label></td>
                                        <td valign="bottom" align="center">報支總和：</td>
                                        <td valign="bottom" align="center">
                                            <asp:Label ID="LBPayTotal" runat="server" Width="120px"></asp:Label></td>
                                        <td valign="bottom" align="center">轉正總和：</td>
                                        <td valign="bottom" align="center">
                                            <asp:Label ID="LBOffsetTotal" runat="server" Width="120px"></asp:Label></td>
                                        <td valign="bottom" align="center">繳回總和：</td>
                                        <td valign="bottom" align="center">
                                            <asp:Label ID="LBPayBackTotal" runat="server" Width="120px"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataGrid ID="DataGrid1" runat="server" Width="1500px" CellSpacing="1" BorderStyle="None" BackColor="White"
                                    CellPadding="3" GridLines="None" AutoGenerateColumns="False" AllowPaging="True">
                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                    <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                                    <HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
                                    <Columns>
                                        <asp:TemplateColumn Visible="False" HeaderText="選取">
                                            <HeaderStyle Wrap="False" Width="20px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="CBSelectAll1" onclick="AllCheck('DataGrid1_,,CBdgSelect',this.checked);" runat="server"
                                                    ToolTip="打勾全選"></asp:CheckBox>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CBdgSelect" runat="server"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="acpPassDate" SortExpression="acpPassDate" HeaderText="報支日期">
                                            <HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
                                            <ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="年度" SortExpression="acmYear">
                                            <ItemTemplate>
                                                <asp:Label ID="labacmYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmYear") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="動支編號">
                                            <HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
                                            <ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="PlanName" SortExpression="PlanName" HeaderText="計畫名稱">
                                            <HeaderStyle Wrap="False" Width="120px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="OulName" SortExpression="OulName" HeaderText="用途別名稱">
                                            <HeaderStyle Wrap="False" Width="120px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="WorkDepName" SortExpression="WorkDepName" HeaderText="執行單位">
                                            <HeaderStyle Wrap="False" Width="90px"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
                                            <HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="報支金額" SortExpression="報支金額" HeaderText="報支金額" DataFormatString="{0:#,0}">
                                            <HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
                                            <ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="轉正金額" SortExpression="轉正金額" HeaderText="轉正金額" DataFormatString="{0:#,0}">
                                            <HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
                                            <ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvMemo" SortExpression="acvMemo" HeaderText="事由">
                                            <HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
                                            <ItemStyle Width="100px" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="繳回款" SortExpression="繳回款" HeaderText="繳回款" DataFormatString="{0:#,0}">
                                            <HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acpGroupNo" SortExpression="acpGroupNo" HeaderText="匯出批號">
                                            <HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="傳票號碼">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TBdgAccNo" runat="server" Width="70px" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo") %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvWExchNo").ToString()) %>'>
                                                </asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="傳票日期">
                                            <ItemTemplate>
                                                <%--20160218 [mdf]:GBA 2.0 改取 acvWExchMakeDate--%>
                                                <%-- <TM:DatePickerTextBox ID="txtacvExchMakeDate" runat="server" datepicker="datepicker" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.acvExchMakeDate") %>'></TM:DatePickerTextBox>
                                                    <asp:Label ID="labacvExchMakeDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvExchMakeDate","{0:yyyy/MM/dd}") %>' Visible="false"></asp:Label>--%>
                                                <TM:DatePickerTextBox ID="txtacvExchMakeDate" runat="server" datepicker="datepicker" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchMakeDate") %>'></TM:DatePickerTextBox>
                                                <asp:Label ID="labacvExchMakeDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchMakeDate", "{0:yyyy/MM/dd}") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="190px" />
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="過帳日期">
                                            <ItemTemplate>
                                                <%--20160218 [mdf]:GBA 2.0 改取 acvWExchPassDate--%>
                                                <%--  <TM:DatePickerTextBox ID="txtacvExchPassDate" runat="server" datepicker="datepicker" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.acvExchPassDate") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.acvExchPassDate") %>'></TM:DatePickerTextBox>
                                                    <asp:Label ID="labacvExchPassDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvExchPassDate","{0:yyyy/MM/dd}") %>' Visible="false"></asp:Label>--%>
                                                <TM:DatePickerTextBox ID="txtacvExchPassDate" runat="server" datepicker="datepicker" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchPassDate") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvWExchPassDate") %>'></TM:DatePickerTextBox>
                                                <asp:Label ID="labacvExchPassDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchPassDate", "{0:yyyy/MM/dd}") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="190px" />
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="報支<br />-轉正號">
                                            <ItemTemplate>
                                                <asp:Label ID="labacmNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="labacmNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmNo1") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="labacmNo2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmNo2") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="labacvNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvNo") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="labacvNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvNo1") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="labacvNo2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvNo2") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="labacpPayYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayYear") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="labacpPayNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo") %>'></asp:Label>
                                                <asp:Label ID="labacvSubNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvSubNo") %>' Visible="false"></asp:Label>
                                                -<asp:Label ID="labacpPayNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo1") %>'></asp:Label>
                                                <asp:Label ID="labacvSubNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvSubNo1") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Center" />
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="繳回款<br />傳票號碼">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TBdgOffSetAccNo" runat="server" Width="70px" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo1") %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvWExchNo1").ToString()) %>'>
                                                </asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="繳回款<br />傳票日期">
                                            <ItemTemplate>
                                                <%--20160218 [mdf]:GBA 2.0 改取 acvWExchMakeDate1--%>
                                                <%-- <TM:DatePickerTextBox ID="txtacvExchMakeDate1" runat="server" datepicker="datepicker" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.acvExchMakeDate1") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.acvExchMakeDate1") %>'></TM:DatePickerTextBox>
                                                    <asp:Label ID="labacvExchMakeDate1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvExchMakeDate1","{0:yyyy/MM/dd}") %>' Visible="false"></asp:Label>--%>
                                                <TM:DatePickerTextBox ID="txtacvExchMakeDate1" runat="server" datepicker="datepicker" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchMakeDate1") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvWExchMakeDate1") %>'></TM:DatePickerTextBox>
                                                <asp:Label ID="labacvExchMakeDate1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchMakeDate1","{0:yyyy/MM/dd}") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="190px" />
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="繳回款<br />過帳日期">
                                            <ItemTemplate>
                                                <%--20160218 [mdf]:GBA 2.0 改取 acvWExchPassDate1--%>
                                                <%--   <TM:DatePickerTextBox ID="txtacvExchPassDate1" runat="server" datepicker="datepicker" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.acvExchPassDate1") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.acvExchPassDate1") %>'></TM:DatePickerTextBox>
                                                    <asp:Label ID="labacvExchPassDate1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvExchPassDate1","{0:yyyy/MM/dd}") %>' Visible="false"></asp:Label>--%>
                                                <TM:DatePickerTextBox ID="txtacvExchPassDate1" runat="server" datepicker="datepicker" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchPassDate1") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvWExchPassDate1") %>'></TM:DatePickerTextBox>
                                                <asp:Label ID="labacvExchPassDate1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchPassDate1","{0:yyyy/MM/dd}") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="190px" />
                                        </asp:TemplateColumn>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
                                </asp:DataGrid></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
