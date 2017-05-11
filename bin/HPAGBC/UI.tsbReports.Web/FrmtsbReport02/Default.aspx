<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.tsbReports.Web.FrmtsbReport02.Default" %>

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
                <h1 class="h1Class">補、捐（獎）助其他政府機關或團體私人經費報告表</h1>
                <table style="width: 100%;">
                    <tr>
                        <td class="qury_table_td">日期區間</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtStartDate" runat="server" Width="120px" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                             <asp:Label ID="lblDate" runat="server" Text="至" Height="25"></asp:Label>
                              <asp:TextBox ID="txtEndDate" runat="server" Width="120px" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                             <asp:Label ID="lblSample" runat="server" Text="(日期範例:104/04/28) " Height="25"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">經費單位</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbBgtUnitNo" runat="server" Width="150px"  DataValueField="Value" DataTextField="Text">
                            </asp:DropDownList>
                        </td>
                        <td class="qury_table_td">動支編號</td>
                        <td class="qury_table_td2">
                           <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td class="qury_table_td">執行單位</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbMarkUnitNo" runat="server" Width="150px"  DataValueField="Value" DataTextField="Text">
                            </asp:DropDownList>
                        </td>
                        <td class="qury_table_td">承辦人員</td>
                        <td class="qury_table_td2">
                           <asp:TextBox ID="txttsbMarkUserNo" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">審核狀態</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbPassFlag" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td class="qury_table_td">金額類型</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlMoneyType" runat="server" Width="150px">
                            </asp:DropDownList>
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
                        <td class="qury_table_td">計畫名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="650px"  DataValueField="Value" DataTextField="Text">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">用途別</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbOutlayCode" runat="server" Width="650px"  DataValueField="Value" DataTextField="Text">
                            </asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                        <td class="qury_table_td">廠商名稱</td>
                        <td class="qury_table_td2" colspan="3">
                             <asp:TextBox ID="txttsbPayeeName" runat="server" Width="650px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
              <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnCover" runat="server" Text="報表封面" class="Btn02" OnClick="btnCover_Click"   />
                <asp:Button ID="btnExport" runat="server" Text="匯出至Excel" class="Btn02" OnClick="btnExport_Click"   />
                <%--20150921 [mdf]:隱藏列出附件資料--%>
                <%--   <asp:Button ID="btnShowGrid" runat="server" Text="列出附件資料" class="Btn02" OnClick="btnExport_Click"  />--%>
                <asp:Button ID="btnShowGrid" runat="server" Text="列出附件資料" class="Btn02" OnClick="btnExport_Click" Visible="false"  />
                <input id="hdfDownloadToken" type="hidden" runat="server" />
            </div>
            <div class="MainCon2">
                <input type="hidden" id="hdfMenuID" runat="server" />
                 <div>
                    <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                        CssClass="GridViewStyle" Width="100%">
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <Columns>
                             <asp:TemplateField HeaderText="附件編號">
                              <ItemTemplate>
                                 <%#GridView1.PageIndex * GridView1.PageSize + GridView1.Rows.Count + 1%>
                               </ItemTemplate>
                               <HeaderStyle Wrap="False"  />
                                 <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="會簽編號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核定明細號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="附件下載" Visible="True">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("FName")  %>' NavigateUrl='<%# Eval("Url")  %>'></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            
                        </Columns>
                        <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                    </asp:GridView>
                    <br style="clear: both;" />
                   <%-- <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>--%>
                    <br style="clear: both;" />
                </div>
            </div>
    </div>
        <%-- ↓↓其他 plugin↓↓ --%>
        <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.cookie/jquery.cookie.js")%>" type="text/javascript"></script>

         <script type="text/javascript">

            $(function () {

                $.MyKendoDatePicker();
            });

            $("#btnExport").click(function () {
                MyLibraryJs.JqPluginExt.fnBlockUIForDownload($("[id$='hdfDownloadToken']"), "hdfDownloadToken", "資料產生中...");
            });
        </script>
    </form>
</body>
</html>