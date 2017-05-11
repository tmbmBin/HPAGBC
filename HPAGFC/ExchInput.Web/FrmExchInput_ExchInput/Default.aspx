<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ExchInput.Web.FrmExchInput_ExchInput.Default" %>

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
                <h1 class="h1Class">傳票號碼資料查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td" style="width:12%">會簽編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="180px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td" style="width:12%">傳票種類</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlExchType" Width="180px" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="" Selected="True">.................</asp:ListItem>
                                <asp:ListItem Value="預撥">預撥</asp:ListItem>
                                <asp:ListItem Value="估列">估列</asp:ListItem>
                                <asp:ListItem Value="核銷(實支)">核銷(實支)</asp:ListItem>
                                <asp:ListItem Value="核銷(轉正)">核銷(轉正)</asp:ListItem>
                                <asp:ListItem Value="預撥繳回">預撥繳回</asp:ListItem>
                                <asp:ListItem Value="估列繳回">估列繳回</asp:ListItem>
                                <asp:ListItem Value="核銷繳回">核銷繳回</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="width:12%">傳票號碼</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbExchNo" runat="server" Width="180px"></asp:TextBox>
                        </td>

                        <td class="qury_table_td" style="width:12%">傳票狀態</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlExchStatus" Width="180px" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="">.................</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">未開傳票</asp:ListItem>
                                <asp:ListItem Value="1">已開傳票</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="width:12%">次號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtViewCode" runat="server" Width="180px"></asp:TextBox>
                            &nbsp;&nbsp;<span style="color: Red;">（附註：[種類號]-[繳回號]）</span>
                        </td>
                        <td class="qury_table_td" style="width:12%">拋轉批號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbEstiTranBatchNo" runat="server" Width="180px"></asp:TextBox>
                            &nbsp;&nbsp;<span style="color: Red;">（附註：估列繳回專用）</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="width:12%">受款人名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbPayeeName" runat="server" Width="600px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnSearch" runat="server" Text="開始過濾" CssClass="Btn08" OnClick="btnSearch_Click" OnClientClick="startBlockUI()" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSearchClear" runat="server" Text="清除條件" CssClass="Btn08" OnClick="btnSearchClear_Click" />
            </div>
            <div style="text-align: center; margin: 10px;">
                <br />
                <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn02" OnClick="btnSave_Click" OnClientClick="startBlockUI()" />
            </div>
            <div class="MainCon2">
                <h1 class="h1Class">
                    <table style="width: 100%; border: 0;">
                        <tr>
                            <td style="text-align: left; width: 25%">小計：<asp:Label ID="lblTotal" runat="server"></asp:Label></td>
                            <td style="text-align: center;">傳票號碼資料明細</td>
                            <td style="text-align: right; width: 25%">
                                <input id="Button1" type="button" value="套用" class="Btn09" onclick="setGridViewData()" />
                            </td>
                        </tr>
                    </table>
                </h1>
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
                            <asp:TemplateField ShowHeader="False" Visible="false">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlkSelect" runat="server">選取</asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="30" />
                                <ItemStyle HorizontalAlign="Center" Width="30" />
                            </asp:TemplateField>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="會簽編號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") + "<br/>" + (Eval("tsbLastApplyWordNum")== null ? "" : "("+Eval("tsbLastApplyWordNum")+")") %>' ToolTip='<%# Eval("tsbYear") +"-"+ Eval("tsbApplyNo") +"-"+ Eval("tsbApplySeq") +"-"+ Eval("tsbDecideNo") +"-"+ Eval("tsbDecideSeq") %>'></asp:Label>
                                    <asp:Label ID="lbltsbYear" runat="server" Text='<%# Eval("tsbYear") %>' Style="display: none;"></asp:Label>
                                    <asp:Label ID="lbltsbApplyNo" runat="server" Text='<%# Eval("tsbApplyNo") %>' Style="display: none;"></asp:Label>
                                    <asp:Label ID="lbltsbApplySeq" runat="server" Text='<%# Eval("tsbApplySeq") %>' Style="display: none;"></asp:Label>
                                    <asp:Label ID="lbltsbDecideNo" runat="server" Text='<%# Eval("tsbDecideNo") %>' Style="display: none;"></asp:Label>
                                    <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>' Style="display: none;"></asp:Label>
                                    <asp:Label ID="lblViewYear" runat="server" Text='<%# Eval("ViewYear") %>' Style="display: none;"></asp:Label>
                                    <asp:Label ID="lblViewNo" runat="server" Text='<%# Eval("ViewNo") %>' Style="display: none;"></asp:Label>
                                    <asp:Label ID="lbltsbReceiveSeq" runat="server" Text='<%# Eval("tsbReceiveSeq") %>' Style="display: none;"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="65" />
                                <ItemStyle HorizontalAlign="Center" Width="65" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="次號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblViewCode" runat="server" Text='<%# Eval("ViewCode") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="35" />
                                <ItemStyle HorizontalAlign="Center" Width="35" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用途說明" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbTrustSubsidyName" runat="server" ToolTip='<%# Eval("tsbPlanName")  %>' Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="220" />
                                <ItemStyle HorizontalAlign="Left" Width="220" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="受款人名稱" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="160px" />
                                <ItemStyle HorizontalAlign="Left" Width="160px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="傳票種類" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblExchType" runat="server" Text='<%# Eval("ExchType") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70px" />
                                <ItemStyle HorizontalAlign="Center" Width="70px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbl" runat="server" Text='<%# Eval("tsbMoney").ToMoney() %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                <ItemStyle HorizontalAlign="Center" Width="75px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="傳票號碼" Visible="True">
                                <ItemTemplate>
                                    <asp:TextBox ID="txttsbExchNo" runat="server" Text='<%# Eval("tsbExchNo") %>' Width="98%" Height="23px" Font-Size="16px"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="65px" />
                                <ItemStyle HorizontalAlign="Center" Width="65px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="製票日期" Visible="True">
                                <ItemTemplate>
                                    <asp:TextBox ID="txttsbExchMakeDate" runat="server" Text='<%# Eval("tsbExchMakeDate").ToRocDate() %>' MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="過帳日期" Visible="True">
                                <ItemTemplate>
                                    <asp:TextBox ID="txttsbExchPassDate" runat="server" Text='<%# Eval("tsbExchPassDate").ToRocDate() %>' MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                <ItemStyle HorizontalAlign="Center" Width="100px" />
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

            // 使用 Block 效果 -> 後端 button 事件要加入『取消效果』。
            function startBlockUI() {
                $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
            }

            // GridView 套用功能
            function setGridViewData() {
                // 宣告
                var txttsbExchNo = "";
                var txttsbExchMakeDate = "";
                var txttsbExchPassDate = "";
                var num = 0

                $("#<%= GridView1.ClientID%> tr").each(function () {
                    if (num > 0) {
                        // 讀取第一行的值，塞入其他行。
                        if (num == 1) {
                            txttsbExchNo = $.trim($(this).find("[id$=txttsbExchNo]").val());              // 傳票號碼
                            txttsbExchMakeDate = $.trim($(this).find("[id$=txttsbExchMakeDate]").val());  // 製票日期
                            txttsbExchPassDate = $.trim($(this).find("[id$=txttsbExchPassDate]").val());  // 過帳日期
                        }
                        else {
                            $(this).find("[id$=txttsbExchNo]").val(txttsbExchNo);
                            $(this).find("[id$=txttsbExchMakeDate]").val(txttsbExchMakeDate);
                            $(this).find("[id$=txttsbExchPassDate]").val(txttsbExchPassDate);
                        }
                    }
                    num = num + 1;
                });

            } // setGridViewData - End 


            $(function () {

                // 使用套件
                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();

                //#region 分頁初始化
                fnPaginationInit($$("##divPagination"));

                function fnPaginationInit($jq, options) {

                    var PageIndex = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageIndex"));
                    var PageSize = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageSize"));
                    var ItemsCount = MyLibraryJs.StringExt.fnGetInt($jq.attr("ItemsCount"));

                    var link_to = URI(location.href)
                        .setSearch("pageIndex", "__id__")
                        .removeSearch("selectedIndex").toString();
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
            });

        </script>
    </form>
</body>
</html>
