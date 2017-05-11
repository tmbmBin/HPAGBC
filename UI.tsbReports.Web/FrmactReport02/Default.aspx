<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.tsbReports.Web.FrmactReport02.Default" %>

<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="ShareFunc" %>

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
                <h1 class="h1Class">請購(修)清單</h1>
                <table style="width: 100%;">
                    <tr>
                        <td class="qury_table_td">動支編號</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtacmWordNum" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">日期區間</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtStartDate" runat="server" Width="120px" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                            ～
                        <asp:TextBox ID="txtEndDate" runat="server" Width="120px" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">承辦人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtacmWorkUserNo" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">採購種類</td>
                        <td class="qury_table_td2" >
                            <asp:DropDownList runat="server" ID="ddlactBuyKind">
                                <asp:ListItem Value="" Text="................"></asp:ListItem>
                                <asp:ListItem Value="0" Text="無"></asp:ListItem>
                                <asp:ListItem Value="1" Text="優先採購"></asp:ListItem>
                                <asp:ListItem Value="2" Text="綠色採購"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="qury_table_td">區域</td>
                        <td class="qury_table_td2" >
                            <asp:DropDownList runat="server" ID="ddltsbCityName" DataTextField="Text" DataValueField="Value">
                                <asp:ListItem Value="" Text="全部"></asp:ListItem>
                                <asp:ListItem Value="台北" Text="台北"></asp:ListItem>
                                <asp:ListItem Value="台中" Text="台中"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <input type="button" class="Btn02" id="btnListData" value="列出資料" />
                <asp:Button ID="btnExport" runat="server" Text="匯出至Excel" class="Btn02" OnClick="btnExport_Click" />
                <input id="hdfDownloadToken" type="hidden" runat="server" />
            </div>
            <div class="MainCon2">
                <input type="hidden" id="hdfMenuID" runat="server" />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <h1 class="h1Class">請購(修)清單明細</h1>
                        <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                            CssClass="GridViewStyle" Width="100%">
                            <FooterStyle CssClass="GridViewFooterStyle" />
                            <RowStyle CssClass="GridViewRowStyle" />
                            <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                            <HeaderStyle CssClass="GridViewHeaderStyle" />
                            <Columns>
                                <asp:TemplateField HeaderText="動支編號">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("動支編號") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <%--                            <asp:TemplateField HeaderText="單據<br/>種類" >
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("單據種類") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="承辦人">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("承辦人") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="請示日期">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("請示日期").ToRocDate() %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="明細<br/>序號">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("明細序號") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="3%" />
                                    <ItemStyle HorizontalAlign="Center" Width="3%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="品名">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("品名") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="7%" />
                                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="用途說明">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("用途說明") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="13%" />
                                    <ItemStyle HorizontalAlign="Center" Width="13%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="數量">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("數量") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="3%" />
                                    <ItemStyle HorizontalAlign="Center" Width="3%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="總價">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("總價").ToMoney() %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="7%" />
                                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                                </asp:TemplateField>
                                <%--                            <asp:TemplateField HeaderText="請示事由" >
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("請示事由") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="表單<br/>狀態">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("表單狀態") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="報支<br/>次號">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("報支次號") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="3%" />
                                    <ItemStyle HorizontalAlign="Center" Width="3%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="報支<br/>日期">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("報支日期").ToRocDate() %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <%--                            <asp:TemplateField HeaderText="核銷事由" >
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("核銷事由") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="核銷<br/>總金額">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("核銷總金額").ToMoney() %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="7%" />
                                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="廠商<br/>名稱">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("廠商名稱") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="採購<br/>種類">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("採購種類") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="支付<br/>方式">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("支付方式") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="地區">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("地區") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="3%" />
                                    <ItemStyle HorizontalAlign="Center" Width="3%" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                        </asp:GridView>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnPage" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:Button runat="server" ID="btnPage" Style="display: none;" OnClick="btnPage_Click" />
            </div>
        </div>
        <%-- ↓↓其他 plugin↓↓ --%>
        <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.cookie/jquery.cookie.js")%>" type="text/javascript"></script>

        <script type="text/javascript">
            $(function () {
                $.MyKendoDatePicker();

                $("#btnExport").click(function () {
                    MyLibraryJs.JqPluginExt.fnBlockUIForDownload($("[id$='hdfDownloadToken']"), "hdfDownloadToken", "資料產生中...");
                });

                $("#btnListData").click(function () {
                    $.blockUI({ message: "<h1><b><img src='<%= MyLibrary.UrlExt.GetRelativeUrl("~/Images/ajax-loader.gif")%>' />資料產生中...</b></h1>" });
                    $('#btnPage').trigger('click');
                });

            });
            function upCallBack() {
                $.unblockUI();
            }
        </script>
    </form>
</body>
</html>
