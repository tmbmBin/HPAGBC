<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NameSpace.Web.Default" %>--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbApplyDtlT.Web.FrmtsbApplyDtlT_tsbApplyDtl.Default" %>
<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <%: Styles.Render("~/Content/jquery.pagination") %>
    <% if(false){ %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if(false){ %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if(false){ %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>

<%--
<link href="../../Content/base.css" rel="stylesheet"/>
<link href="../../Content/layout.css" rel="stylesheet"/>
<link href="../../Content/MultiViewTabs.css" rel="stylesheet"/>
<link href="../../Content/kendo/2014.1.416/kendo.common.core.min.css" rel="stylesheet"/>
<link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.min.css" rel="stylesheet"/>
<link href="../../Scripts/jquery.pagination/pagination-fix.css" rel="stylesheet"/>
--%>

</head>
<body>
     <form id="form1" runat="server">
    <div>
        <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
            <h1>
                <asp:Label ID="Label1" text="[自行填值]查詢" runat="server" />
            </h1>    
            <table style="width: 100%"> 
                <tr><td style="text-align: right; width: 38%;">
<asp:Label ID="lblgrytsvOutlayCode_{@NeedDelete}" runat="server" Text="tsvOutlayCode"></asp:Label>
</td>
<td style="text-align: left; width: 62%;">
<asp:TextBox ID="qrytsvOutlayCode_{@NeedDelete}" runat="server" CssClass="queryStyle"></asp:TextBox>
</td>
</tr>
<tr><td style="text-align: right; width: 38%;">
<asp:Label ID="lblgrytsvBgtSourceCode_{@NeedDelete}" runat="server" Text="tsvBgtSourceCode"></asp:Label>
</td>
<td style="text-align: left; width: 62%;">
<asp:TextBox ID="qrytsvBgtSourceCode_{@NeedDelete}" runat="server" CssClass="queryStyle"></asp:TextBox>
</td>
</tr>
<tr><td style="text-align: right; width: 38%;">
<asp:Label ID="lblgrytsvAccKind_{@NeedDelete}" runat="server" Text="tsvAccKind"></asp:Label>
</td>
<td style="text-align: left; width: 62%;">
<asp:TextBox ID="qrytsvAccKind_{@NeedDelete}" runat="server" CssClass="queryStyle"></asp:TextBox>
</td>
</tr>
<tr><td style="text-align: right; width: 38%;">
<asp:Label ID="lblgrytsvBizCode_{@NeedDelete}" runat="server" Text="tsvBizCode"></asp:Label>
</td>
<td style="text-align: left; width: 62%;">
<asp:TextBox ID="qrytsvBizCode_{@NeedDelete}" runat="server" CssClass="queryStyle"></asp:TextBox>
</td>
</tr>
<tr><td style="text-align: right; width: 38%;">
<asp:Label ID="lblgrytsvMemo_{@NeedDelete}" runat="server" Text="tsvMemo"></asp:Label>
</td>
<td style="text-align: left; width: 62%;">
<asp:TextBox ID="qrytsvMemo_{@NeedDelete}" runat="server" CssClass="queryStyle"></asp:TextBox>
</td>
</tr>
<tr><td style="text-align: right; width: 38%;">
<asp:Label ID="lblgrytsbPlanCode_{@NeedDelete}" runat="server" Text="tsbPlanCode"></asp:Label>
</td>
<td style="text-align: left; width: 62%;">
<asp:TextBox ID="qrytsbPlanCode_{@NeedDelete}" runat="server" CssClass="queryStyle"></asp:TextBox>
</td>
</tr>
   
                <%--<tr>
                    <td style="text-align: right; width: 38%;">
                        <asp:Label ID="Label2" runat="server" Text="摘要"></asp:Label>
                    </td>
                    <td style="text-align: left; width: 62%;">
                        <asp:TextBox ID="qrycusContent" runat="server" CssClass="queryStyle"></asp:TextBox>
                    </td>
                </tr>     
                <tr>
                    <td style="width: 20%;height:25px;"></td>
                    <td style="text-align: right; width: 10%;">
                        <asp:Label ID="Label2" runat="server" Text="寄存證號"></asp:Label>
                    </td>
                    <td style="text-align: left; width: 20%;">
                        <asp:TextBox ID="qrycusDepositNum" runat="server" CssClass="queryStyle"></asp:TextBox>
                    </td>
                    <td style="text-align: right; width: 10%;">
                        <asp:Label ID="Label4" runat="server" Text="債證證號"></asp:Label>
                    </td>
                    <td style="text-align: left; width: 20%;">
                        <asp:TextBox ID="qrycusDebtNum" runat="server" CssClass="queryStyle"></asp:TextBox>
                    </td>
                    <td style="width: 20%;"></td>
                </tr>
                <tr>
                    <td style="width: 20%;;height:25px;"></td>
                    <td style="text-align: right; width: 10%;">
                        <asp:Label ID="Label9" runat="server" Text="摘要"></asp:Label>
                    </td>
                    <td style="text-align: left; width: 20%;">
                        <asp:TextBox ID="qrycusContent" runat="server" CssClass="queryStyle"></asp:TextBox>
                    </td>
                    <td style="text-align: right; width: 10%;">
                    </td>
                    <td style="text-align: left; width: 20%;">
                    </td>
                    <td style="width: 20%;"></td>
                </tr>                
                        --%>   
            </table>
            <div class="MainCon2">
                <asp:Button ID="btnSearch" runat="server" Text="開始過濾" CssClass="Button1" Width="180px" Height="34px" OnClick="btnSearch_Click"   />
                &nbsp;&nbsp;
                <asp:Button ID="btnSearchClear" runat="server" Text="清除條件" CssClass="Button1" Width="180px" Height="34px" OnClick="btnSearchClear_Click"  />
            </div>
        </asp:Panel>


        <asp:Panel ID="Panel1" runat="server" CssClass="MainCon6">
            <input type="button" id="btnNew" value="新增" class="Button5" />
            <input type="button" id="btnEdit" value="編修" class="Button5" />
            <input type="button" id="btnView" value="檢視/刪除" class="Button5" />
        </asp:Panel>


        <div class="MainCon2">
            <h1>
                <asp:Label ID="Label3" text="tsbApplyDtl" runat="server" />
            </h1>    
            <input type="hidden" id="hdfMenuID" runat="server" />
            <div>
                <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                    CssClass="GridViewStyle"
                    Width="100%" OnRowDataBound="GridView1_RowDataBound">
                    
                    <FooterStyle CssClass="GridViewFooterStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />   
                    <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlkSelect" runat="server">選取</asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="50" />
                            <ItemStyle HorizontalAlign="Center" Width="50" />
                        </asp:TemplateField>
                        <%-- ↓↓開始資料行↓↓ --%>
                                            <asp:TemplateField HeaderText="tsbYear" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsbYear" runat="server" Text='<%# Eval("tsbYear") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsbApplyNo" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsbApplyNo" runat="server" Text='<%# Eval("tsbApplyNo") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsbApplySeq" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsbApplySeq" runat="server" Text='<%# Eval("tsbApplySeq") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsvBgtYear" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsvBgtYear" runat="server" Text='<%# Eval("tsvBgtYear") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsvBgtMonth" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsvBgtMonth" runat="server" Text='<%# Eval("tsvBgtMonth") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsvOutlayYear" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsvOutlayYear" runat="server" Text='<%# Eval("tsvOutlayYear") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsvOutlayCode" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsvOutlayCode" runat="server" Text='<%# Eval("tsvOutlayCode") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsvBgtSourceCode" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsvBgtSourceCode" runat="server" Text='<%# Eval("tsvBgtSourceCode") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsvAccKind" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsvAccKind" runat="server" Text='<%# Eval("tsvAccKind") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsvBizCode" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsvBizCode" runat="server" Text='<%# Eval("tsvBizCode") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsvMoney" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsvMoney" runat="server" Text='<%# Eval("tsvMoney") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsvMemo" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsvMemo" runat="server" Text='<%# Eval("tsvMemo") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="tsbPlanCode" Visible="True" >
 <ItemTemplate>
 <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%# Eval("tsbPlanCode") %>'></asp:Label>
 </ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" Width="60" />
 <ItemStyle HorizontalAlign="Center" Width="60" />
 </asp:TemplateField>


                       <%--
                        <asp:TemplateField HeaderText="ProductID" Visible="false" >
                            <ItemTemplate>
                                <asp:Label ID="lblProductID" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProductName" Visible ="false">
                            <ItemTemplate>
                                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SupplierID">
                            <ItemTemplate>
                                <asp:Label ID="lblSupplierID" runat="server" Text='<%# Eval("SupplierID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CategoryID">
                            <ItemTemplate>
                                <asp:Label ID="lblCategoryID" runat="server" Text='<%# Eval("CategoryID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="QuantityPerUnit">
                            <ItemTemplate>
                                <asp:Label ID="lblQuantityPerUnit" runat="server" Text='<%# Eval("QuantityPerUnit") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UnitPrice">
                            <ItemTemplate>
                                <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="140" />
                            <ItemStyle HorizontalAlign="Center" Width="140px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UnitsInStock">
                            <ItemTemplate>
                                <asp:Label ID="lblUnitsInStock" runat="server" Text='<%# Eval("UnitsInStock") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UnitsOnOrder">
                            <ItemTemplate>
                                <asp:Label ID="lblUnitsOnOrder" runat="server" Text='<%# Eval("UnitsOnOrder") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ReorderLevel">
                            <ItemTemplate>
                                <asp:Label ID="lblReorderLevel" runat="server" Text='<%# Eval("ReorderLevel") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Discontinued">
                            <ItemTemplate>
                                <asp:Label ID="lblDiscontinued" runat="server" Text='<%# Eval("Discontinued") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:TemplateField>
                                                                              --%>          
                        <%-- ↑↑開始資料行↑↑ --%>
                    </Columns>
                    <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                </asp:GridView>
                <br style="clear:both;" />
                <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
                <br style="clear:both;" />
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


    <%--      
        <script src="../../Scripts/jquery-1.11.1-fix.js"></script>
        <script src="../../Scripts/base.js"></script>
        <script src="../../Scripts/json2.js"></script>
        <script src="../../Scripts/jquery.blockUI.js"></script>
        <script src="../../Scripts/jquery.validate.js"></script>
        <script src="../../Scripts/jquery.validate.messages_zh_TW.js"></script>
        <script src="../../Scripts/jquery.validate.inline.js"></script>
        <script src="../../Scripts/kendo/2014.1.416/kendo.ui.core-chinese.min.js"></script>
        <script src="../../Scripts/kendo/2014.1.416/cultures/kendo.culture.zh-TW-chinese.min.js"></script>
        <script src="../../Scripts/jquery.MyKendo/jquery.MyKendoAll.js"></script>
        <script src="../../Scripts/MyLibraryJs/MyLibraryJs.js"></script>
        <script src="../../Scripts/jquery.pagination/jquery.pagination.js"></script>
        <script src="../../Scripts/URI/URI.js"></script>
	--%>





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
                /// <para>（需要 jquery.pagination）</para>
                /// </summary>
                /// <param name="$jq">要放分頁的容器</param>
                /// <param name="options"></param>


                var PageIndex = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageIndex"));
                var PageSize = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageSize"));
                var ItemsCount = MyLibraryJs.StringExt.fnGetInt($jq.attr("ItemsCount"));


                //var link_to = $.jqURL.strip({ keys: 'selectedIndex' });
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
                        height: 350
                    });
            });
            //#endregion


            //#region $("#btnEdit").click
            $("#btnEdit").click(function () {
                var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                if (selectedTr.length > 0) {
                    var menuID = $("#hdfMenuID").val();

                    //var cusYear = selectedTr.prop("title").split("_")[0];
                    //var cusOrderID = selectedTr.prop("title").split("_")[1];
                    //var keys = { cusYear: cusYear, cusOrderID: cusOrderID };

                     var tsbApplyNo= selectedTr.prop("title").split("_")[0];
 var tsbYear= selectedTr.prop("title").split("_")[1];
 var tsbApplySeq= selectedTr.prop("title").split("_")[2];
 var keys = { tsbApplyNo:tsbApplyNo,tsbYear:tsbYear,tsbApplySeq:tsbApplySeq };
                    



                    //var ProductID = selectedTr.prop("title").split("_")[0];
                    //var keys = { ProductID: ProductID};



                    var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=Edit"
                        + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                    MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                        {
                            title: "修改資料",
                            width: 1050,
                            height: 350
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

                    //var cusYear = selectedTr.prop("title").split("_")[0];
                    //var cusOrderID = selectedTr.prop("title").split("_")[1];
                    //var keys = { cusYear: cusYear, cusOrderID: cusOrderID };

					 var tsbApplyNo= selectedTr.prop("title").split("_")[0];
 var tsbYear= selectedTr.prop("title").split("_")[1];
 var tsbApplySeq= selectedTr.prop("title").split("_")[2];
 var keys = { tsbApplyNo:tsbApplyNo,tsbYear:tsbYear,tsbApplySeq:tsbApplySeq };

                    var src = "Modify.aspx?menuID=" + menuID + "&formStatus=View"
                        + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                    MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                        {
                            title: "檢視/刪除資料",
                            width: 1050,
                            height: 350
                        });
                } else {
                    alert("請先選取一筆資料！");
                }
            });
            //#endregion
           
        });
    </script>
    </form>
</body>
</html>
