<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.tsbReports.Web.FrmtsbReport16.Default" %>

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
                <h1 class="h1Class">委託辦理計畫(事項)經費明細表</h1>
                <table style="width: 100%;">



                     <tr>
                        <td class="qury_table_td">年度</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddlYear" runat="server" Width="650px">
                            </asp:DropDownList>
                        </td>
                    </tr>

                     <tr>
                        <td class="qury_table_td">執行單位</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddlcodDepartName" runat="server" style="width:500px;"  DataTextField="Text"  DataValueField="Value">
                            </asp:DropDownList>
                        </td>
                    </tr>



                    <tr>
                        <td class="auto-style1">日期區間</td>
                        <td class="auto-style2" colspan="3">
                        <asp:TextBox ID="txtDateStart" runat="server" Width="150px" MyKendoDatePicker="MyKendoDatePicker" onfocus="blur()"></asp:TextBox>
                        <asp:Label ID="lblMonth" runat="server" Text="至" Height="25"></asp:Label>
                        <asp:TextBox ID="txtDateEnd" runat="server" Width="150px"  MyKendoDatePicker="MyKendoDatePicker" onfocus="blur()"></asp:TextBox>
                             
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
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server"  style="width:500px;" DataTextField="Text"  DataValueField="Value">
                            </asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                        <td class="qury_table_td">用途別科目</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddlOutlayCode" runat="server"  style="width:500px;" DataTextField="Text"  DataValueField="Value">
                            </asp:DropDownList>
                        </td>
                    </tr>

                     <tr>
                        <td class="qury_table_td">接受委託單位或個人名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbPayeeName" runat="server" Width="450px"></asp:TextBox>
                        </td>
                    </tr>

                     <tr>
                        <td class="qury_table_td">委託辦理事項</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="450px"></asp:TextBox>
                        </td>
                    </tr>

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
