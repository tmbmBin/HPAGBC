<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbEstimateT.Web.FrmtsbEstimateT_tsbEstimate.Default" %>

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
            <asp:ObjectDataSource ID="ODS_codDepartName" runat="server" TypeName="ShareTable.DAO.codDepartNameDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount"></asp:ObjectDataSource>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">估列資料查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">日期區間</td>
                        <td class="qury_table_td2">&nbsp;&nbsp;至&nbsp;&nbsp;
                            <asp:TextBox ID="txttsbDecideDate" runat="server" Width="200px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">申請人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbWorkUserNo" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">會簽編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">申請單位</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbWorkUnitNo" runat="server" AppendDataBoundItems="True" DataSourceID="ODS_codDepartName" DataTextField="dptName" DataValueField="dptCode">
                                <asp:ListItem Value="">..........................</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">分項計畫名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="70%"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">用途說明</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">受款人</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbPayeeName" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">估列狀態</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPassFlag" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="">..........................</asp:ListItem>
                                <asp:ListItem Value="1">年中無資料</asp:ListItem>
                                <asp:ListItem Value="2">年底無資料</asp:ListItem>
                                <asp:ListItem Value="3">年中未審核</asp:ListItem>
                                <asp:ListItem Value="4">年中已審核</asp:ListItem>
                                <asp:ListItem Value="5">年底未審核</asp:ListItem>
                                <asp:ListItem Value="6">年底已審核</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnSearch" runat="server" Text="開始過濾" CssClass="Btn08" OnClick="btnSearch_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSearchClear" runat="server" Text="清除條件" CssClass="Btn08" OnClick="btnSearchClear_Click" />
            </div>
            <div style="text-align: center; margin: 10px;">
                <br />
                <input type="button" id="btnEdit" value="編修" class="Btn02" />
            </div>
            <div class="MainCon2">
                <h1 class="h1Class">估列資料明細</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <div>
                    <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                        CssClass="GridViewStyle" Width="100%" OnRowDataBound="GridView1_RowDataBound">
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="hlkSelect" runat="server" OnClick="hlkSelect_Click" >選取</asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="35" />
                                <ItemStyle HorizontalAlign="Center" Width="35" />
                            </asp:TemplateField>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="會簽編號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") +"<br/>"+ Eval("tsbLastApplyWordNum") %>'></asp:Label>
                                    <asp:HiddenField ID="hdftsbYear" runat="server" Value='<%# Eval("tsbYear") %>'></asp:HiddenField>
                                    <asp:HiddenField ID="hdftsbApplyNo" runat="server" Value='<%# Eval("tsbApplyNo") %>'></asp:HiddenField>
                                    <asp:HiddenField ID="hdftsbApplySeq" runat="server" Value='<%# Eval("tsbApplySeq") %>'></asp:HiddenField>
                                    <asp:HiddenField ID="hdftsbDecideNo" runat="server" Value='<%# Eval("tsbDecideNo") %>'></asp:HiddenField>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="65" />
                                <ItemStyle HorizontalAlign="Center" Width="65" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核定明細號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="40" />
                                <ItemStyle HorizontalAlign="Center" Width="40" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="受款人" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>' ToolTip='<%# Eval("tsbPayeeNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="100" />
                                <ItemStyle HorizontalAlign="Center" Width="100" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="分項計畫" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%# Eval("tsbPlanName")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="170" />
                                <ItemStyle HorizontalAlign="Center" Width="170" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用途別" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbOutlayCode" runat="server" Text='<%# Eval("tsbOutlayName")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="100" />
                                <ItemStyle HorizontalAlign="Center" Width="100" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用途說明" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="170" />
                                <ItemStyle HorizontalAlign="Center" Width="170" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核定金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoney" runat="server" Text='<%# Eval("tsbMoney").ToMoney() %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核銷金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPayMoney" runat="server" Text=""></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="估列應付總額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbEstimateMoney" runat="server" Text=""></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="100" />
                                <ItemStyle HorizontalAlign="Center" Width="100" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="審核狀態" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPassFlag" runat="server" Text=""></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="55" />
                                <ItemStyle HorizontalAlign="Center" Width="55" />
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
        </div>

        <script type="text/javascript">
            $(function () {

                // 使用套件
                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();

                // 設定計畫選單
                setPlanCode();

                //#region 分頁初始化
                fnPaginationInit($$("##divPagination"));

                function fnPaginationInit($jq, options) {

                    var PageIndex = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageIndex"));
                    var PageSize = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageSize"));
                    var ItemsCount = MyLibraryJs.StringExt.fnGetInt($jq.attr("ItemsCount"));


                    var link_to = URI(location.href)
                        .setSearch("pageIndex", "__id__")
                        .removeSearch("selectedIndex")
                        .removeSearch("WIN").toString();

                    link_to = decodeURIComponent(link_to); // 後端有編碼才需要加

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


                //#region $("#btnEdit").click
                $("#btnEdit").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbYear = selectedTr.prop("title").split("_")[0];
                        var tsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var tsbApplySeq = selectedTr.prop("title").split("_")[2];
                        var tsbDecideNo = selectedTr.prop("title").split("_")[3];
                        var tsbDecideSeq = selectedTr.prop("title").split("_")[4];
                        var tsbApplyWordNum = selectedTr.prop("title").split("_")[5];

                        var keys = {
                            tsbYear: tsbYear, tsbApplyNo: tsbApplyNo, tsbApplySeq: tsbApplySeq,
                            tsbDecideNo: tsbDecideNo, tsbDecideSeq: tsbDecideSeq,
                            tsbApplyWordNum: tsbApplyWordNum
                        };

                        // 彈出視窗的寬度
                        var val_width = document.documentElement.offsetWidth * 0.95;
                        if (val_width < 900) val_width = 900

                        // 彈出視窗的高度
                        var val_height = 300;

                        var src = "Modify2.aspx?MenuID=" + menuID + "&formStatus=Edit"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));

                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "修改資料",
                                width: val_width,
                                height: val_height
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion

            });

            //分項計畫_部分選項禁止點選
            function setPlanCode() {
                var tmpstop = "0";
                $('#<%= ddltsbPlanCode.ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
            }

        </script>
    </form>
</body>
</html>
