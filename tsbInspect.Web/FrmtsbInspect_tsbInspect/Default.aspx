<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbInspect.Web.FrmtsbInspect_tsbInspect.Default" %>

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
            <asp:ObjectDataSource ID="ODS_GridView" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="get_List" TypeName="ShareTable.DAO.tsbInspectDAO" SelectCountMethod="get_ListCount">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="SearchValue" SessionField="SearchValue" Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">就地審計資料查詢</h1>
                <table style="width: 100%">
                    <tr>

                        <td class="qury_table_td1">會簽編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td1">申請單位</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbWorkUnitNo" runat="server" AppendDataBoundItems="True" DataSourceID="ODS_codDepartName" DataTextField="dptName" DataValueField="dptCode">
                                <asp:ListItem Value="">.............</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">分項計畫名稱</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="500px"></asp:DropDownList>
                        </td>
                        <td class="qury_table_td1">審計狀態</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlStatus" runat="server">
                                <asp:ListItem Value="1">已審計</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">未審計</asp:ListItem>
                                <asp:ListItem Value="">不區分</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">用途說明</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="650px"></asp:TextBox>
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
                <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn02" OnClick="btnSave_Click" OnClientClick="startBlockUI()" />
            </div>
            <div class="MainCon2">
                <h1 class="h1Class">就地審計資料明細</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <div>
                    <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                        CssClass="GridViewStyle" Width="100%" DataSourceID="ODS_GridView" EmptyDataText="目前無資料" OnRowDataBound="GridView1_RowDataBound">
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <Columns>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="會簽編號">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") %>'></asp:Label>
                                    <asp:HiddenField ID="hdftsbYear" runat="server" Value='<%# Eval("tsbYear") %>'></asp:HiddenField>
                                    <asp:HiddenField ID="hdftsbApplyNo" runat="server" Value='<%# Eval("tsbApplyNo") %>'></asp:HiddenField>
                                    <asp:HiddenField ID="hdftsbApplySeq" runat="server" Value='<%# Eval("tsbApplySeq") %>'></asp:HiddenField>
                                    <asp:HiddenField ID="hdftsbDecideNo" runat="server" Value='<%# Eval("tsbDecideNo") %>'></asp:HiddenField>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="65" />
                                <ItemStyle HorizontalAlign="Center" Width="65" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核定<br/>明細號">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="45" />
                                <ItemStyle HorizontalAlign="Center" Width="45" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="申請人">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbWorkUserNo" runat="server" Text='<%#  Eval("tsbWorkUnitName") +"<br/>"+ Eval("tsbWorkUserName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="85" />
                                <ItemStyle HorizontalAlign="Center" Width="85" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="受款人">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="125" />
                                <ItemStyle HorizontalAlign="Center" Width="125" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="分項計畫">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%# Eval("tsbPlanName")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="200" />
                                <ItemStyle HorizontalAlign="Center" Width="200" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用途別">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbOutlayCode" runat="server" Text='<%# Eval("tsbOutlayName")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="150" />
                                <ItemStyle HorizontalAlign="Center" Width="150" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用途說明">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="200" />
                                <ItemStyle HorizontalAlign="Center" Width="200" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核定金額">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoney" runat="server" Text='<%# Eval("tsbMoney").ToMoney() %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="審計部<br/>同意">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk_yes" runat="server" onclick="return CheckCB(this,'chk_yes');" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="45" />
                                <ItemStyle HorizontalAlign="Center" Width="45" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="審計部<br/>不同意">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk_no" runat="server" onclick="return CheckCB(this,'chk_no');" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="45" />
                                <ItemStyle HorizontalAlign="Center" Width="45" />
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
                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();
                setPlanCode();
            });

            // 使用 Block 效果 -> 後端 button 事件要加入『取消效果』。
            function startBlockUI() {
                $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
            }

            //分項計畫_部分選項禁止點選
            function setPlanCode() {
                var tmpstop = "0";
                $('#<%= ddltsbPlanCode.ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
            }

            // checkbox 單選功能
            function CheckCB(input, id) {

                var tmpID = input.id.replace(id, '');
                if (id == 'chk_yes')
                    tmpID = tmpID + 'chk_no';
                else if (id == 'chk_no')
                    tmpID = tmpID + 'chk_yes';

                if (input.checked == true && document.getElementById(tmpID).checked == true)
                    document.getElementById(tmpID).checked = false;
            }
        </script>

    </form>
</body>
</html>
