<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NameSpace.Web.Default" %>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayPrint2.aspx.cs" Inherits="Pay.Web.FrmPay_tsbPay.PayPrint2" EnableEventValidation="true" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %><%: Styles.Render("~/Content/jqueryui") %><%: Styles.Render("~/Content/jqueryval") %><%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <% if (false)
       { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
</head>
<body>
    <form id="form1" runat="server">
        <div class="MainCon" style="margin: 0 auto 0 auto;">
            <h1 class="h1Class">
                <asp:Label ID="lbltitle" runat="server" Text="支出憑證黏存單列印"></asp:Label>
            </h1>
            <div style="display: none">
                <asp:Label ID="lbltsbYear" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lbltsbApplyNo" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lbltsbDecideNo" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lbltsbPayNo" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lbltsbPayYear" runat="server" Text="Label"></asp:Label>

            </div>
            <asp:FormView ID="FormView1" runat="server" Width="100%" class="MainCon3">
                <ItemTemplate>
                    <!------------------->
                    <table style="width: 100%; vertical-align: top;" border="0">
                        <tr>
                            <td class="qury_table_td">會簽編號：</td>
                            <td class="qury_table_td2">
                                <asp:Label ID="lbltsbApplyWordNum" runat="server" Text="沒有會簽編號"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">核定明細號：</td>
                            <td class="qury_table_td2">
                                <asp:DropDownList ID="ddlPayDtl" Width="500px" runat="server"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <div style="text-align: center; margin: 10px;">
                        <input type="button" id="btnPrint" value="列印" class="Btn03" />
                    </div>
                    <!----------------------->
                </ItemTemplate>
            </asp:FormView>

            <!-- 顯示列印區塊 Start-->
            <div id="divP" style="display: none;">
                <div style="text-align: center;">
                    <input type="button" id="btnPayinstructions" value="【開啟】分期付款備註設定" style="display: none" />
                </div>
                <!--黏存單付款說明-->
                <div id="divPX" style="display: none">
                    <iframe id="Payinstructions" name="Payinstructions" style="height: 140px; width: 100%; visibility: inherit; z-index: 2" scrolling="no" frameborder="0" src=""></iframe>
                </div>
                <!--列印資料-->
                <iframe id="PayPrint" name="PayPrint" style="height: 650px; width: 100%; visibility: inherit; z-index: 2" scrolling="yes" frameborder="1" src=""></iframe>
            </div>
            <!-- 顯示列印區塊 End-->
        </div>


        <%: Scripts.Render("~/bundles/jquery") %>
        <%: Scripts.Render("~/bundles/basic") %>
        <%: Scripts.Render("~/bundles/jqueryui") %>
        <%: Scripts.Render("~/bundles/jqueryval") %>
        <%: Scripts.Render("~/bundles/kendo") %>
        <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
        <%: Scripts.Render("~/bundles/MyLibraryJs") %>
        <%: Scripts.Render("~/bundles/jquery.pagination") %>
        <%: Scripts.Render("~/bundles/URI") %>


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




            //#region $("#btnView").click
            $("#btnPrint").click(function () {

                var tsbYear = $('#lbltsbYear').html();
                var tsbApplyNo = $('#lbltsbApplyNo').html();
                var tsbDecideNo = $('#lbltsbDecideNo').html();
                var tsbPayNo = $('#lbltsbPayNo').html();
                var tsbPayYear = $('#lbltsbPayYear').html();
                var tsbApplyWordNum = $("#<%=  FormView1.FindControl("lbltsbApplyWordNum").ClientID %>").html();
                var tsbDecideSeq = $("#<%=  FormView1.FindControl("ddlPayDtl").ClientID %>").val().split("_")[0];; //核定明細號
                var tsbPayNoMapping = $("#<%=  FormView1.FindControl("ddlPayDtl").ClientID %>").val().split("_")[1];; //對應到原系統號
                var acmNo1 = $("#<%=  FormView1.FindControl("ddlPayDtl").ClientID %>").val().split("_")[2];; //對應到舊系統acmNo1

                if (tsbPayNo == "0") {
                    alert("尚未新增核銷資料，請先點選新增按鈕進行新增資料")
                    return;
                }



                var src = "../../UI.ActReports.Web/FrmRptMenu.aspx?"

                      + "visastage=PM"
                      + "&acmYear=" + tsbYear
                      + "&acmNo=" + tsbApplyNo
                      + "&acmwordnum=" + tsbApplyWordNum
                      + "&acmNo1=" + acmNo1   //tsbDecideSeq  再簽號及決標號等於核定明細號   再簽號及決標號等於核定明細號  2016.08.10 改成改成 新增的欄位acmNo1 (再tsbDecideDtl 表單)  for 分期付款
                      + "&acpPayYear=" + tsbPayYear
                      + "&acpPayNo=" + parseInt(tsbPayNoMapping, 10)   //預撥對應
                      + "&acpPayNoPrv=" + parseInt(tsbPayNoMapping, 10)  //合併號(等同核銷號的mapping)
                      + "&acmkidnum="
                      + "&page1qty=7"
                      + "&page2qty=43"

                //偵錯用
                //alert(src);
                $('#divP').show();
                document.getElementById("PayPrint").src = src;


                //黏存單付款說明
                var src2 = "../../UI.tsbPayAttPaidFrom.Web/Default.aspx?"

                  + "datastage=PM"
                  + "&acmYear=" + tsbYear
                  + "&acmNo=" + tsbApplyNo
                  + "&acmwordnum=" + tsbApplyWordNum
                  + "&acmNo1=" + acmNo1 //tsbDecideSeq  再簽號及決標號等於核定明細號  再簽號及決標號等於核定明細號  2016.08.10 改成改成 新增的欄位acmNo1 (再tsbDecideDtl 表單)  for 分期付款
                  + "&acpPayYear=" + tsbPayYear
                  + "&acpPayNo=" + parseInt(tsbPayNoMapping, 10)   //預撥對應
                  + "&acmkidnum="
                  + "&page1qty=7"
                  + "&page2qty=43"
                  + "&SessID=undefined"


                document.getElementById("Payinstructions").src = src2;
                var tmpOpenFlag = 1;

                $("#btnPayinstructions").bind("click", function () {
                    if (tmpOpenFlag) {
                        tmpOpenFlag = 0
                        $('#divPX').show();
                        $("#btnPayinstructions").prop('value', '【關閉】分期付款備註設定');

                    }
                    else {
                        $('#divPX').hide();
                        tmpOpenFlag = 1;
                        $("#btnPayinstructions").prop('value', '【開啟】分期付款備註設定');
                    }
                });



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
