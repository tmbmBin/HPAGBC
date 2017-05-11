<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify2.aspx.cs" Inherits="tsbEstimateT.Web.FrmtsbEstimateT_tsbEstimate.Modify2" EnableEventValidation="true" %>

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
            <asp:ObjectDataSource ID="ODS_oulOutlayCode01" runat="server" TypeName="ShareTable.DAO.codOutlayCodeDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount">
                <SelectParameters>
                    <asp:Parameter Name="codCodeVer" Type="Int16" />
                    <asp:Parameter Name="oulOutlayCode" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODS_oulOutlayCode02" runat="server" TypeName="ShareTable.DAO.codOutlayCodeDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount">
                <SelectParameters>
                    <asp:Parameter Name="codCodeVer" Type="Int16" />
                    <asp:Parameter Name="oulOutlayCode" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <h1 class="h1Class">估列資料編輯</h1>
            <div runat="server" id="editDiv">
                <table style="width: 100%;" border="1">
                    <tr>
                        <td class="DtleditTd">受款人</td>
                        <td class="DtleditTd">用途別</td>
                        <td class="DtleditTd">核定金額</td>
                        <td class="DtleditTd"><span style="color: Red;">＊</span>估列應付金額(總額)</td>
                        <td class="DtleditTd">期間區分</td>
                        <td class="DtleditTd">審核狀態</td>
                        <td class="DtleditTd" runat="server" id="editTd00">會計處審核</td>
                        <td class="DtleditTd">刪除</td>
                    </tr>
                    <tr>
                        <td style="width: 21%;">
                            <asp:Label ID="labtsbPayeeName01" runat="server" Width="98%"></asp:Label>
                        </td>
                        <td style="width: 18%;">
                            <asp:DropDownList ID="ddloulOutlayCode01" runat="server" Width="98%" DataSourceID="ODS_oulOutlayCode01" DataTextField="oulOutlayName" DataValueField="oulOutlayCode">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 10%; text-align: center;" >
                            <asp:Label ID="labtsbMoney01" runat="server" Width="98%"></asp:Label>
                        </td>
                        <td style="width: 10%;">
                            <asp:TextBox ID="txttsbEstimateMoney01" runat="server" Width="98%" OnKeyPress="checkNumber()"></asp:TextBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:Label ID="labtsbEstimateType01" runat="server" Width="98%"></asp:Label>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:Label ID="labtsbPassFlag01" runat="server" Width="98%"></asp:Label>
                        </td>
                        <td style="width: 7%; text-align: center;" runat="server" id="editTd01">
                            <asp:CheckBox ID="chkNo01" runat="server"></asp:CheckBox>
                        </td>
                        <td style="width: 4%; text-align: center;">
                            <asp:CheckBox ID="chkDel01" runat="server"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 21%;">
                            <asp:Label ID="labtsbPayeeName02" runat="server" Width="98%"></asp:Label>
                        </td>
                        <td style="width: 18%;">
                            <asp:DropDownList ID="ddloulOutlayCode02" runat="server" Width="98%" DataSourceID="ODS_oulOutlayCode02" DataTextField="oulOutlayName" DataValueField="oulOutlayCode">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 10%; text-align: center;">
                            <asp:Label ID="labtsbMoney02" runat="server" Width="98%"></asp:Label>
                        </td>
                        <td style="width: 10%;">
                            <asp:TextBox ID="txttsbEstimateMoney02" runat="server" Width="98%" OnKeyPress="checkNumber()"></asp:TextBox>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:Label ID="labtsbEstimateType02" runat="server" Width="98%"></asp:Label>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <asp:Label ID="labtsbPassFlag02" runat="server" Width="98%"></asp:Label>
                        </td>
                        <td style="width: 7%; text-align: center;" runat="server" id="editTd02">
                            <asp:CheckBox ID="chkNo02" runat="server"></asp:CheckBox>
                        </td>
                        <td style="width: 4%; text-align: center;">
                            <asp:CheckBox ID="chkDel02" runat="server"></asp:CheckBox>
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
        </div>

        <script type="text/javascript">

            $(function () {
                fnPageInit();
            });

            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.closeDlg();
            });
            //#endregion


            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {
                    // 使用 Block 效果 -> 後端 button 事件要加入『取消效果』。
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
