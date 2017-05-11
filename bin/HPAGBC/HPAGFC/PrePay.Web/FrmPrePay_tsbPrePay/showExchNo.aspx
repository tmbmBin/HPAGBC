<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showExchNo.aspx.cs" Inherits="PrePay.Web.FrmPrePay_tsbPrePay.showExchNo" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <%: Styles.Render("~/Content/jquery.pagination") %>
    <% if (false)
       { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtReturnData" runat="server" Height="150px" Width="100%" Style="display: none"></asp:TextBox>
            <asp:TextBox ID="txtMessage" runat="server" Style="display: none"></asp:TextBox>
            <asp:TextBox ID="txtTotaltsbPreMoney" runat="server" Style="display: none"></asp:TextBox>

            <div class="MainCon2" style="width: 90%">
                <h1 class="h1Class">
                    <asp:Label ID="lbltitle" runat="server" Text="傳票號碼瀏覽"></asp:Label></h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <div>
                      <h1>  預撥傳票資料 </h1>
                     <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                        CssClass="GridViewStyle" Width="100%">

                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <Columns>
                
                              <asp:TemplateField HeaderText="核定明細號" Visible="True">
                                <ItemTemplate>
                                      <asp:Label ID="lblBtsbDecideSeq" runat="server" Text='<%# Eval("BtsbDecideSeq") %>'></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>


                              <asp:TemplateField HeaderText="簽證號碼" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblWordNumDetail" runat="server" Text='<%# Eval("WordNumDetail") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                  

                             <asp:TemplateField HeaderText="傳票號碼" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblBtsbExchNo" runat="server" Text='<%# Eval("BtsbExchNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            

                             <asp:TemplateField HeaderText="預撥金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblBtsbMoney" runat="server" Text='<%#   string.Format( "{0:N0}",Eval("BtsbMoney")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                               <%--  <asp:TemplateField HeaderText="實支(付現)金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblBtsbCash" runat="server" Text='<%#  string.Format( "{0:N0}",Eval("BtsbCash")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>--%>




                            <%-- ↑↑開始資料行↑↑ --%>
                        </Columns>
                        <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                    </asp:GridView>


                     
                    <br style="clear: both;" />
                    <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
                    <br style="clear: both;" />
                </div>
            </div>

        </div>
        <div style="text-align: center; margin: 10px;">
         
        </div>

        <%: Scripts.Render("~/bundles/jquery") %>
        <%: Scripts.Render("~/bundles/basic") %>
        <%: Scripts.Render("~/bundles/jqueryval") %>
        <%: Scripts.Render("~/bundles/kendo") %>
        <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
        <%: Scripts.Render("~/bundles/MyLibraryJs") %>
        <%: Scripts.Render("~/bundles/jquery.pagination") %>
        <%: Scripts.Render("~/bundles/URI") %>

        <script type="text/javascript">
            $(function () {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();


                //#region 分頁初始化
                fnPaginationInit($$("##divPagination"));

                function fnPaginationInit($jq, options) {
                    /// <summary>
                    /// 初始化 Pagination 的預設值
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
                //#endregion

            }); //$.ready

            function checkAll(header) {
                $('#<%= GridView1.ClientID %> input[type=checkbox]').prop("checked", header.checked);
            }

        </script>
    </form>
</body>

</html>
