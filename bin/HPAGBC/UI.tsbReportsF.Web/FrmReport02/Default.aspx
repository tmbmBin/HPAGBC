<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.tsbReportsF.Web.FrmReport02.Default" %>
<%@ Import Namespace="System.Web.Optimization" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%-- Style專區 --%>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <%: Styles.Render("~/Content/jquery.pagination") %>
    <%-- JavaScript專區 --%>
    <%: Scripts.Render("~/bundles/jquery") %>
    <%: Scripts.Render("~/bundles/basic") %>
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/kendo") %>
    <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
    <%: Scripts.Render("~/bundles/MyLibraryJs") %>
    <%: Scripts.Render("~/bundles/jquery.pagination") %>
    <%: Scripts.Render("~/bundles/URI") %>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">預算控制備查簿</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">會簽編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">申請業務單位</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbWorkUnitNo" runat="server" AppendDataBoundItems="True">
                            </asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td class="qury_table_td">申請人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbWorkUserNo" runat="server" Width="150px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">日期區間</td>
                        <td class="qury_table_td2">至
                                <asp:TextBox ID="txttsbDate" runat="server" Width="120px" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">分項計畫名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="650px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">用途說明</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="650px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">受款人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbPayeeName" runat="server" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnList" runat="server" Text="列出資料" class="Btn02" OnClick="btnList_Click" />
                &nbsp;&nbsp;
              <asp:Button ID="btnExport" runat="server" Text="匯出Excel檔" class="Btn02" OnClick="btnExport_Click" />
                <input id="hdfDownloadToken" type="hidden" runat="server" />
            </div>
            <div class="MainCon2">
                <input type="hidden" id="hdfMenuID" runat="server" />
                <div>
                    <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                        CssClass="GridViewStyle" Width="100%">
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <Columns>
                            <asp:TemplateField HeaderText="會簽編號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("會簽編號") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="單位別" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbldptName" runat="server" Text='<%# Eval("單位別") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="申請人" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbWorkUserNo" runat="server" Text='<%# Eval("申請人") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="業務計畫" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblParent_plnPlanName" runat="server" Text='<%# Eval("業務計畫")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="分項計畫" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblplnPlanName" runat="server" Text='<%# Eval("分項計畫")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用途說明" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text='<%# Eval("用途說明") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用途別" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbloulOutlayName" runat="server" Text='<%# Eval("用途別") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="受款人" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("受款人") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核定金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyA" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("核定金額")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="撥款金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyB" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("撥款金額")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核銷金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyC" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("核銷金額")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="繳回金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyD" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("繳回金額")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                    </asp:GridView>
                    <br style="clear: both;" />
                   <%-- <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>--%>
                    <br style="clear: both;" />
                </div>
            </div>
        </div>
        <%-- ↓↓其他 plugin↓↓ --%>
        <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.cookie/jquery.cookie.js")%>" type="text/javascript"></script>
        <script type="text/javascript">

            $(function () {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();

            });

            $("#btnExport").click(function () {
                MyLibraryJs.JqPluginExt.fnBlockUIForDownload($("[id$='hdfDownloadToken']"), "hdfDownloadToken", "資料產生中...");
            });

        </script>
    </form>
</body>
</html>
