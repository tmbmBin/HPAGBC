<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.tsbReportsF.Web.FrmReport01.Default" %>

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
    <% if (false)
       { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
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
                <h1 class="h1Class">預算執行情形狀況表</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">截至</td>
                        <td class="qury_table_td3">
                            <asp:DropDownList ID="ddlMonth" runat="server" Width="100px">
                            </asp:DropDownList>
                            <asp:Label ID="lblMonth" runat="server" Text="月" Height="25"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">分項計畫名稱</td>
                        <td class="qury_table_td3">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="650px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnList" runat="server" Text="列出資料" CssClass="Btn02" OnClick="btnList_Click" />
                &nbsp;&nbsp;
              <asp:Button ID="btnExport" runat="server" Text="匯出Excel檔" CssClass="Btn02" OnClick="btnExport_Click"  />
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
                            <asp:TemplateField HeaderText="計畫名稱" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblplnPlanName" runat="server" Text='<%# Eval("項目")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="全年度預算數A" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyA" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("全年度預算數")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="累計分配數B" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyB" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("累計分配數")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="累計實際撥出數C" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyC" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("累計實際撥出數")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="累計核銷數D" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyD" runat="server" Text='<%#   string.Format( "{0:N0}" ,Eval("累計核銷數")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="累計執行數E" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyE" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("累計執行數")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="占預算執行率" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyF" runat="server" Text='<%# Eval("占預算執行率")%>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="占分配執行率" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoneyG" runat="server" Text='<%# Eval("占分配執行率")%>'></asp:Label>
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
        <%: Scripts.Render("~/bundles/jquery") %>
        <%: Scripts.Render("~/bundles/basic") %>
        <%: Scripts.Render("~/bundles/jqueryval") %>
        <%: Scripts.Render("~/bundles/kendo") %>
        <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
        <%: Scripts.Render("~/bundles/MyLibraryJs") %>
        <%: Scripts.Render("~/bundles/jquery.pagination") %>
        <%: Scripts.Render("~/bundles/URI") %>
        <%-- ↓↓其他 plugin↓↓ --%>
        <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.cookie/jquery.cookie.js")%>" type="text/javascript"></script>

        <script type="text/javascript">

            $(function () {
                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();

                fnPaginationInit($$("##divPagination"));
              
                //setplanCode() // 分項計畫列表樣式變更
                //20150721 [del]:取消業務計畫無法點選
            });
            
            $("#btnExport").click(function () {
                MyLibraryJs.JqPluginExt.fnBlockUIForDownload($("[id$='hdfDownloadToken']"), "hdfDownloadToken", "資料產生中...");
            });

            function fnPaginationInit($jq, options) {

                var PageIndex = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageIndex"));
                var PageSize = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageSize"));
                var ItemsCount = MyLibraryJs.StringExt.fnGetInt($jq.attr("ItemsCount"));

                var link_to = URI(location.href)
                    .setSearch("pageIndex", "__id__")
                    .removeSearch("selectedIndex").toString();


                /* 初始值 */
                var defaults = {
                    callback: function (new_page_index, pagination_container) {

                        return true;
                    },
                    current_page: PageIndex,
                    items_per_page: PageSize,
                    link_to: link_to,
                    next_text: "下一頁",
                    prev_text: "上一頁",
                    num_edge_entries: 1
                };
                var settings = $.extend(defaults, options);


                $jq.pagination(ItemsCount, settings);


                //依狀態啟用停用頁碼連結
                if ($jq.is("[disabled]")) {
                    $jq.find("a").attr("disabled", "disabled")
                        .removeAttr("href")
                        .css("cursor", "default")
                        .click(function (e) {
                            e.stopPropagation();
                        });
                }
            }

            //分項計畫_部分選項禁止點選
            function setplanCode() {
                var tmpstop = "0";
                $('#<%= ddltsbPlanCode.ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
            }
        </script>
    </form>
</body>
</html>
