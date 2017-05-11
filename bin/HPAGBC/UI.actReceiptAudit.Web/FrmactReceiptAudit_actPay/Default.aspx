<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.actReceiptAudit.Web.FrmactReceiptAudit_actPay.Default" %>

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
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <%-- <asp:ObjectDataSource ID="ODS_codDepartName" runat="server" TypeName="ShareTable.DAO.codDepartNameDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount" OnSelecting="ODS_codDepartName_Selecting"></asp:ObjectDataSource>--%>
           
              <asp:HiddenField ID="HidacmKidNumOption" runat="server" />
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">審定作業資料查詢</h1>
                <table style="width: 100%">
                    <%--<tr>
                        <td class="qury_table_td">日期區間</td>
                        <td class="qury_table_td2" colspan="3">&nbsp;&nbsp;至&nbsp;&nbsp;
                               <asp:TextBox ID="txttsbDecideDate" runat="server" Width="200px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="qury_table_td">會簽編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtacmWordNum" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td"></td>
                      <%--  <td class="qury_table_td">申請單位</td>--%>
                        <td class="qury_table_td2">
                           <%-- <asp:DropDownList ID="ddlacmWorkUnitNo" runat="server" >
                                <asp:ListItem Value="">.............</asp:ListItem>
                            </asp:DropDownList>--%>
                        </td>
                    </tr>
                   <%-- <tr>
                        <td class="qury_table_td">申請人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbWorkUserNo" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">審計種類</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbKind" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="1" Selected="True">實支審計</asp:ListItem>
                                <asp:ListItem Value="2">預撥審計</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>--%>
                   <%-- <tr>
                        <td class="qury_table_td">分項計畫名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="70%">
                            </asp:DropDownList>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="qury_table_td">用途說明</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtacmMemo" runat="server" Width="70%"></asp:TextBox>
                        </td>
                        
                    </tr>
                   <%-- <tr>
                        <td class="qury_table_td">受款人</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtacpPayName" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>--%>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnSearch" runat="server" Text="開始過濾" CssClass="Btn08" OnClick="btnSearch_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSearchClear" runat="server" Text="清除條件" CssClass="Btn08" OnClick="btnSearchClear_Click" />
            </div>
            <div style="text-align: center; margin: 10px;">
                <br />
                <input type="button" id="btnNew" value="新增" class="Btn02" style="display: 1none" onclick="btnClick('New', '新增資料')" />
                &nbsp;&nbsp;
                <input type="button" id="btnEdit" value="編修" class="Btn02" onclick="btnClick('Edit', '編修資料')" />
                &nbsp;&nbsp;
                <input type="button" id="btnDelete" value="刪除" class="Btn02" onclick="btnClick('Delete', '刪除資料')" />
                &nbsp;&nbsp;
                <input type="button" id="btnView" value="檢視" class="Btn02" onclick="btnClick('View', '檢視資料')" />
                &nbsp;&nbsp;
                <asp:Button ID="btnExport" runat="server" Text="匯出Excel檔" CssClass="Btn02" OnClick="btnExport_Click" style="display: none"/>
                <input id="hdfDownloadToken" type="hidden" runat="server" />
            </div>
            <div class="MainCon2">
                <h1 class="h1Class">審計作業資料明細</h1>
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
                                            Eval("acmYear") + "_" + 
                                            Eval("acmNo") + "_" + 
                                            Eval("acmNoPrv") + "_" + 
                                            Eval("acpPayYear") + "_" +
                                            //Eval("acvNo") + "_" +
                                            //Eval("acmNo1") + "_" +
                                            //Eval("acvNo1") + "_" +
                                            //Eval("acmNo2") + "_" +
                                            //Eval("acvNo2") + "_" +
                                            //Eval("acvSubNo") + "_" +
                                            //Eval("acpPayNo1") + "_" +
                                            Eval("acpPayNoPrv") %>">選取</a>
                                        <%-- ↑↑　需與下方 JavaScript 區的參數對應  End 　↑↑--%>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="35" />
                                    <ItemStyle HorizontalAlign="Center" Width="35" />
                                </asp:TemplateField>
                                <%-- ↓↓開始資料行↓↓ --%>
                                <asp:TemplateField HeaderText="會簽編號" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblacmWordNum" runat="server" Text='<%# Eval("acmWordNum") +"<br/>"+ Eval("acmTopWordNum") %>' ToolTip='<%# Eval("acmNo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="55" />
                                    <ItemStyle HorizontalAlign="Center" Width="55" />
                                </asp:TemplateField>


                              <%--     <asp:TemplateField HeaderText="資料類別" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDataType" runat="server" Text='<%# Eval("DataType") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="55" />
                                    <ItemStyle HorizontalAlign="Center" Width="55" />
                                </asp:TemplateField>--%>


                             <%--   <asp:TemplateField HeaderText="核定明細號" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="45" />
                                    <ItemStyle HorizontalAlign="Center" Width="45" />
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="報支號" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblacpPayNoPrv" runat="server" Text='<%# Eval("acpPayNoPrv") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="50" />
                                    <ItemStyle HorizontalAlign="Center" Width="50" />
                                </asp:TemplateField>
                               <%-- <asp:TemplateField HeaderText="受款人" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblacpPayName" runat="server" Text='<%# Eval("acpPayName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="150" />
                                    <ItemStyle HorizontalAlign="Center" Width="150" />
                                </asp:TemplateField>--%>
                           <%--     <asp:TemplateField HeaderText="分項計畫" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblacvPlanCode" runat="server" Text='<%# Eval("acvPlanName")  %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="200" />
                                    <ItemStyle HorizontalAlign="Center" Width="200" />
                                </asp:TemplateField>--%>
                               <%-- <asp:TemplateField HeaderText="用途別" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblacvOutlayCode" runat="server" Text='<%# Eval("acvOutlayName")  %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="120" />
                                    <ItemStyle HorizontalAlign="Center" Width="120" />
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="用途說明" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblacmMemo" runat="server" Text='<%# Eval("acmMemo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="200" />
                                    <ItemStyle HorizontalAlign="Center" Width="200" />
                                </asp:TemplateField>
                            <%--    <asp:TemplateField HeaderText="報支(轉正)金額" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblacvMoney" runat="server" Text='<%# Eval("acvMoney").ToMoney() %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="70" />
                                    <ItemStyle HorizontalAlign="Center" Width="70" />
                                </asp:TemplateField>--%>
                                <%--<asp:TemplateField HeaderText="繳回總額" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltsbReceiveMoney" runat="server" Text='<%#  Eval("tsbReceiveMoney").ToMoney() %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="70" />
                                    <ItemStyle HorizontalAlign="Center" Width="70" />
                                </asp:TemplateField>--%>
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

            <%-- ↓↓頁面重整專用↓↓ --%>
            <asp:Button runat="server" ID="btnPage" Style="display: none;" OnClick="btnPage_Click" />
        </div>

        <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.cookie/jquery.cookie.js")%>" type="text/javascript"></script>

        <script type="text/javascript">
            $(function () {

                // 使用套件
                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();

                // 設定計畫禁止點選。
                //setPlanCode();

                //#region 選取按鈕字樣變更(無需變動)
                $(document).on("click", "a[name='aSelect']", function () {
                    var idx = $(this).attr("tabindex");
                    $("a[name='aSelect']").text("選取");
                    $(this).text("V");
                    $("#hdfSelectedIndex").val(idx);
                });
                upCallBack();
                //#endregion

                $("#btnExport").click(function () {
                    MyLibraryJs.JqPluginExt.fnBlockUIForDownload($("[id$='hdfDownloadToken']"), "hdfDownloadToken", "資料產生中...");
                });
            });

            //#region 頁面跳轉相關(無需變動)
            function upCallBack() {
                initPagination($("#divPagination"));
                if (1 < $("#GridView1 tr").length) {
                    var idx = parseInt($("#hdfSelectedIndex").val(), 10);
                    $("#GridView1 tr").eq(idx).find("a[name='aSelect']").text("V");
                }
            }
            function closeDlg() {
                MyLibraryJs.JqPluginExt.fnKendoWindowClose();
            }
            //#endregion

            //#region 分頁切換(無需變動)
            function initPagination(obj, options) {
                var PageIndex = parseInt($("#hdfPageIndex").val(), 10);
                var PageSize = parseInt($("#hdfPageSize").val(), 10);
                var ItemsCount = parseInt($("#hdfItemsCount").val(), 10);

                var link_to = "javascript:void(0)";
                var defaults = {
                    callback: function (new_page_index, pagination_container) {
                        $("#hdfPageIndex").val(new_page_index);
                        $("#hdfSelectedIndex").val("1");
                        $('#btnPage').trigger('click');
                        return false;
                    },
                    current_page: PageIndex,
                    items_per_page: PageSize,
                    link_to: link_to,
                    next_text: "下一頁",
                    prev_text: "上一頁",
                    num_edge_entries: 1
                };
                var settings = $.extend(defaults, options);
                obj.pagination(ItemsCount, settings);
            }
            //#endregion

            //#region 按鈕事件(無需變動)
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
                var acpPayNoPrv = sa[4];

                var n = 0;
                var keys = {
                    "acmYear":parseInt(sa[n++], 10),
                    "acmNo": parseInt(sa[n++], 10),
                    "acmNoPrv": parseInt(sa[n++], 10),
                    "acpPayYear": parseInt(sa[n++], 10),
                    "acpPayNoPrv": parseInt(sa[n++], 10)
                    //"acvNo": parseInt(sa[n++], 10),
                    //"acmNo1": parseInt(sa[n++], 10),
                    //"acvNo1": parseInt(sa[n++], 10),
                    //"acmNo2": parseInt(sa[n++], 10),
                    //"acvNo2": parseInt(sa[n++], 10),
                    //"acvSubNo": parseInt(sa[n++], 10),
                    //"acpPayNo1": parseInt(sa[n++], 10),
                    //"acvSubNo1": parseInt(sa[n++], 10)
                };
                //alert(keys);
                var menuID = $("#hdfMenuID").val();
                var acmKidNumOption = $("#HidacmKidNumOption").val();//一般或委辦補助
                

                var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=" + status + "&acmKidNumOption=" + acmKidNumOption
                    + "&Keys=" + encodeURIComponent(JSON.stringify(keys));

        
            
                //alert(acpPayNoPrv);
                if (acpPayNoPrv == "0" &&  status !="New") {
                    alert("請先新增一筆資料")
                    return;
                }

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
                //#endregion


                //#region 分項計畫_部分選項禁止點選
                function setPlanCode() {
                
                 
                }
                //#endregion

        </script>
    </form>
</body>
</html>
