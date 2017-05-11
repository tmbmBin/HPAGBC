<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbOpenEstimateSettingT.Web.FrmtsbOpenEstimateSettingT_tsbOpenEstimateSetting.Default" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%-- Style專區 --%>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/jqueryui") %>
    <%: Styles.Render("~/Content/jqueryval") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <%-- JavaScript專區 --%>
    <%: Scripts.Render("~/bundles/jquery") %>
    <%: Scripts.Render("~/bundles/basic") %>
    <%: Scripts.Render("~/bundles/jqueryui") %>
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/kendo") %>
    <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
    <%: Scripts.Render("~/bundles/MyLibraryJs") %>
    <%: Scripts.Render("~/bundles/jquery.pagination") %>
    <%: Scripts.Render("~/bundles/URI") %>
</head>
<body>
    <form id="form1" runat="server">
        <div class="MainCon" style="margin: 0 auto 0 auto;">
            <h1 class="h1Class">估列開放設定</h1>
            <asp:FormView ID="FormView1" runat="server" OnDataBound="FormView1_DataBound" Width="100%">
                <ItemTemplate>
                    <table class="MainCon3">
                        <tr>
                            <td style="vertical-align: top">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <table style="width: 100%;" border="1" runat="server">
                                            <tr>
                                                <td style="text-align: right; width: 30%;">
                                                    <asp:Label ID="lbltsbMidDate" runat="server" Text="年中起止日期：" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td style="text-align: left; width: 70%;" colspan="3">
                                                    <asp:TextBox ID="txttsbMidYStart" runat="server" Text='<%# Eval("tsbMidYStart") %>' MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                                                    <asp:Label ID="lbltsbMidTo" runat="server" Text="　　至　　" ForeColor="Black"></asp:Label>
                                                    <asp:TextBox ID="txttsbMidYEnd" runat="server" Text='<%# Eval("tsbMidYEnd") %>' MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; width: 30%;">
                                                    <asp:Label ID="lbltsbLastDate" runat="server" Text="年底起止日期：" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td style="text-align: left; width: 70%;" colspan="3">
                                                    <asp:TextBox ID="txttsbLastYStart" runat="server" Text='<%# Eval("tsbLastYStart") %>' MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                                                    <asp:Label ID="lbltsbLastTo" runat="server" Text="　　至　　" ForeColor="Black"></asp:Label>
                                                    <asp:TextBox ID="txttsbLastYEnd" runat="server" Text='<%# Eval("tsbLastYEnd") %>' MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; width: 30%;">
                                                    <asp:Label ID="lblIsOpenEstimate" runat="server" Text="是否開放估列：" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td style="text-align: left; width: 20%;">
                                                    <asp:DropDownList ID="ddlIsOpenEstimate" runat="server" AppendDataBoundItems="True">
                                                        <asp:ListItem Value="1">是</asp:ListItem>
                                                        <asp:ListItem Value="0">否</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="text-align: right; width: 30%;">
                                                    <asp:Label ID="lblIsMidOrLast" runat="server" Text="期間區分：" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td style="text-align: left; width: 20%;">
                                                    <asp:DropDownList ID="ddlIsMidOrLast" runat="server" AppendDataBoundItems="True">
                                                        <asp:ListItem Value="0">年中</asp:ListItem>
                                                        <asp:ListItem Value="1">年底</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <div style="margin-top: 10px; text-align: center;">
                <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
                    <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
                </asp:Panel>
            </div>
            <br />
        </div>

        <script type="text/javascript">

            $(function () {
                fnPageInit();
            });


            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {
                    $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
                    return true;
                } else {
                    alert("驗證失敗，請檢查紅色星號的欄位是否有填！！");
                }
                return false;
            });
            //#endregion


            function fnPageInit() {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();
                $("#form1").validate({
                    onsubmit: false, ignore: ""
                });

                //預設驗證規則
                $("[datepicker='datepicker']").each(function () {
                    $(this).rules("add", {
                        date: true
                    });
                });

                $(":input").bind("focusout keyup change", function () {
                    $(this).valid();
                });

                //#endregion 基本           
            }

        </script>
    </form>
</body>
</html>
