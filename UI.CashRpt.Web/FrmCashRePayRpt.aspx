<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCashRePayRpt.aspx.vb" Inherits="UI.CashRpt.Web.FrmCashRePayRpt" %>
<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <title></title>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3.min.js"></script>
    <%-- ↓↓ datepicker(民國) 所需檔案(Web.config也要設定)↓↓ --%>
    <script src="../jQuery/jquery.ui.datepicker.js" type="text/javascript"></script>
    <script src="../jQuery/jquery.ui.datepicker.zh-TW.init.chinese.js" type="text/javascript"></script>
    <script src="../TM.Style/TM.ServerControl.js" type="text/javascript"></script>
    <link href="../CSSFiles/layout.ui.datepicker.css" rel="stylesheet" type="text/css" />
    <link href="../TM.Style/TM.ServerControl.css" rel="stylesheet" type="text/css" />
    <%-- ↑↑ datepicker(民國) 所需檔案↑↑ --%>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:713px; background-color:#FFFCEC; border-collapse: collapse; font-size:small; border:1px solid Gray">
    <tr>
    <td>
    <fieldset style="margin:10px 10px 10px 10px; border:1px solid Gray">
        <legend style="font-weight:bold">搜尋</legend>
        <table width="693">
            <tr>
                <td style="width:80px">借款人：</td>
                <td><asp:TextBox ID="txtcrpUserNo" runat="server" Width="85px"></asp:TextBox></td>
                <td style="text-align:right">借款備註：</td>
                <td><asp:TextBox ID="txtcrpMemo" runat="server"></asp:TextBox></td>                
            </tr>
            <tr>
                <td style="width:80px">借款日期：</td>
                <td>
                    <TM:DatePickerTextBox ID="txtcrpDateS" runat="server" datepicker="datepicker" Width="85px"></TM:DatePickerTextBox>～
                    <TM:DatePickerTextBox ID="txtcrpDateE" runat="server" datepicker="datepicker" Width="85px"></TM:DatePickerTextBox>
                </td>
                <td style="text-align:right">還款狀態：</td>
                <td>
                    <asp:DropDownList ID="ddlRpMoneyFlag" runat="server">
                        <asp:ListItem Value="">全部項目</asp:ListItem>
                        <asp:ListItem Value="0">未歸還項目</asp:ListItem>
                        <asp:ListItem Value="1">已歸還項目</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width:80px">預計還款日：</td>
                <td>
                    <TM:DatePickerTextBox ID="txtcrpExpectReturnDateS" runat="server" datepicker="datepicker" Width="85px"></TM:DatePickerTextBox>～
                    <TM:DatePickerTextBox ID="txtcrpExpectReturnDateE" runat="server" datepicker="datepicker" Width="85px"></TM:DatePickerTextBox>
                </td>
                 <td style="text-align:right">帳別：</td>
                 <td>
                     <asp:DropDownList ID="ddlSort" runat="server">
                     </asp:DropDownList>
                 </td>
            </tr>
             <tr>
                <td style="width:80px">還款日期：</td>
                <td colspan="3">
                    <TM:DatePickerTextBox ID="txtcrpRpDateS" runat="server" datepicker="datepicker" Width="85px"></TM:DatePickerTextBox>～
                    <TM:DatePickerTextBox ID="txtcrpRpDateE" runat="server" datepicker="datepicker" Width="85px"></TM:DatePickerTextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4"><asp:Button ID="btnList" runat="server" Text="列出資料" /></td>
            </tr>
        </table>        
        </fieldset>
        </td>
        </tr>
        </table>
    </div>
    <p>
        <asp:Button ID="btnPrint" runat="server" Text="列印零用金預借清冊" /></p>
    <div>        
        <table width="713" border="1" cellspacing="0" bgcolor="#FFFFFF" bordercolor="#C1D1A1" style="border-collapse: collapse; margin-left: 21; margin-top: 15">
			<tr>
				<td>
                    <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" 
                        EnableModelValidation="True" CellPadding="5" Font-Size="Small" 
                        GridLines="None" BackColor="#C1D1A1" CellSpacing="1" Width="100%">   
                        <EmptyDataTemplate>
                            <span style="color:Blue">無資料!</span>
                        </EmptyDataTemplate>
                        <HeaderStyle wrap="False" horizontalalign="Center" forecolor="#3F3D3D" backcolor="#E0E8B9"></HeaderStyle>                     
                        <RowStyle backcolor="#FFFCEC" />
                        <Columns>
                            <asp:BoundField DataField="crpYear" HeaderText="年度" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="crpNo" HeaderText="編號" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="crpUserNo" HeaderText="借款人" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="預借日期" HeaderText="預借日期" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="crpMoney" DataFormatString="{0:#,#}" 
                                HeaderText="預借金額" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="預計還款日" HeaderText="預計還款日" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="crpMemo" HeaderText="預借備註" />
                            <asp:BoundField DataField="還款日" HeaderText="還款日期" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="crpRpMoney" DataFormatString="{0:#,#}" 
                                HeaderText="還款金額" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="crpRpMemo" HeaderText="還款備註" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" height="35" style="font-size:small">
					    <tr style="text-align:right">
                            <td>
                                <asp:Label ID="labRowCount" runat="server"></asp:Label>｜
                                總預借金額：<asp:Label ID="labcrpMoney" runat="server" ForeColor="Orange"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                總還款金額：<asp:Label ID="labcrpRpMoney" runat="server" ForeColor="Orange"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
