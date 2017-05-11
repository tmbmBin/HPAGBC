<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="tsbficSubisdyParaT.Web.FrmtsbficSubisdyParaT_tsbficSubisdyPara.Modify" EnableEventValidation="true" %>

<%@ Import Namespace="System.Web.Optimization" %>

<%--20150701 [Add]:附加檔案功能--%>
<%@ Register Assembly="Sys.FileUploadManager" Namespace="Sys.FileUploadManager.ServerControl" TagPrefix="TM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <script type="text/javascript" src="../../Scripts/jquery-1.11.1-fix.js"></script>
</head>

<%-- Style專區 --%>
<%: Styles.Render("~/Content/basic") %>
<%: Styles.Render("~/Content/jqueryui") %>
<%: Styles.Render("~/Content/jqueryval") %>
<%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
<% if (false)
   { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
<% if (false)
   { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
<% if (false)
   { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
<%-- JavaScript專區 --%>
<%: Scripts.Render("~/bundles/basic") %>
<%: Scripts.Render("~/bundles/jqueryui") %>
<%: Scripts.Render("~/bundles/jqueryval") %>
<%: Scripts.Render("~/bundles/kendo") %>
<%: Scripts.Render("~/bundles/jquery.MyKendo") %>
<%: Scripts.Render("~/bundles/MyLibraryJs") %>
<%: Scripts.Render("~/bundles/jquery.pagination") %>
<%: Scripts.Render("~/bundles/URI") %>

<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="h1Class">補捐助參數勾選設定</h1>
            <asp:FormView ID="FormView1" Style="width: 100%;" runat="server">
                <ItemTemplate>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td1">會計年度</td>
                            <td class="qury_table_td5">
                                <asp:TextBox ID="txtaccYear" Width="100px" runat="server" Text='<%# Eval("tsbYear") %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td1">動支年度</td>
                            <td class="qury_table_td5">
                                <asp:TextBox ID="txttsbYear" Width="100px" runat="server" Text='<%# Eval("tsbYear") %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td1">動支編號</td>
                            <td class="qury_table_td5">
                                <asp:TextBox ID="txttsbApplyWordNum" Width="120px" runat="server" Text='<%# Eval("tsbApplyWordNum") %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td1">動支子案號</td>
                            <td class="qury_table_td2">
                                <asp:TextBox ID="txttsbDecideSeq" Width="80px" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:CheckBox ID="chktsbPassFlag" Text="會計審核" runat="server"></asp:CheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td1">受補助單位</td>
                            <td colspan="9" class="qury_table_td2">
                                <asp:TextBox ID="txttsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td1">補捐助計畫</td>
                            <td colspan="9" class="qury_table_td2">
                                <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td1">預算科目</td>
                            <td colspan="9" class="qury_table_td2">
                                <asp:TextBox ID="txttsbPlanCode" runat="server" Text='<%# Eval("tsbPlanName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <div runat="server" id="editDiv">
                <table style="width: 100%; background-color: white;" border="1">
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">核定金額</td>
                        <td class="qury_table_td4">
                            <asp:TextBox ID="txtContractMoney" runat="server"></asp:TextBox>
                        </td>
                        <td class="qury_table_td" style="background-color: #CCFFCC; display: none;">核定日期</td>
                        <td class="qury_table_td4" style="display: none">
                            <asp:TextBox ID="txtContractDate" runat="server" Width="140px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">是否納入受補助單位預算</td>
                        <td class="qury_table_td4">
                            <asp:RadioButtonList ID="rdbisBgt" runat="server" Width="150px" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">計畫執行情形</td>
                        <td class="qury_table_td4">
                            <asp:RadioButtonList ID="rdbisFinish" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1" Selected="True">已完成</asp:ListItem>
                                <asp:ListItem Value="0">未完成</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <%--用不到，暫時隱藏起來--%>
                    <tr style="display: none">
                        <td class="qury_table_td" style="background-color: #CCFFCC;">就地審計</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:RadioButtonList ID="rdbinspect" runat="server" RepeatDirection="Horizontal" Width="650px">
                                <asp:ListItem Value="0">一般(非就地審計)</asp:ListItem>
                                <asp:ListItem Value="1">就地審計(不納入地方政府預算)</asp:ListItem>
                                <asp:ListItem Value="2">納入地方政府預算</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <%-------------------------%>
                </table>
            </div>
            <br />
            <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
                <asp:Button ID="btnDelete" runat="server" Text="刪除" CssClass="Btn04" OnClick="btnDel_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnClose" runat="server" Text="關閉" class="Btn04" />
                &nbsp;&nbsp;
                <input type="button" id="btnMemo" value="備註維護" class="Btn04" style="display: none" />
            </asp:Panel>
            <br />
        </div>

        <script type="text/javascript">

            $(function () {
                fnPageInit();
            });

            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href + encodeURI('&WIN=0');
                return false;
            });
            //#endregion

            //#region $("#btnDelete").click
            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    return true;
                }
                return false;
            });
            //#endregion

            //#region 備註維護
            $("#btnMemo").click(function () {
                var src = "../../tsbMemoT.Web/FrmtsbMemoT_tsbMemo/Default.aspx?menuID=1712&mod=9&type=1";
                MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                    {
                        title: "備註維護",
                        width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                        height: document.documentElement.offsetHeight * 0.85
                    });

            });
            //#endregion


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

            // 頁面初始化
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
            }

        </script>
    </form>
</body>
</html>
