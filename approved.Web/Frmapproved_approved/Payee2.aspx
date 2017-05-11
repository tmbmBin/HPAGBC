<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payee2.aspx.cs" Inherits="approved.Web.Frmapproved_approved.Payee2" %>

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

    <style type="text/css">
        #bg {
            height: 3000px;
        }

        #advertisement {
            display: none;
            position: absolute;
        }

            #advertisement img {
                border: none;
            }

        #close_ad {
            display: block;
        }
    </style>

</head>

<body>
    <form id="form1" runat="server">
        <div>
             <div id="advertisement" style="border:1px;text-align:center">
                    <asp:Button ID="btnReturnSelectData" runat="server" Text="傳回選定資料" OnClick="btnReturnSelectData_Click" class="Btn02" />
                    <asp:Button ID="btnGVselectAdd" runat="server" Text="新增" OnClick="btnGVselectAdd_Click" />
                    <asp:Button ID="btnRemove" runat="server" Text="移除" OnClick="btnRemove_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="清空" OnClick="btnClear_Click"/>
                    <input id="hide_LSB" type="button" value="隱藏" />
                    <input id="Show_LSB" type="button" value="顯示" />
                    <div id="DIV_LSB">
                    <asp:ListBox ID="LSBPayeeItem" runat="server" Height="300px" Width="300px" SelectionMode="Multiple"></asp:ListBox><br />
                    </div>
                </div>


                 <asp:TextBox ID="txtReturnData" runat="server" Height="150px" Width="100%" Style="display: none"></asp:TextBox>

            <asp:TextBox ID="txtMessage" runat="server" Style="display: none"></asp:TextBox>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3" Width="90%">
                <h1 class="h1Class">受款人查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">統一編號</td>
                        <td class="qury_table_td2" colspan="3">
                              <asp:TextBox ID="txttsbPayeeNo" runat="server" Width="90%">
                             </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbPayeeName" runat="server" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">類別</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbPayeeRole" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td class="qury_table_td">縣市</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlCity" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">群組名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPayeeGroupName" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 2px;">
                <asp:Button ID="btnSearch" runat="server" Text="開始過濾" class="Btn08" OnClick="btnSearch_Click" />
                <asp:Button ID="btnSearch2" runat="server" Text="Button" OnClick="btnSearch2_Click" Style="display: none;" />
            </div>
            <br />
            <div class="MainCon2" style="width: 90%">
                <h1 class="h1Class">受款人查詢結果</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                    CssClass="GridViewStyle" Width="100%" OnRowDataBound="GridView1_RowDataBound">
                    <FooterStyle CssClass="GridViewFooterStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                    <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False" HeaderText="選取">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkHeaderselect" runat="server" onclick="checkAll(this);" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="25" />
                            <ItemStyle HorizontalAlign="Center" Width="25" />
                        </asp:TemplateField>
                        <%-- ↓↓開始資料行↓↓ --%>
                        <%--                        <asp:TemplateField HeaderText="年度" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblAtsbYear" runat="server" Text='<%# Eval("AtsbYear") %>' Style="display: none;"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="統一編號" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblAtsbPayeeNo" runat="server" Text='<%# Eval("AtsbPayeeNo") %>'></asp:Label>
                                <asp:TextBox ID="txtAtsbPayeeNo" runat="server" Text='<%# Eval("AtsbPayeeNo") %>' Style="display: none;"></asp:TextBox>
                                <asp:TextBox ID="txtAtsbPayeeKind" runat="server" Text='<%# Eval("AtsbPayeeKind") %>' Style="display: none;"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="名稱" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblAtsbPayeeName" runat="server" Text='<%# Eval("AtsbPayeeName") %>'></asp:Label>
                                <asp:TextBox ID="txtAtsbPayeeName" runat="server" Text='<%# Eval("AtsbPayeeName") %>' Style="display: none;"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="200" />
                            <ItemStyle HorizontalAlign="Center" Width="200" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="縣市" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblGtsbCityName" runat="server" Text='<%# Eval("GtsbCityName")  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="55" />
                            <ItemStyle HorizontalAlign="Center" Width="55" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="鄉鎮市區" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblFtsbCityAreaName" runat="server" Text='<%# Eval("FtsbCityAreaName")  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="身分別" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblEtsbPayeeRoleName" runat="server" Text='<%# Eval("EtsbPayeeRoleName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="屬性" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblDtsbPayeePropertyName" runat="server" Text='<%# Eval("DtsbPayeePropertyName")  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>

                        <%-- ↑↑開始資料行↑↑ --%>
                    </Columns>
                    <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                </asp:GridView>
                <br style="clear: both;" />
                <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
                <br style="clear: both;" />
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


        <script type="text/javascript">
            $(function () {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();


                //#region 分頁初始化
                //MyLibraryJs.JqPluginExt.fnPaginationInit($$("##divPagination"));
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
                        num_edge_entries: 1//,
                    };
                    var settings = $.extend(defaults, options);


                    $jq.pagination(ItemsCount, settings);


                    //依狀態啟用停用頁碼連結
                    if ($jq.is("[disabled]")) {
                        $jq.find("a").attr("disabled", "disabled")
                            //.attr("href", "")
                            .removeAttr("href")
                            .css("cursor", "default")
                            .click(function (e) {
                                e.stopPropagation();
                            })
                        ;
                    }
                }
                //#endregion


                //#region $("#btnNew").click
                $("#btnNew").click(function () {
                    var menuID = $("#hdfMenuID").val();
                    var src = "Modify.aspx?menuID=" + menuID + "&formStatus=New";
                    MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                        {
                            title: "新增資料",
                            width: 1050,
                            height: 750
                        });
                });
                //#endregion


                //#region $("#btnEdit").click
                $("#btnEdit").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbYear = selectedTr.prop("title").split("_")[0];
                        var tsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var tsbDecideNo = selectedTr.prop("title").split("_")[2];

                        var keys = { tsbYear: tsbYear, tsbApplyNo: tsbApplyNo, tsbDecideNo: tsbDecideNo };

                        var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=Edit"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "修改資料",
                                width: 1050,
                                height: 750
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion


                //#region $("#btnView").click
                $("#btnView").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbYear = selectedTr.prop("title").split("_")[0];
                        var tsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var keys = { tsbYear: tsbYear, tsbApplyNo: tsbApplyNo };

                        var src = "Modify.aspx?menuID=" + menuID + "&formStatus=View"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "檢視/刪除資料",
                                width: 1050,
                                height: 750
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion

            });


            function Searchbtnclick() {
                var btn = $("#<%= btnSearch2.ClientID %>");
                btn.click();
            }

            function checkAll(header) {
                $('#<%= GridView1.ClientID %> input[type=checkbox]').prop("checked", header.checked);
            }

            //
            $(document).ready(function () {
                var $window = $(window), //視窗物件
                    $ad = $('#advertisement').css('opacity', 0).show(), //讓物件透明，並顯示出來，目地是一開始移動到定位時使用者看不到
                    width = $ad.width(), //取得advertisement寬度
                    height = $ad.height(), //取得advertisement長度
                    diffX = 10, //廣告與右方邊距
                    diffY = 50, //廣告與下方邊距
                    speed = 200; //移動速度，花多少ms完成移動，越小越快

                //先將廣告移到定點
                $ad.css({
                    top: $(document).height(), //移到最下面
                    left: $window.width() - width - diffX, //移到右邊定點
                    opacity: 1 //解除透明
                });

                //加上scroll和resize事件
                $window.on("scroll resize", function () {
                    //控制廣告移動
                    $ad.stop().animate({
                        top: $(this).scrollTop() + $(this).height() - height - diffY,
                        left: $(this).scrollLeft() + $(this).width() - width - diffX
                    }, speed);
                }).scroll();//啟動scroll

                //關閉
                $('#hide_LSB').click(function () {
                    //$('#advertisement').hide();
                    $('#DIV_LSB').hide();
                });
                $('#Show_LSB').click(function () {
                    //$('#advertisement').hide();
                    $('#DIV_LSB').show();
                });


            });




        </script>
    </form>
</body>

</html>
