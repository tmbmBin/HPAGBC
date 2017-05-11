<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.tsbReports.Web.FrmtsbReport17.Default" %>

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
    <%: Scripts.Render("~/bundles/jquery") %>
    <%: Scripts.Render("~/bundles/basic") %>
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/kendo") %>
    <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
    <%: Scripts.Render("~/bundles/MyLibraryJs") %>
    <%: Scripts.Render("~/bundles/jquery.pagination") %>
    <%: Scripts.Render("~/bundles/URI") %>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 15%;
            height: 29px;
        }
        .auto-style2 {
            text-align: left;
            width: 35%;
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">預付費用明細表</h1>
                <table style="width: 100%;">



                     <tr>
                        <td class="qury_table_td">年度</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlYear" runat="server" Width="650px">
                            </asp:DropDownList>
                        </td>
                    </tr>

                     <tr>
                        <td class="qury_table_td">經費單位</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlcodDepartName" runat="server" Width="650px">
                            </asp:DropDownList>
                        </td>
                    </tr>



                    <tr>
                        <td class="auto-style1">日期區間</td>
                        <td class="auto-style2">
                        <asp:TextBox ID="txtDateStart" runat="server" Width="150px" MyKendoDatePicker="MyKendoDatePicker" onfocus="blur()"></asp:TextBox>
                        <asp:Label ID="lblMonth" runat="server" Text="至" Height="25"></asp:Label>
                        <asp:TextBox ID="txtDateEnd" runat="server" Width="150px"  MyKendoDatePicker="MyKendoDatePicker" onfocus="blur()"></asp:TextBox>
                             
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="qury_table_td">身分別</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbPayeeRoleType" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td class="qury_table_td">縣市</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbCityName" runat="server" Width="150px" >
                            </asp:DropDownList>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="qury_table_td">計畫科目</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="650px"   multiple="multiple" data-placeholder="........" >
                            </asp:DropDownList>
                            <asp:TextBox ID="txtPlanCode" runat="server" Style="display:none"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td class="qury_table_td">用途別科目</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlOutlayCode" runat="server" Width="650px">
                            </asp:DropDownList>
                        </td>
                    </tr>

                     <tr>
                        <td class="qury_table_td">動支編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbWordNum" runat="server" Width="450px"></asp:TextBox>
                        </td>
                    </tr>

                    <%-- <tr>
                        <td class="qury_table_td">委託辦理事項</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="450px"></asp:TextBox>
                        </td>
                    </tr>--%>

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
            var tmpddltsbPlanCode;
            $(function () {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();

                //#region 分頁初始化
                fnPaginationInit($$("##divPagination"));


                //
                tmpddltsbPlanCode = $("#ddltsbPlanCode").kendoMultiSelect({
                    autoClose: false
                }).data("kendoMultiSelect");


              
            });

            $("#btnExport").click(function () {

                $("#txtPlanCode").val(tmpddltsbPlanCode.value());

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
