<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="UI.Authorized.Web.FrmPayAuth.Modify" EnableEventValidation="true" %>

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
            <h1 class="h1Class">繳回資料編輯作業</h1>
            <asp:FormView ID="FormView1" Style="width: 100%;" runat="server">
                <ItemTemplate>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td">會簽編號</td>
                            <td class="qury_table_td2">
                                <asp:TextBox ID="txttsbApplyNo" runat="server" Text='<%# Eval("tsbApplyNo") %>' Enabled="false" Style="display: none"></asp:TextBox>
                                <asp:TextBox ID="txttsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") %>' CssClass="Width40p"></asp:TextBox>
                            </td>
                            <td class="qury_table_td">
                                <asp:Label ID="labtsbFeeName" runat="server" Text='預撥餘額'></asp:Label>
                            </td>
                            <td class="qury_table_td2">
                                <asp:TextBox ID="txttsbMoney" runat="server" Text='<%# Eval("tsbFee").ToMoney() %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">分項計畫名稱</td>
                            <td colspan="5" class="qury_table_td2">
                                <asp:TextBox ID="txttsbPlanCode" runat="server" Text='<%# Eval("tsbPlanName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">用途別</td>
                            <td colspan="5" class="qury_table_td2">
                                <asp:TextBox ID="txttsbOutlayCode" runat="server" Text='<%# Eval("tsbOutlayName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">用途說明</td>
                            <td colspan="5" class="qury_table_td2">
                                <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">受款人</td>
                            <td colspan="5" class="qury_table_td2">
                                <asp:TextBox ID="txttsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </div>
        <br />
        <div runat="server" id="editDiv">
            <div id="tabETitle" class="editTitle">
                編 輯 區
            </div>
            <table style="width: 100%;" border="1">
                <tr>
                    <td class="DtleditTd"><span style="color: Red;">＊</span>繳回金額</td>
                    <td class="DtleditTd"><span style="color: Red;">＊</span>繳回日期</td>
                </tr>
                <tr>
                    <td style="width: 500px;">
                        <asp:TextBox ID="txttsbReceiveMoney" runat="server" Width="98%" OnKeyPress="checkNumber()"></asp:TextBox>
                        <asp:TextBox ID="txttsbReceiveSeq" runat="server" Width="98%" Style="display: none;"></asp:TextBox>
                    </td>
                    <td style="width: 500px;">
                        <asp:TextBox ID="txttsbReceiveDate" runat="server" Width="98%" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        <asp:TextBox ID="txttsbDecideSeq" runat="server" Style="display: none;"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div style="text-align: center;">
                <asp:Button ID="btnAddDtl" runat="server" Text="增加明細" CssClass="Btn12" OnClick="btnAddDtl_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnModifyDtl" runat="server" Text="確認修改" CssClass="Btn12" OnClick="btnModifyDtl_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDeleteDtl" runat="server" Text="刪除明細" CssClass="Btn12" OnClick="btnDeleteDtl_Click" />
            </div>
        </div>
        <br />
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
                    <%-- ↓↓開始資料行↓↓ --%>
                    <asp:TemplateField HeaderText="繳回明細號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbReceiveSeq" runat="server" Text='<%# Eval("tsbReceiveSeq") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="300" />
                        <ItemStyle HorizontalAlign="Center" Width="300" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="繳回金額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbReceiveMoney" runat="server" Text='<%# Eval("tsbReceiveMoney").ToMoney() %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="900" />
                        <ItemStyle HorizontalAlign="Right" Width="900" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="繳回日期" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbReceiveDate" runat="server" Text='<%# Eval("tsbReceiveDate").ToRocDate() %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="300" />
                        <ItemStyle HorizontalAlign="Center" Width="300" />
                    </asp:TemplateField>
                    <%-- ↑↑開始資料行↑↑ --%>
                </Columns>
                <EmptyDataTemplate>目前沒有資料！</EmptyDataTemplate>
            </asp:GridView>
            <br style="clear: both;" />
            <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
            <br style="clear: both;" />
        </div>
        <!----------------->
        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" class="Btn04" OnClick="btnDel_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" class="Btn04" />
        </asp:Panel>

        <script type="text/javascript">

            $(function () {
                fnPageInit();
                getSelectDtlData();//點選gv的tr
            });

            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.closeDlg();
                return false;
            });
            //#endregion


            //#region $("#btnDelete").click
            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
                    return true;
                }
                return false;
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

            // 檢查輸入是否為數字。
            function checkNumber() {
                if (((event.keyCode >= 48) && (event.keyCode <= 57)) || (event.keyCode == 46))
                    event.returnValue = true;
                else event.returnValue = false;
            }

            // 頁面初始化
            function fnPageInit() {

                // 使用套件
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

            // GridView 用途別顏色更改及取值
            function getSelectDtlData() {
                $('#GridView1 tr').click(function () {

                    if ($(this).find("td:eq(0)").text() != "目前沒有資料！") {
                        $.blockUI({ message: '<h1>讀取中，請耐心等候...</h1>' });

                        // 改變顏色
                        $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {
                            $(this).css({ "background-color": "white" });
                        });

                        var tmpIndex = $.trim($(this).find("td:first").text());
                        if (parseInt(tmpIndex, 10) > 0) {
                            $(this).css({ "background-color": "yellow" });
                        }
                        // 抓去 GridView 的該筆資料
                        var tmptsbReceiveSeq = $(this).find("td:eq(0)").text();
                        var tmptsbReceiveMoney = $.trim($(this).find("td:eq(1)").text());
                        var tmptsbReceiveDate = $(this).find("td:eq(2)").text();

                        // 將資料放入編輯區
                        $('#txttsbReceiveSeq').val($.trim(tmptsbReceiveSeq));
                        $('#txttsbReceiveMoney').val($.trim(tmptsbReceiveMoney));
                        $('#txttsbReceiveDate').val($.trim(tmptsbReceiveDate));

                        $.unblockUI();
                    }
                });
            }

        </script>
    </form>
</body>
</html>
