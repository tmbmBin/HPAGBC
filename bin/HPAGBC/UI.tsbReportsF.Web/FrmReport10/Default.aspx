<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.tsbReportsF.Web.FrmReport10.Default" %>

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
                <h1 class="h1Class">捐助團體、個人情形季報表(上網公告)</h1>
                <table style="width: 100%;">
                    <tr>
                        <td class="qury_table_td">季別</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlSeasonType" runat="server" AppendDataBoundItems="True">
                            </asp:DropDownList>
                        </td>
                        <td class="qury_table_td">核准/過帳日期</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlisExchNo" runat="server">
                                <asp:ListItem Value="0">核准日期</asp:ListItem>
                                <asp:ListItem Value="1">過帳日期</asp:ListItem>
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
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnExport" runat="server" Text="匯出Excel檔" class="Btn02" OnClick="btnExport_Click" />
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

            });

            $("#btnExport").click(function () {
                MyLibraryJs.JqPluginExt.fnBlockUIForDownload($("[id$='hdfDownloadToken']"), "hdfDownloadToken", "資料產生中...");
            });

        </script>

    </form>
</body>
</html>
