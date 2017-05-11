<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.Authorized.Web.FrmPayAuth.Default" %>
<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>核銷審定作業</title>
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

    <script type="text/javascript" src='<%: ResolveUrl("~/ScriptFiles/public.js") %>'></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:ObjectDataSource ID="ODS_codDepartName" runat="server" TypeName="ShareTable.DAO.codDepartNameDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount"></asp:ObjectDataSource>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">繳回作業資料查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">日期區間</td>
                        <td class="qury_table_td2" colspan="3">&nbsp;&nbsp;至&nbsp;&nbsp;
                               <asp:TextBox ID="txttsbDecideDate" runat="server" Width="200px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
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
                                <asp:ListItem Value="">.............</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">申請人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbWorkUserNo" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">繳回種類</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbKind" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="1" Selected="True">預撥繳回</asp:ListItem>
                                <asp:ListItem Value="2">核銷繳回</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">分項計畫名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" style="width:500px;" DataValueField="Value" DataTextField="Text">
                            </asp:DropDownList>
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
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnSearch" runat="server" Text="開始過濾" CssClass="Btn08" OnClick="btnSearch_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSearchClear" runat="server" Text="清除條件" CssClass="Btn08" OnClick="btnSearchClear_Click" />
            </div>
            <div style="text-align: center; margin: 10px;">
                <br />
                <input type="button" id="btnEdit" value="編修" class="Btn02" onclick="btnClick('Edit', '編修資料')" />
                &nbsp;&nbsp;
                <input type="button" id="btnDelete" value="刪除" class="Btn02" onclick="btnClick('Delete', '刪除資料')" />
                &nbsp;&nbsp;
                <input type="button" id="btnView" value="檢視" class="Btn02" onclick="btnClick('View', '檢視資料')" />
            </div>
            <div class="MainCon2">
                <h1 class="h1Class">審定資料明細</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                            CssClass="GridViewStyle" Width="100%">
                            <FooterStyle CssClass="GridViewFooterStyle" />
                            <RowStyle CssClass="GridViewRowStyle" />
                            <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                            <HeaderStyle CssClass="GridViewHeaderStyle" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <%-- ↓↓　需與下方 JavaScript 區的參數對應 Start　↓↓ --%>
                                        <a name="aSelect" href="javascript:void(0);" tabindex="<%# (1 + Container.DataItemIndex).ToString() %> " title="<%#
                                            Eval("tsbYear") + "_" + 
                                            Eval("tsbApplyNo") + "_" + 
                                            Eval("tsbApplySeq") + "_" + 
                                            Eval("tsbDecideNo") + "_" +
                                            Eval("tsbDecideSeq") + "_" +
                                            Eval("tsbPrePayYear") + "_" +
                                            Eval("tsbPrePayNo") + "_" +
                                            Eval("tsbPayYear") + "_" +
                                            Eval("tsbPayNo") %>">選取</a>
                                        <%-- ↑↑　需與下方 JavaScript 區的參數對應  End 　↑↑--%>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="35" />
                                    <ItemStyle HorizontalAlign="Center" Width="35" />
                                </asp:TemplateField>
                                <%-- ↓↓開始資料行↓↓ --%>
                                <asp:TemplateField HeaderText="會簽編號" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") +"<br/>"+ Eval("tsbLastApplyWordNum") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="55" />
                                    <ItemStyle HorizontalAlign="Center" Width="55" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="核定明細號" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="45" />
                                    <ItemStyle HorizontalAlign="Center" Width="45" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="預撥號" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblViewNo" runat="server" Text='<%# Eval("ViewNo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="50" />
                                    <ItemStyle HorizontalAlign="Center" Width="50" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="受款人" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="150" />
                                    <ItemStyle HorizontalAlign="Center" Width="150" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="分項計畫" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%# Eval("tsbPlanName")  %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="200" />
                                    <ItemStyle HorizontalAlign="Center" Width="200" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="用途別" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltsbOutlayCode" runat="server" Text='<%# Eval("tsbOutlayName")  %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="120" />
                                    <ItemStyle HorizontalAlign="Center" Width="120" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="用途說明" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="200" />
                                    <ItemStyle HorizontalAlign="Center" Width="200" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="預撥餘額" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltsbMoney" runat="server" Text='<%# Eval("tsbFee").ToMoney() %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="70" />
                                    <ItemStyle HorizontalAlign="Center" Width="70" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="繳回總額" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltsbReceiveMoney" runat="server" Text='<%#  Eval("tsbReceiveMoney").ToMoney() %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="70" />
                                    <ItemStyle HorizontalAlign="Center" Width="70" />
                                </asp:TemplateField>
                                <%-- ↑↑開始資料行↑↑ --%>
                            </Columns>
                            <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                        </asp:GridView>
                        <%-- ↓↓分頁資訊專用↓↓ --%>
                        <asp:HiddenField runat="server" ID="hdfPageIndex" />
                        <asp:HiddenField runat="server" ID="hdfPageSize" />
                        <asp:HiddenField runat="server" ID="hdfItemsCount" />
                        <asp:HiddenField runat="server" ID="hdfSelectedIndex" />
                        <%-- ↑↑分頁資訊專用↑↑ --%>
                        <br style="clear: both;" />
                        <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
                        <br style="clear: both;" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnPage" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>

            <%-- ↓↓分頁選擇後重新讀取↓↓ --%>
            <asp:Button runat="server" ID="btnPage" Style="display: none;" OnClick="btnPage_Click" />
        </div>
    </form>

    <script type="text/javascript">
        $(function () {

            $.MyKendoDatePicker();
            //<%--選項--%>
            $(document).on("click", "a[name='aSelect']", function () {
                var idx = $(this).attr("tabindex");
                $("a[name='aSelect']").text("選取");
                $(this).text("V");
                $("#hdfSelectedIndex").val(idx);
            });
            upCallBack();
        });
        //<%--設定分頁--%>
        function upCallBack() {
            InitPagination($("#divPagination"));
            if (1 < $("#GridView1 tr").length) {
                var idx = parseInt($("#hdfSelectedIndex").val(), 10);
                $("#GridView1 tr").eq(idx).find("a[name='aSelect']").text("V");
            }
        }

        function btnClick(status, titleName) {
            if (1 >= $("#GridView1 tr").length)
                return;

            var selA = $("#GridView1").find("a[name='aSelect']:contains('V')");

            if (0 == selA.length) {
                alert("請選擇一筆資料！");
                return;
            }
            // 需與上方 GridView 區的參數對應（需變動參數數量及名稱）
            var sa = selA.attr("title").split('_');
            var n = 0;
            var keys = {
                "tsbYear": parseInt(sa[n++], 10),
                "tsbApplyNo": parseInt(sa[n++], 10),
                "tsbApplySeq": parseInt(sa[n++], 10),
                "tsbDecideNo": parseInt(sa[n++], 10),
                "tsbDecideSeq": parseInt(sa[n++], 10),
                "tsbPrePayYear": parseInt(sa[n++], 10),
                "tsbPrePayNo": parseInt(sa[n++], 10),
                "tsbPayYear": parseInt(sa[n++], 10),
                "tsbPayNo": parseInt(sa[n++], 10)
            };

            var menuID = $("#hdfMenuID").val();
            var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=" + status
                + "&tsbKind=" + $("#<%= ddltsbKind.ClientID %>").val()
                + "&Keys=" + encodeURIComponent(JSON.stringify(keys));

            // 彈出視窗的寬度
            var val_width = document.documentElement.offsetWidth * 0.95;
            if (val_width < 900)
                val_width = 900;

            // 彈出視窗的高度
            var val_height = document.documentElement.offsetHeight * 0.85;
            if (val_height < 650)
                val_height = 650;

            MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
            {
                title: titleName,
                width: val_width,
                height: val_height
            });
        }
    </script>
</body>
</html>
