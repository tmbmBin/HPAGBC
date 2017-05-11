<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="tsbMHWAnnualRptFinalT.Web.FrmtsbMHWAnnualRptFinalT_tsbMHWAnnualRptFinal.Modify" EnableEventValidation="true" %>

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
    <% if (false)
       { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
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
        <div>
            <asp:ObjectDataSource ID="ODS_tsbMemo" runat="server" TypeName="ShareTable.DAO.tsbMemoDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="tsbYear" SessionField="default_Year" Type="Int16" />
                    <asp:Parameter Name="tsbType" Type="String" DefaultValue="2" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODS_tsbUnfinishCause" runat="server" TypeName="ShareTable.DAO.tsbUnfinishCauseDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount">
                <SelectParameters>
                    <asp:SessionParameter Name="tsbYear" SessionField="default_Year" Type="Int16" />
                    <asp:Parameter Name="tsbType" Type="String" DefaultValue="2" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <h1 class="h1Class">補（捐）助其他政府機關或團體私人經費報告表勾選設定</h1>
            <div runat="server" id="editDiv">
                <table style="width: 100%;" border="1">
                    <tr>
                        <td class="DtleditTd2" colspan="12">補（捐）助其他政府機關或團體私人經費報告表</td>
                    </tr>
                    <tr>
                        <td class="DtleditTd2" colspan="4" style="text-align: right">用途說明</td>
                        <td class="DtleditTd2" colspan="7" style="text-align: left">
                            <asp:Label ID="lbltsbTrustSubsidyName" runat="server"></asp:Label>
                        </td>
                        <td class="DtleditTd2">
                            <asp:CheckBox ID="chktsbPassFlag" Text="會計處審核" runat="server"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="DtleditTd2" colspan="4" style="text-align: right">受補(捐)助單位名稱</td>
                        <td class="DtleditTd2" colspan="7" style="text-align: left">
                            <asp:Label ID="labtsbPayeeName" runat="server"></asp:Label>
                        </td>
                        <td class="DtleditTd2"></td>
                    </tr>
                    <tr>
                        <td class="DtleditTd2" colspan="4" style="text-align: right">列支科目名稱</td>
                        <td class="DtleditTd2" colspan="7" style="text-align: left">
                            <asp:Label ID="labtsbOutlayCode" runat="server"></asp:Label>
                        </td>
                        <td class="DtleditTd2"></td>
                    </tr>
                    <tr>
                        <td class="DtleditTd2" colspan="2"><span style="color: Red;">＊</span>是否明定補助之條件標準</td>
                        <td class="DtleditTd2" colspan="2"><span style="color: Red;">＊</span>計畫執行情形</td>
                        <td class="DtleditTd2" colspan="2"><span style="color: Red;">＊</span>是否納入受補助單位預算</td>
                        <td class="DtleditTd2" colspan="2"><span style="color: Red;">＊</span>是否明定成果考核方式</td>
                        <td class="DtleditTd2" colspan="2"><span style="color: Red;">＊</span>對補助經費是否施以就地查核</td>
                        <td class="DtleditTd2" rowspan="2">計畫未完成原因<br />
                            <asp:Button ID="btnUnfinishCause" Cssclass="Btn11" runat="server" Text="選取" OnClick="btnUnfinishCause_Click" />
                        </td>
                        <td class="DtleditTd2" rowspan="2">備註<br />
                            <asp:Button ID="btnMemo" Cssclass="Btn11" runat="server" Text="選取" OnClick="btnMemo_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="DtleditTd2">是</td>
                        <td class="DtleditTd2">否</td>
                        <td class="DtleditTd2">已完成</td>
                        <td class="DtleditTd2">未完成</td>
                        <td class="DtleditTd2">是</td>
                        <td class="DtleditTd2">否</td>
                        <td class="DtleditTd2">是</td>
                        <td class="DtleditTd2">否</td>
                        <td class="DtleditTd2">是</td>
                        <td class="DtleditTd2">否</td>

                    </tr>
                    <tr>
                        <td style="width: 6%; text-align: center;">
                            <asp:CheckBox ID="chkisStandardY" runat="server" onclick="return CheckCB(this);" Checked="true"></asp:CheckBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:CheckBox ID="chkisStandardN" runat="server" onclick="return CheckCB(this);"></asp:CheckBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:CheckBox ID="chkisFinishY" runat="server" onclick="return CheckCB(this);" Checked="true"></asp:CheckBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:CheckBox ID="chkisFinishN" runat="server" onclick="return CheckCB(this);"></asp:CheckBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:CheckBox ID="chkisBudgetY" runat="server" onclick="return CheckCB(this);" Checked="true"></asp:CheckBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:CheckBox ID="chkisBudgetN" runat="server" onclick="return CheckCB(this);"></asp:CheckBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:CheckBox ID="chkisCheckY" runat="server" onclick="return CheckCB(this);" Checked="true"></asp:CheckBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:CheckBox ID="chkisCheckN" runat="server" onclick="return CheckCB(this);"></asp:CheckBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:CheckBox ID="chkisInspectY" runat="server" onclick="return CheckCB(this);" Checked="true"></asp:CheckBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:CheckBox ID="chkisInspectN" runat="server" onclick="return CheckCB(this);"></asp:CheckBox>
                        </td>
                        <td style="width: 20%; text-align: center; height: 80px">
                            <asp:TextBox ID="txttsbAUCauseID" runat="server" Width="100%" Height="100%" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td style="width: 20%; text-align: center; height: 80px">
                            <asp:TextBox ID="txttsbAnnualNoteID" runat="server" Width="100%" Height="100%" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
                <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
                &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" class="Btn04" />
            </asp:Panel>
            <br />
            <div runat="server" id="tsbMemoDiv" visible="false">
                <asp:Button ID="btnReturn1" runat="server" Text="傳回選定資料" CssClass="Btn03" OnClick="btnReturn1_Click" />
                <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                    CssClass="GridViewStyle" Width="100%" DataSourceID="ODS_tsbMemo">
                    <FooterStyle CssClass="GridViewFooterStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                    <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <Columns>
                        <%-- ↓↓開始資料行↓↓ --%>
                        <asp:TemplateField HeaderText="選取" Visible="True">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkNo" runat="server"></asp:CheckBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="50" />
                            <ItemStyle HorizontalAlign="Center" Width="50" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="編號" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbAliasNo" runat="server" Text='<%# Eval("tsbAliasNo") %> '></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="80" />
                            <ItemStyle HorizontalAlign="Center" Width="80" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="備註內容" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbMemoName" runat="server" Text='<%# Eval("tsbMemoName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="500" />
                            <ItemStyle HorizontalAlign="Left" Width="500" />
                        </asp:TemplateField>
                        <%-- ↑↑開始資料行↑↑ --%>
                    </Columns>
                    <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                </asp:GridView>
            </div>
            <div runat="server" id="tsbUnfinishCauseDiv" visible="false">
                <asp:Button ID="btnReturn2" runat="server" Text="傳回選定資料" CssClass="Btn03" OnClick="btnReturn2_Click" />
                <asp:GridView ID="GridView2" runat="server" MyName="gvList" AutoGenerateColumns="False"
                    CssClass="GridViewStyle" Width="100%" DataSourceID="ODS_tsbUnfinishCause">
                    <FooterStyle CssClass="GridViewFooterStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                    <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <Columns>
                        <%-- ↓↓開始資料行↓↓ --%>
                        <asp:TemplateField HeaderText="選取" Visible="True">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkNo" runat="server"></asp:CheckBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="50" />
                            <ItemStyle HorizontalAlign="Center" Width="50" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="編號" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbAliasNo" runat="server" Text='<%# Eval("tsbAliasNo") %> '></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="80" />
                            <ItemStyle HorizontalAlign="Center" Width="80" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="未完成原因" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbUfCauseName" runat="server" Text='<%# Eval("tsbUfCauseName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="500" />
                            <ItemStyle HorizontalAlign="Right" Width="500" />
                        </asp:TemplateField>
                        <%-- ↑↑開始資料行↑↑ --%>
                    </Columns>
                    <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

        <script type="text/javascript">

            $(function () {
                fnPageInit();
            });

            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href;
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

            // checkbox 單選功能
            function CheckCB(input) {
                // isStandard
                if (input.name == "chkisStandardY") {
                    document.form1.chkisStandardY.checked = true;
                    document.form1.chkisStandardN.checked = false;
                }
                if (input.name == "chkisStandardN") {
                    document.form1.chkisStandardY.checked = false;
                    document.form1.chkisStandardN.checked = true;
                }
                // isFinish
                if (input.name == "chkisFinishY") {
                    document.form1.chkisFinishY.checked = true;
                    document.form1.chkisFinishN.checked = false;
                }
                if (input.name == "chkisFinishN") {
                    document.form1.chkisFinishY.checked = false;
                    document.form1.chkisFinishN.checked = true;
                }
                // isBudget
                if (input.name == "chkisBudgetY") {
                    document.form1.chkisBudgetY.checked = true;
                    document.form1.chkisBudgetN.checked = false;
                }
                if (input.name == "chkisBudgetN") {
                    document.form1.chkisBudgetY.checked = false;
                    document.form1.chkisBudgetN.checked = true;
                }
                // isCheck
                if (input.name == "chkisCheckY") {
                    document.form1.chkisCheckY.checked = true;
                    document.form1.chkisCheckN.checked = false;
                }
                if (input.name == "chkisCheckN") {
                    document.form1.chkisCheckY.checked = false;
                    document.form1.chkisCheckN.checked = true;
                }
                // isInspect
                if (input.name == "chkisInspectY") {
                    document.form1.chkisInspectY.checked = true;
                    document.form1.chkisInspectN.checked = false;
                }
                if (input.name == "chkisInspectN") {
                    document.form1.chkisInspectY.checked = false;
                    document.form1.chkisInspectN.checked = true;
                }
            }
        </script>
    </form>
</body>
</html>
