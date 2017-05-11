<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Travel.aspx.cs" Inherits="UI.TsbPayee.Web.Travel" %>

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
        <div>
            <asp:ObjectDataSource ID="ODS_Travel" runat="server" TypeName="ShareTable.DAO.Z_TrlDataMainDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount">
                <SelectParameters>
                    <%--(1.國內 2.國外)--%>
                    <asp:SessionParameter DefaultValue="" Name="acpTrlYear" SessionField="default_Year" Type="Int16" />
                    <asp:Parameter Name="acpTrlKind" Type="String" DefaultValue="1" />
                    <asp:ControlParameter ControlID="txtacpTrlSDate" Name="acpTrlSDate" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtacpTrlEDate" Name="acpTrlEDate" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtacpTrlEmpCode" Name="acpTrlEmpCode" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtacpTrlEmpName" Name="acpTrlEmpName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtacpTrlDepName" Name="acpTrlDepName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddlFinalFlag" Name="FinalFlag" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3" Width="90%">
                <h1 class="h1Class">出差旅費查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">出差日期</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtacpTrlSDate" runat="server" Width="120px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>～<asp:TextBox ID="txtacpTrlEDate" runat="server" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()" Width="120px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">是否結報</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlFinalFlag" runat="server">
                                <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                <asp:ListItem Value="1">是</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">員工代碼</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtacpTrlEmpCode" runat="server" Width="150px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">員工姓名</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtacpTrlEmpName" runat="server" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">部門名稱</td>
                        <td class="qury_table_td3" colspan="3">
                            <asp:TextBox ID="txtacpTrlDepName" runat="server" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td2" colspan="4" style="text-align: center">
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="開始過濾" class="Btn06" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                &nbsp;&nbsp;
                <asp:Button ID="btnReturnSelectData" runat="server" Text="傳回選定資料" OnClientClick="returnData()" class="Btn08" />
            </div>
            <br />
            <div class="MainCon2" style="width: 90%">
                <h1 class="h1Class">出差旅費查詢結果</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                    CssClass="GridViewStyle" Width="100%" DataSourceID="ODS_Travel">
                    <FooterStyle CssClass="GridViewFooterStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                    <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False" HeaderText="選取">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkHeaderselect" runat="server" onclick="checkAll(this);" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="30" />
                            <ItemStyle HorizontalAlign="Center" Width="30" />
                        </asp:TemplateField>
                        <%-- ↓↓開始資料行↓↓ --%>
                        <asp:TemplateField HeaderText="請假單號" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblacpTrlAbsenceNo" runat="server" Text='<%# Eval("acpTrlAbsenceNo") %>'></asp:Label>
                                <asp:Label ID="lblacpTrlKind" runat="server" Text='<%# Eval("acpTrlKind")  %>' Style="display: none;"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="部門名稱" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblacpTrlDepName" runat="server" Text='<%# Eval("acpTrlDepName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="員工姓名" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblacpTrlEmpMix" runat="server" Text='<%# Eval("acpTrlEmpCode") +"<br/>"+Eval("acpTrlEmpName") %>'></asp:Label>
                                <asp:Label ID="lblacpTrlEmpCode" runat="server" Text='<%# Eval("acpTrlEmpCode") %>' Style="display: none;"></asp:Label>
                                <asp:Label ID="lblacpTrlEmpName" runat="server" Text='<%# Eval("acpTrlEmpName") %>' Style="display: none;"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出差起始日" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblacpTrlSDate" runat="server" Text='<%# Eval("acpTrlSDate").ToRocDate()  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出差結束日" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblacpTrlEDate" runat="server" Text='<%# Eval("acpTrlEDate").ToRocDate() %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出差事由" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblacptrlMemo" runat="server" Text='<%# Eval("acptrlMemo")  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="250" />
                            <ItemStyle HorizontalAlign="Center" Width="250" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出差金額" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblacpTrlMoneyTot" runat="server" Text='<%# Eval("acpTrlMoneyTot").ToMoney()  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <%-- ↑↑開始資料行↑↑ --%>
                    </Columns>
                    <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>


        <script type="text/javascript">
            $(function () {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();
            });

            function checkAll(header) {
                $('#<%= GridView1.ClientID %> input[type=checkbox]').prop("checked", header.checked);
            }

            function returnData() {
                // 宣告
                var checkFlag = "";
                var tmpacpTrlAbsenceNo = "";
                var tmpacpTrlKind = "";
                var tmpacpTrlEmpName = "";
                var tmpacpTrlEmpCode = "";
                var tmpacpTrlMoneyTot = "";
                var tmpacptrlMemo = "";

                var num = "";

                $("#<%= GridView1.ClientID%> tr").each(function () {
                    checkFlag = $(this).find("[id$=chkSelect]").prop("checked");

                    if (checkFlag == true) {
                        tmpacpTrlAbsenceNo = $.trim($(this).find("[id$=lblacpTrlAbsenceNo]").text());  // 請假單號
                        tmpacpTrlKind = $.trim($(this).find("[id$=lblacpTrlKind]").text());            // 差旅種類
                        tmpacpTrlDepName = $.trim($(this).find("[id$=lblacpTrlDepName]").text());      // 員工部門
                        tmpacpTrlEmpName = $.trim($(this).find("[id$=lblacpTrlEmpName]").text());      // 員工姓名
                        tmpacpTrlEmpCode = $.trim($(this).find("[id$=lblacpTrlEmpCode]").text());      // 員工代碼
                        tmpacpTrlMoneyTot = $.trim($(this).find("[id$=lblacpTrlMoneyTot]").text());    // 出差總額
                        tmpacptrlMemo = $.trim($(this).find("[id$=lblacptrlMemo]").text());            // 出差事由


                        num = num + 1;
                    }
                });

                if (num > 1)
                    alert("只可選取一筆出差旅費！");
                else if (num < 1)
                    alert("請至少勾選一筆出差旅費才可以回傳資料唷！");
                else {
                    getSetEditData(tmpacpTrlAbsenceNo, tmpacpTrlKind, tmpacpTrlDepName, tmpacpTrlEmpName, tmpacpTrlEmpCode, tmpacpTrlMoneyTot, tmpacptrlMemo);
                    window.close();
                }
            }


            function getSetEditData(tmpacpTrlAbsenceNo, tmpacpTrlKind, tmpacpTrlDepName, tmpacpTrlEmpName, tmpacpTrlEmpCode, tmpacpTrlMoneyTot, tmpacptrlMemo) {

                $.ajax({
                    type: "POST",
                    url: "ajax01.aspx",
                    async: false,
                    dataType: "JSON",
                    data: { 'acpTrlAbsenceNo': tmpacpTrlAbsenceNo, 'acpTrlKind': tmpacpTrlKind },
                    success: function (result) {

                        var tmpData = "";

                        $.each(result.List_trlData, function (i, value) {
                            tmpData += tmpacpTrlEmpName + '─' + value.acdTrlMonth + '/' + value.acdTrlDay + '─' + value.acdTrlDesc + '─$' + value.TotalMoney + '\r\n';
                        });


                        //國內
                        var tmpTBAcmSubMemo = $("[id$=TBAcmSubMemo]", window.opener.document);
                        var tmpTBAcmMemo = $("[id$=TBAcmMemo]", window.opener.document);
                        var tmpTBPayName = $("[id$=TBPayName]", window.opener.document);
                        var tmpTBacpTrlAbsenceNo = $("[id$=TBacpTrlAbsenceNo]", window.opener.document); // 請假單號
                        var tmpTBAcmMoney = $("[id$=TBAcmMoney]", window.opener.document); // 報支總金額

                        tmpTBAcmSubMemo.val(tmpacptrlMemo + '\r\n' + tmpData);
                        tmpTBAcmMemo.val(tmpacptrlMemo + '\r\n' + tmpData);

                        // 將整批報支所需資訊儲存在這，到時要撈出來用。
                        tmpTBPayName.val(tmpacpTrlDepName + "_" + tmpacpTrlEmpCode + "_" + tmpacpTrlEmpName);

                        tmpTBacpTrlAbsenceNo.val(tmpacpTrlAbsenceNo);
                        tmpTBAcmMoney.val(tmpacpTrlMoneyTot);

                        //國外
                        var tmpTBAcmSubMemo1 = $("[id$=ctl_AcpSubMemo]", window.opener.document);
                        var tmpTBAcmMemo1 = $("[id$=ctl_AcpMemo]", window.opener.document);
                        var tmpTBPayName1 = $("[id$=TBAcpPayName]", window.opener.document);
                        var tmpTBacpTrlAbsenceNo1 = $("[id$=TBacpTrlAbsenceNo]", window.opener.document); // 請假單號
                        var tmpTBAcmMoney1 = $("[id$=ctl_AcpMoney]", window.opener.document); // 報支總金額


                        tmpTBAcmSubMemo1.val(tmpacptrlMemo + '\r\n' + tmpData);
                        tmpTBAcmMemo1.val(tmpacptrlMemo + '\r\n' + tmpData);

                        // 將整批報支所需資訊儲存在這，到時要撈出來用。
                        tmpTBPayName1.val(tmpacpTrlDepName + "_" + tmpacpTrlEmpCode + "_" + tmpacpTrlEmpName);

                        tmpTBacpTrlAbsenceNo1.val(tmpacpTrlAbsenceNo);
                        tmpTBAcmMoney1.val(tmpacpTrlMoneyTot);

                    },
                    error: function (jqXHR, exception) {
                        if (jqXHR.status === 0)
                            alert('Not connect.\n Verify Network.');
                        else if (jqXHR.status == 404)
                            alert('Requested page not found. [404]');
                        else if (jqXHR.status == 500)
                            alert('Internal Server Error [500].');
                        else if (exception === 'parsererror')
                            alert('Requested JSON parse failed.');
                        else if (exception === 'timeout')
                            alert('Time out error.');
                        else if (exception === 'abort')
                            alert('Ajax request aborted.');
                        else
                            alert('Uncaught Error.\n' + jqXHR.responseText);
                    }
                }); // ajax end
                return false;
            }



        </script>
    </form>
</body>

</html>
