<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.tsbReports.Web.FrmtsbReport15.Default" %>

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
                <h1 class="h1Class">補(捐)助經費明細表</h1>
                <table style="width: 100%;">
                    <tr>
                        <td class="qury_table_td">年度</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlYear" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td class="qury_table_td">執行單位</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlcodDepartName" runat="server" style="width:500px;" DataTextField="Text"  DataValueField="Value">
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td class="qury_table_td">日期區間</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtDateStart" runat="server" Width="130px" MyKendoDatePicker="MyKendoDatePicker" ></asp:TextBox>
                            <asp:Label ID="lblMonth" runat="server" Text="至" Height="25"></asp:Label>
                            <asp:TextBox ID="txtDateEnd" runat="server" Width="130px" MyKendoDatePicker="MyKendoDatePicker" ></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">審定狀態</td>
                        <td class="qury_table_td3" colspan="3">
                            <asp:DropDownList ID="ddltsbIsAudit" runat="server" Width="150px">
                                <asp:ListItem Value="0" Text="審定前"></asp:ListItem>
                                <asp:ListItem Value="1" Text="審定後"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">計畫科目</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" style="width:500px;" DataTextField="Text"  DataValueField="Value">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">用途別科目</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlOutlayCode" runat="server" style="width:500px;" DataTextField="Text"  DataValueField="Value">
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td class="qury_table_td">受補捐助單位名稱</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbPayeeName" runat="server" Width="400px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="qury_table_td">捐補助事項或用途</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="400px"></asp:TextBox>
                        </td>
                    </tr>

                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnExport" runat="server" Text="匯出至Excel" class="Btn02" OnClick="btnExport_Click" />
                <input id="hdfDownloadToken" type="hidden" runat="server" />
            </div>
            <div class="MainCon2">
                <input type="hidden" id="hdfMenuID" runat="server" />
            </div>
        </div>

        <%-- ↓↓其他 plugin↓↓ --%>
        <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.cookie/jquery.cookie.js")%>" type="text/javascript"></script>

        <script type="text/javascript">

            $(function () {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();

                //#region 分頁初始化
                fnPaginationInit($$("##divPagination"));


            });

            $("#btnExport").click(function () {
                MyLibraryJs.JqPluginExt.fnBlockUIForDownload($("[id$='hdfDownloadToken']"), "hdfDownloadToken", "資料產生中...");
            });

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
                    callback: function (new_page_index, pagination_container) { return true; },
                    current_page: PageIndex,
                    items_per_page: PageSize,
                    link_to: link_to,
                    next_text: "下一頁",
                    prev_text: "上一頁",
                    num_edge_entries: 1
                };
                var settings = $.extend(defaults, options);


                $jq.pagination(ItemsCount, settings);

/*
                //依狀態啟用停用頁碼連結
                if ($jq.is("[disabled]")) {
                    $jq.find("a").attr("disabled", "disabled")
                        .removeAttr("href")
                        .css("cursor", "default")
                        .click(function (e) {
                            e.stopPropagation();
                        });
                }
				*/
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
