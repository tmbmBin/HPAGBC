<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmTrlPayForeign.aspx.vb" Inherits="UI.ActMixPay.Web.FrmTrlPayForeign" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<%@ Register Src="../UI.ActMixPay.UC/UCActPay.ascx" TagPrefix="uc" TagName="UCActPay" %>
<%@ Register src="../UI.ActMixPay.UC/UCActPayVisaMix.ascx" tagname="UCActPayVisaMix" tagprefix="uc1" %>

<%@ Register src="../UI.ActMixPay.UC/UCActWordNum.ascx" tagname="UCActWordNum" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <script type="text/javascript" language="javascript" src="ScriptFiles/JSCollapse.js"></script>
    <link   type="text/css"        rel="stylesheet"      href="CSSFiles/JSCollapse.css"/>
</head>
<body onload='get_cookies();' onunload='set_cookies()'>
    <form id="form1" runat="server" >
  <table id="TablePass" runat="server" style="margin-top: 0px; margin-left: 0px; border-collapse: collapse;"
        cellpadding="5" width="600" bgcolor="#dadee9">
        <tr>
            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid;
                border-bottom: #666668 1pt solid" bordercolor="#666668" valign="top" align="left">
                <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%"
                    border="1">
                    <tr>
                        <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid;
                            border-bottom: #666668 1pt solid" bordercolor="#666668">
                            <table border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout: fixed">
                                <tr>
                                    <td style="color: #FF0000; width: 75px;" align="right">
                                        <asp:Label ID="LBPassDate" runat="server" Text="核支日期"></asp:Label>
                                    </td>
                                    <td style="width: 110px;">
                                        <asp:TextBox ID="TBAcmPassDate" runat="server" MyName="TBAcmPassDate" Style="text-align: center;
                                            background-color: #FFE0C0" Width="90px" ondblclick="JavaScript: UCPassDate.Show();"></asp:TextBox>
                                    </td>
                                    <td style="color: #FF0000; width: 85px;" align="right">
                                    </td>
                                    <td style="width: 110px;">
                                        &nbsp;</td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td style="height: 10px">
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" style="border-collapse: collapse">
        <tr>
            <td valign="top">
                <!-- 左框架START -->
                <table cellpadding="0" style="border-collapse: collapse" border="0">
                    <tr>
                        <td valign="top">
                            <table cellpadding="0" style="border-collapse: collapse" border="1" bordercolor="#666668"
                                bgcolor="#DADEE9">
                                <tr>
                                    <td style="padding-top: 1px" onpropertychange="try{childNodes.width = this.clientWidth;}catch(e){;};">
                                        <!-- ↓審核原因 -->
                                        <!-- 審核原因↑ -->
                                        <!-- ↓審核 -->
                                        <uc2:UCActWordNum ID="UCActWordNum1" runat="server" />
                                        <uc:UCActPay runat="server" ID="UCMixActPay1" />
                                        <uc1:UCActPayVisaMix runat="server"  ID="UCActPayVisaMix1" />
                                        <!-- ↓區塊(1) -->
                                        <!-- 區塊(1)↑ -->
                                        <!-- ↓區塊(2) -->
                                        <!-- ↓區塊(2) -->
                                        <!-- 區塊(2)↑ -->
                                        <!-- ↓區塊(3) -->
                                        <!-- 區塊(3)↑ -->
                                        <!-- ↓區塊(4) -->
                                        <!-- 區塊(4)↑ -->
                                        <!-- ↓區塊(5) -->
                                        <!-- 區塊(5)↑ -->
                                        <!-- Insert 區塊 here -->
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!-- ↓歷史資料 -->
                <table cellpadding="0" style="border-collapse: collapse; margin-top: 5" border="1"
                    bordercolor="#666668" bgcolor="#DADEE9">
                    <tr>
                        <td>
                            <table cellpadding="5" style="border-collapse: collapse" border="1" bordercolor="#FFFFFF">
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnAdd" runat="server" Text="新增" Width="50px" Height="22px"></asp:Button>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BtnEdit" runat="server" Text="修改" Width="50px" Height="22px"></asp:Button>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:Button>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px"></asp:Button>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:Button>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"></asp:Button>
                                                </td>
                                                <td>
                                                    <input type="button" id="BtnPrint1" runat="server" style="width: 50px; height: 22px"
                                                        value="列印" onclick="fnCallReportMenu();" />
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <input type="hidden" id="ctl_WhereSql" runat="server" name="ctl_WhereSql" />
                                                </td>
                                                <td>
                                                    <input type="hidden" id="ctl_OrderSql" runat="server" name="ctl_OrderSql" /><input
                                                        type="hidden" id="TBModFlag" runat="server" name="TBModFlag" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="_freezingDiv" class="DIV0_width">
                                            <asp:GridView ID="GV_actPay" runat="server" BackColor="White" BorderColor="#999999"
                                                BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True"
                                                GridLines="Vertical" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                                Font-Size="X-Small">
                                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="選取" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="ctl_Select" runat="server" CausesValidation="False" CommandName="Select"
                                                                Text="□"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px" />
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>                                                  
                                                    <asp:TemplateField HeaderText="核銷次號" SortExpression="acmYear">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ctl_AcpPayNoPrv" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acpPayNoPrv") & "" ))) %>'
                                                                DBFieldName="acpPayNoPrv"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="60px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="核銷日期" SortExpression="acmMarkDate">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ctl_AcpMarkDate" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.acpMarkDate").ToString())  & ""  ) %>'
                                                                DBFieldName="acpMarkDate"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="60px" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="核銷人員" SortExpression="acmMarkDate">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ctl_AcpMarkUserNo" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.acpMarkUserNo").ToString())  & ""  ) %>'
                                                                DBFieldName="acpMarkUserNo"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" Wrap="False" />
                                                    </asp:TemplateField>        
                                                    <asp:TemplateField HeaderText="核銷金額" SortExpression="acpMoney">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ctl_AcpMoney" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acpMoney") & "" ))) %>'
                                                                DBFieldName="acpMoney"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="核銷事由" SortExpression="acpMemo">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ctl_AcpMemo" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpMemo").ToString()) %>'
                                                                DBFieldName="acpMemo"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="最後異動" SortExpression="acpModifyUser">
                                                        <ItemTemplate>
                                                           <asp:Label ID="ctl_AcpModifyUser" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpModifyUser").ToString()) %>'
                                                                DBFieldName="acpModifyUser" ToolTip='<%# AntiXss.HtmlEncode(MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.acpModifyDTime").ToString())  & ""  ) %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="60px" Wrap="False" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                <SelectedRowStyle BackColor="DarkOrange" Font-Bold="True" ForeColor="White" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
                                            <tr>
                                                <td>
                                                </td>
                                                <td align="right">
                                                    <table cellpadding="0" style="border-collapse: collapse" border="0">
                                                        <tr>
                                                            <td>
                                                                <font size="2">只列出｜</font>
                                                            </td>
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
                                                                <asp:DropDownList ID="DDLSortDep" runat="server" AutoPostBack="True">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DDLSortPassFlag" runat="server" AutoPostBack="True">
                                                                    <asp:ListItem Value="0">未審核</asp:ListItem>
                                                                    <asp:ListItem Value="1">已審核</asp:ListItem>
                                                                    <asp:ListItem Value="">不區分</asp:ListItem>
                                                                </asp:DropDownList>
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
                <!--歷史資料↑ -->
                <!-- 左框架END -->
            </td>
            <td width="5">
            </td>
            <td valign="top" width="200">
                <iframe id="iFrame" name="iFrame" border="0" frameborder="0" scrolling="no" width="200"
                    height="520"></iframe>
            </td>
        </tr>
    </table>

    </form>
</body>
</html>
