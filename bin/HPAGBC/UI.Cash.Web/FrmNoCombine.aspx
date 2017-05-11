<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmNoCombine.aspx.vb" Inherits="UI.Cash.Web.FrmNoCombine" %>
<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <title></title>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3.min.js"></script>
    <%-- ↓↓ datepicker(民國) 所需檔案(Web.config也要設定)↓↓ --%>
    <script src="../jQuery/jquery.ui.datepicker.js" type="text/javascript"></script>
    <script src="../jQuery/jquery.ui.datepicker.zh-TW.init.chinese.js" type="text/javascript"></script>
    <script src="../TM.Style/TM.ServerControl.js" type="text/javascript"></script>
    <link href="../CSSFiles/layout.ui.datepicker.css" rel="stylesheet" type="text/css" />
    <link href="../TM.Style/TM.ServerControl.css" rel="stylesheet" type="text/css" />
    <%-- ↑↑ datepicker(民國) 所需檔案↑↑ --%>
    <link href="Style/Style.css" rel="Stylesheet" />

    <script language="javascript" type="text/javascript">
        $(function () {
            //全選/取消全選
            $("#cbSelectAll").click(function () {
                if ($("#cbSelectAll").attr("checked") == "checked") {
                    $("input[name$='cbSelect']").attr("checked", "checked");
                }
                else {
                    $("input[name$='cbSelect']").attr("checked", false);
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="field">
        <table style="font-size:small">
            <tr style="display:none">
                <td colspan="3" style="font-weight:bold">▼未合併查詢</td>
            </tr>
            <tr>
                <td>費用報銷日期起迄</td>
                <td><TM:DatePickerTextBox ID="txtSDate" runat="server" datepicker="datepicker" Width="85px"></TM:DatePickerTextBox>～
                    <TM:DatePickerTextBox ID="txtEDate" runat="server" datepicker="datepicker" Width="85px"></TM:DatePickerTextBox></td>                
            </tr>
            <tr>
                <td>報　 銷　 類　 別</td>
                <td>
                    <asp:CheckBox ID="cbTaxi" runat="server" Text="計程車費申請" />
                    <asp:CheckBox ID="cbTrl1" runat="server" Text="國內差旅費申請" />
                    <asp:CheckBox ID="cbStudy" runat="server" Text="職員進修學分補助費申請" />
                    <asp:CheckBox ID="cbFee" runat="server" Text="直接核銷" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="txtSearch" runat="server" Text="查詢" />
                    <asp:Button ID="txtClear" runat="server" Text="重新填寫" /></td>
            </tr>
        </table>
    </div>
    <p></p>
    <div class="field">
        <asp:GridView ID="GVList" runat="server" class="grid" 
            AutoGenerateColumns="False" EnableModelValidation="True">
            <Columns>
                <asp:TemplateField HeaderText="選取">
                    <HeaderTemplate>
                        選取<input id="cbSelectAll" type="checkbox" title="全選/取消全選" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="cbSelect" runat="server" MyName="cbSelect" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="動支編號">
                    <ItemTemplate>
                        <asp:Label ID="labacmWordNum" runat="server" Text='<%# Eval("acmWordNum") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="申請類別">
                    <ItemTemplate>
                        <asp:Label ID="labKidName" runat="server" Text='<%# Eval("KidName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="申請日期">
                    <ItemTemplate>
                        <asp:Label ID="labacpMarkDateTW" runat="server" Text='<%# Eval("acpMarkDateTW") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="單位">
                    <ItemTemplate>
                        <asp:Label ID="labempDepName" runat="server" Text='<%# Eval("empDepName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="員工編號">
                    <ItemTemplate>
                        <asp:Label ID="labempNum" runat="server" Text='<%# Eval("empNum") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="姓名">
                    <ItemTemplate>
                        <asp:Label ID="labpayName" runat="server" Text='<%# Eval("payName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="金額">
                    <ItemTemplate>
                        <asp:Label ID="labacvPassMoney" runat="server" 
                            Text='<%# Eval("acvPassMoney", "{0:#,0}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="計畫名稱" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="labplnPlanName" runat="server" Text='<%# Eval("plnPlanName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="用途別名稱" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="laboulOutlayName" runat="server" Text='<%# Eval("oulOutlayName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <table width="100%">
                    <tr>
                        <td><span style="color:Blue">無資料。</span></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <HeaderStyle ForeColor="#FFFFFF" BackColor="#003366" Height="30px" />
            <RowStyle BackColor="#FFFFFF" Wrap="False" />
            <AlternatingRowStyle BackColor="#E0E0E0" Wrap="False" />
            <SelectedRowStyle BackColor="#FF8C00" Wrap="False" Font-Bold="True" />
            <PagerStyle BackColor="#696969" ForeColor="#FF4500" HorizontalAlign="Center" Wrap="False" />
        </asp:GridView>        
        <asp:Label ID="labGVListMsg" runat="server" style="font-size:small"></asp:Label>        
    </div>
    <p></p>
    <div style="width:600px;text-align:center">
        <asp:Button ID="btnPrint" runat="server" Text="列印未合併清冊" />    
    </div>    
    </form>
</body>
</html>
