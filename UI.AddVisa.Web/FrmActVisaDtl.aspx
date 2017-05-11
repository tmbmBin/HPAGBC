<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmActVisaDtl.aspx.cs" Inherits="UI.AddVisa.Web.FrmActVisaDtl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <table cellpadding="5" style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" bgcolor="#dadee9" width="550">
                <tr>
                    <td bordercolor="#666668" style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid">
                        <table border="1" cellpadding="1" style="border-collapse: collapse" bordercolor="#ffffff" width="100%">
                            <tr>
                                <td>
                                    <table border="0" width="100%" cellpadding="1" style="border-collapse: collapse">
                                        <tr>
                                            <td align="right" style="width: 80px">動支編號：</td>
                                            <td align="left" style="width: 200px">

                                                <asp:TextBox ID="TBAcmWordNum" runat="server"></asp:TextBox>
                                            </td>
                                            <td align="right" style="width: 80px">&nbsp;</td>
                                            <td align="left">&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnList" runat="server" Text="列出資料" OnClick="btnList_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <br />


            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="動支編號">
                        <ItemTemplate>
                            <asp:Label ID="ctl_AcmWordNum" runat="server" Text='<%# Eval("acmWordNum") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="明細號">
                        <ItemTemplate>
                            <asp:Label ID="ctl_AcvNo" runat="server" Text='<%# Eval("acvNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="預算來源">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("orgName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="經資門別">
                        <ItemTemplate>
                            <asp:Label ID="ctl_AccKindName" runat="server" Text='<%# Eval("accKindName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="經費單位">
                        <ItemTemplate>
                            <asp:Label ID="ctl_AcvBgtDepName" runat="server" Text='<%# Eval("acvBgtDepName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="承辦業務別">
                        <ItemTemplate>
                            <asp:Label ID="ctl_BizName" runat="server" Text='<%# Eval("bizName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="計畫名稱">
                        <ItemTemplate>
                            <asp:Label ID="ctl_PlanName" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="用途別名稱">
                        <ItemTemplate>
                            <asp:Label ID="ctl_OulName" runat="server" Text='<%# Eval("OulName") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="金額">
                        <ItemStyle HorizontalAlign="Right" />
                        <ItemTemplate>
                            <asp:Label ID="ctl_AcvMoney" Style="text-align: right" runat="server" Text='<%# Eval("acvMoney", "{0:#,0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
