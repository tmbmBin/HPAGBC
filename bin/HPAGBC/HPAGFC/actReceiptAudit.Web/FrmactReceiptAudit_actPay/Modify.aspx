<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="actReceiptAudit.Web.FrmactReceiptAudit_actPay.Modify" %>

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
            <h1 class="h1Class">審計資料編輯作業</h1>
          
                <asp:HiddenField ID="HidacmKidNumOption" runat="server" />
         

            <asp:FormView ID="FormView1" Style="width: 100%;" runat="server">
                <ItemTemplate>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td">動支編號</td>
                            <td class="qury_table_td2">
                                <asp:TextBox ID="txtacmWordNum" runat="server" Text='<%# Eval("acmWordNum") %>' CssClass="Width40p" Enabled="false"></asp:TextBox>
                               
                                <div style="display: none">
                                    acmYear<asp:TextBox ID="txtacmYear" runat="server" Text='<%# Eval("acmYear") %>' Enabled="false" Style="display: 1none"></asp:TextBox>
                                    acmNo<asp:TextBox ID="txtacmNo" runat="server" Text='<%# Eval("acmNo") %>' Enabled="false" Style="display: 1none"></asp:TextBox>
                                    acmPayYear<asp:TextBox ID="txtacpPayYear" runat="server" Text='<%# Eval("acpPayYear") %>' Enabled="false" Style="display: 1none"></asp:TextBox>
                                    acmPayNo<asp:TextBox ID="txtacpPayNo" runat="server" Text='<%# Eval("acpPayNo") %>' Enabled="false" Style="display: 1none"></asp:TextBox>
                                </div>

                            </td>
                            <td class="qury_table_td">動支金額
                            </td>
                            <td class="qury_table_td2">
                                <asp:Label ID="lblAcmMoney" runat="server" Text='<%# Eval("AcmMoney") %>'></asp:Label></td>
                            <%--<asp:TextBox ID="txttsbMoney" runat="server" Text='<%# Eval("tsbFee").ToMoney() %>'></asp:TextBox>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">核銷人員</td>
                            <td class="qury_table_td2">
                                <asp:Label ID="lblAcpMarkUserNo" runat="server" Text='<%# Eval("AcpMarkUserNo") %>'></asp:Label></td>
                            <td class="qury_table_td">審定減列金額</td>
                            <td class="qury_table_td2">
                       <%--         <asp:TextBox ID="txtAcpMoneyALL" runat="server" Text='<%# Eval("AcpMoneyALL") %>' Width="70%" ></asp:TextBox>--%>
                                <asp:Label ID="lblAcpMoneyALL" runat="server"  Text='<%# Eval("AcpMoneyALL").ToMoney() %>' ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">請示日期</td>
                            <td colspan="3" class="qury_table_td2">
                                <%--<asp:TextBox ID="txttsbPlanCode" runat="server" Text='<%# Eval("tsbPlanName") %>' Width="70%"></asp:TextBox>--%>

                                <asp:TextBox ID="txtAcmMarkDate" runat="server" Width="200px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()" Text='<%# Eval("AcmMarkDate").ToRocDate() %>' Enabled="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">核銷日期</td>
                            <td colspan="3" class="qury_table_td2">
                                <%--<asp:TextBox ID="txttsbOutlayCode" runat="server" Text='<%# Eval("tsbOutlayName") %>' Width="70%"></asp:TextBox>--%>

                                <asp:TextBox ID="txtAcpMarkDate" runat="server" Width="200px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()" Text='<%# Eval("AcpMarkDate").ToRocDate() %>'></asp:TextBox>
                            </td>
                        </tr>
                        <%--   <tr>
                            <td class="qury_table_td">用途說明</td>
                            <td colspan="3" class="qury_table_td2">
                                &nbsp;</td>
                        </tr>--%>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>廠商名稱</td>
                            <td colspan="3" class="qury_table_td2">
                                <asp:TextBox ID="txtPayName" runat="server" Text='<%# Eval("PayName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>核銷事由</td>
                            <td class="qury_table_td2" colspan="3">
                                <asp:TextBox ID="txtMemo" runat="server" Text='<%# Eval("acmMemo") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>控帳事由</td>
                            <td class="qury_table_td2" colspan="3">
                                <asp:TextBox ID="txtSubMemo" runat="server" Text='<%# Eval("acmSubMemo") %>' Width="70%"></asp:TextBox>
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
                    <td class="DtleditTd"><span style="color: Red;">＊</span>審定減列金額</td>
                    <%--<td class="DtleditTd"><span style="color: Red;">＊</span>審定日期</td>--%>
                </tr>
                <tr>
                    <td style="width: 500px;">
                        <asp:TextBox ID="txtReceiptAuditMoney" runat="server" Width="98%" ></asp:TextBox>
                        <asp:TextBox ID="txtKeyArray" runat="server" Width="98%" Style="display: none;"></asp:TextBox>
                    </td>
                    <%--   <td style="width: 500px;">
                        <asp:TextBox ID="txttsbReceiveDate" runat="server" Width="98%" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        <asp:TextBox ID="txttsbDecideSeq" runat="server" Style="display: none;"></asp:TextBox>
                    </td>--%>
                </tr>
            </table>
            <div style="text-align: center;">
                <asp:Button ID="btnAddDtl" runat="server" Text="增加明細" CssClass="Btn12" OnClick="btnAddDtl_Click" Style="display: none;" />
                &nbsp;&nbsp;
                <asp:Button ID="btnModifyDtl" runat="server" Text="確認修改" CssClass="Btn12" OnClick="btnModifyDtl_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDeleteDtl" runat="server" Text="刪除明細" CssClass="Btn12" OnClick="btnDeleteDtl_Click" Style="display: none;" />
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
                    <asp:TemplateField HeaderText="類型" Visible="True">
                        <ItemTemplate>
                            <div style="display:none">
                                <asp:Label ID="lblKeyArray" runat="server" Text='<%# Eval("KeyArray") %>'></asp:Label>
                                <asp:Label ID="lblKeyArrayEdit" runat="server" Text='<%# Eval("KeyArrayEdit") %>'></asp:Label>
                            </div>
                            <%--   <asp:Label ID="lblacvPrePayFlag" runat="server" Text='<%# Eval("acvPrePayFlag") %>'  style="display:none" ></asp:Label>--%>
                            <asp:Label ID="lblacvPrePayFlagName" runat="server" Text='<%# Eval("acvPrePayFlagName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="150" />
                        <ItemStyle HorizontalAlign="Center" Width="150" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="年" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBgtYear" runat="server" Text='<%# Eval("acvBgtYear") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="150" />
                        <ItemStyle HorizontalAlign="Center" Width="150" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="月" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBgtMonth" runat="server" Text='<%# Eval("acvBgtMonth") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="150" />
                        <ItemStyle HorizontalAlign="Center" Width="150" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="門別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblAccKindName" runat="server" Text='<%# Eval("AccKindName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="150" />
                        <ItemStyle HorizontalAlign="Center" Width="150" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="預算來源" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBgtSourName" runat="server" Text='<%# Eval("orgName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="300" />
                        <ItemStyle HorizontalAlign="Center" Width="300" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="經費單位" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBgtDepName" runat="server" Text='<%# Eval("acvBgtDepName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="300" />
                        <ItemStyle HorizontalAlign="Center" Width="300" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="計畫科目" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblPlanName" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="600" />
                        <ItemStyle HorizontalAlign="Center" Width="600" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="用途別科目" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblOulName" runat="server" Text='<%# Eval("OulName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="600" />
                        <ItemStyle HorizontalAlign="Center" Width="600" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="報支金額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblAcvMoney" runat="server" Text='<%# Eval("acvMoney").ToMoney() %>' style="display:none" ></asp:Label>
                             <asp:Label ID="lblTotalPaid" runat="server" Text='<%# Eval("TotalPaid").ToMoney() %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="300" />
                        <ItemStyle HorizontalAlign="Center" Width="300" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="審定減列金額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblReceiptAuditMoney" runat="server" Text='<%# Eval("ReceiptAuditMoney").ToMoney() %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="300" />
                        <ItemStyle HorizontalAlign="Right" Width="300" />
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="審定日期" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbReceiveDate" runat="server" Text='<%# Eval("tsbReceiveDate").ToRocDate() %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="300" />
                        <ItemStyle HorizontalAlign="Center" Width="300" />
                    </asp:TemplateField>--%>
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

                ////僅允許輸入數字 負號 小數點 STR
                $("#txtReceiptAuditMoney").keydown(function (e) {
                    // Allow: backspace, delete, tab, escape and enter
                    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
                        // Allow: Ctrl+A, Command+A
                        (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                        // Allow: home, end, left, right, down, up
                        (e.keyCode >= 35 && e.keyCode <= 40)) {
                        // let it happen, don't do anything
                        return;
                    }
                    // Ensure that it is a number and stop the keypress
                    if ((e.shiftKey || (e.keyCode < 48 || (e.keyCode > 57 && e.keyCode != 189 && e.keyCode != 190)))
                        && (e.keyCode < 96 || e.keyCode > 105)) {
                        e.preventDefault();
                    }
                    // 如果使用者輸入-，先判斷現在的值有沒有-，如果有，就不允許輸入
                    if (e.keyCode == 189 && /-/g.test(this.value)) {
                        e.preventDefault();
                    }
                    // 如果使用者輸入.，先判斷現在的值有沒有.，如果有，就不允許輸入
                    if (e.keyCode == 190 && /\./g.test(this.value)) {
                        e.preventDefault();
                    }
                });

                $('#txtReceiptAuditMoney').keyup(function () {
                    if (/[^0-9\.-]/g.test(this.value)) {
                        this.value = this.value.replace(/[^0-9\.-]/g, '');
                    }

                    if (/-/g.test(this.value) && !/^-/g.test(this.value)) {
                        this.value = this.value.replace(/-/g, '');
                    }
                });
                ////////僅允許輸入數字 負號 小數點 End

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
                    //alert('123');
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
                        //var tmptsbReceiveSeq = $(this).find("td:eq(0)").text();
                        var txtReceiptAuditMoney = $.trim($(this).find("[id$=lblReceiptAuditMoney]").text());
                        var txtKeyArray = $.trim($(this).find("[id$=lblKeyArray]").text());
                        // alert(txtReceiptAuditMoney);
                        // 將資料放入編輯區
                        // $('#txttsbReceiveSeq').val($.trim(tmptsbReceiveSeq));
                        $('#txtReceiptAuditMoney').val($.trim(txtReceiptAuditMoney));
                        $('#txtKeyArray').val($.trim(txtKeyArray));
                        // $('#txttsbReceiveDate').val($.trim(tmptsbReceiveDate));

                        $.unblockUI();
                    }
                });
            }

        </script>
    </form>
</body>
</html>
