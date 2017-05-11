<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCombine.aspx.vb" Inherits="UI.Cash.Web.FrmCombine" %>
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

    <script type="text/javascript" language="javascript">
        $(function () {

        });

        //1021007[add]:開啟編輯受款人
        function OpenPayNameList1(MyKey) {
            var url = "FrmCashReceiveDtl1_Edit.aspx?MyKey=" + MyKey.toString();
            var digW = screen.width - 8 - 100;
            var digH = screen.availHeight - 47 - 150;
            var infoStream = showModalDialog(url, window, "dialogWidth: " + digW + "px; dialogHeight: " + digH + "px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
        }


        function OpenPayNameListView() {
            var key = "";
            var strYear = '<%=Session("Default_Year").ToString() %>';
            var strBatchNo = $('#txtcsmBatchNo').val();
            var strSDate = $('#hid_SDate').val();
            var strEDate = $('#hid_EDate').val();
            var strPayCode = $('#txtpayCode').val();
            key = strYear + ":" + strBatchNo + ":" + strSDate + ":" + strEDate + ":" + strPayCode
            var url = "FrmCashReceiveDtl_View.aspx?MyKey="+key;
            var digW = screen.width - 8 - 130;
            var digH = screen.availHeight - 47 - 150;
            var infoStream = showModalDialog(url, window, "dialogWidth: " + digW + "px; dialogHeight: " + digH + "px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
        }

        function OpenPaymentWork() {
            var url = "FrmPaymentWork.aspx?MyKey=" + MyKey.toString();
            var digW = screen.width - 8 - 100;
            var digH = screen.availHeight - 47 - 150;
            var infoStream = showModalDialog(url, window, "dialogWidth: " + digW + "px; dialogHeight: " + digH + "px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="field">
        <table style="font-size:small">
            <tr style="display:none">
                <td colspan="3" style="font-weight:bold">▼合併作業查詢</td>
            </tr>
            <tr>
                <td>申請日期區間</td>
                <td><TM:DatePickerTextBox ID="txtSDate" runat="server" datepicker="datepicker" Width="85px" AutoPostBack="True"></TM:DatePickerTextBox>～
                    <TM:DatePickerTextBox ID="txtEDate" runat="server" datepicker="datepicker" Width="85px" AutoPostBack="True"></TM:DatePickerTextBox>
                    <asp:HiddenField ID="hid_SDate" runat="server" />
                    <asp:HiddenField ID="hid_EDate" runat="server" />
                </td>                
            </tr>
            <tr>
                <td class="auto-style1">批號</td>
                <td class="auto-style1"><asp:TextBox ID="txtcsmBatchNo" runat="server" Width="105px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>員工編號</td>
                <td><asp:TextBox ID="txtpayCode" runat="server" Width="105px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="txtSearch" runat="server" Text="查詢" />
                    <input id="btnQuery" type="button" value="明細查詢" onclick="OpenPayNameListView()" />
                    <asp:Button ID="txtClear" runat="server" Text="重新填寫" /></td>
            </tr>
        </table>
    </div>
    <p></p>
    <div class="field">
        <table style="font-size:small">
            <tr>
                <td>匯款日期</td>
                <td><TM:DatePickerTextBox ID="txtcsmDate" runat="server" datepicker="datepicker" Width="85px"></TM:DatePickerTextBox></td>
                <td>匯款人員</td>
                <td><asp:TextBox ID="txtcsmUser" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>匯出專戶編號</td>
                <td>
                    <asp:DropDownList ID="ddlcsmAccNo" runat="server">
                    </asp:DropDownList>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>指定入帳日</td>
                <td><TM:DatePickerTextBox ID="txtcsmBillDate" runat="server" datepicker="datepicker" Width="85px"></TM:DatePickerTextBox></td>
                <td style="text-align:right">完成入帳</td>
                <td><asp:CheckBox ID="cbcsmBillFlag" runat="server" ToolTip="打勾代表已入帳" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="儲存入帳資料" /></td>
            </tr>
        </table>
        <asp:GridView ID="GVList" runat="server" class="grid" 
            AutoGenerateColumns="False" EnableModelValidation="True" 
            AllowPaging="True" DataKeyNames="csmYear,csmMainNo">
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
            <Columns>
                <asp:TemplateField HeaderText="選取／明細">
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Button ID="btnSelect" runat="server" Text="選取" CommandName="Select" />
                        <input id="btnDetail" type="button" value="明細" onclick="OpenPayNameList1('<%# Eval("MyKey") %>');" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="批號">
                    <ItemTemplate>
                        <%--<asp:Label ID="labcsmBatchNo" runat="server" Text='<%# Eval("csmBatchNo") %>' ToolTip='<%# Eval("csmMainNo") %>'></asp:Label>--%>
                        <asp:Label ID="labcsmBatchNo" runat="server" Text='<%# Eval("BatchNo")%>' ToolTip='<%# Eval("csmMainNo") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="CreateDateTW" HeaderText="合併日期">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="csmAmount" DataFormatString="{0:#,0}" 
                    HeaderText="金額">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="狀態" HeaderText="狀態">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CreateUser" HeaderText="合併人員">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="報銷類別" HeaderText="報銷類別" />
                <asp:BoundField DataField="csmPayNameDesc" HeaderText="備註" />
                <asp:BoundField DataField="csName" HeaderText="帳別" />
                <asp:TemplateField HeaderText="審核否">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("審核否") %>'></asp:Label>
                        <asp:Label ID="labcsmPassFlag" runat="server" Text='<%# Eval("csmPassFlag") %>' Visible="false"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>        
        <asp:Label ID="labGVListMsg" runat="server" style="font-size:small"></asp:Label>
    </div>
    <p></p>
    <div style="width:600px;text-align:center">
        <asp:Button ID="btnPrtList" runat="server" Text="列印請領清冊" />
        <asp:Button ID="btnPrtBillList" runat="server" Text="產生銀行入帳清冊" />
        <asp:Button ID="btnMedia" runat="server" Text="產生入帳磁片" />
        <asp:Button ID="btnSendMail" runat="server" Text="發送入帳通知單" />
    </div>
    <div style="width:600px;text-align:center; font-size:small">
    <br />
        <span style="font-weight:bold">「發送入帳通知單」注意事項：注意事項：</span><br />
        <span style="color:Blue">
        1.應先打勾「完成入帳」，才可發送通知。<br />
        2.系統僅發送給有設定email，且尚未email通知過的受款人。<br />
        3.如需個別通知，或重複通知，或查看通知狀況，請點「明細」鈕開啟明細操作。
        </span>
    </div>
    </form>
</body>
</html>
