<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrePayPrint2.aspx.cs" Inherits="PrePay.Web.FrmPrePay_tsbPrePay.PrePayPrint2" %>

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
        <div class="1MainCon" style="margin: 0 auto 0 auto;">
            <h1 class="h1Class">
                <asp:Label ID="lbltitle" runat="server" Text="支出憑證黏存單列印"></asp:Label>
            </h1>
            <div style="display: none">
                <asp:Label ID="lbltsbYear" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lbltsbApplyNo" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lbltsbDecideNo" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lbltsbPrePayNo" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lbltsbPrePayYear" runat="server" Text="Label"></asp:Label>
            </div>

            <asp:FormView ID="FormView1" runat="server" OnDataBound="FormView1_DataBound" Width="100%" class="MainCon3">
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
                            <td class="qury_table_td">核定明細號(受款人)：</td>
                            <td class="qury_table_td2">
                                <asp:DropDownList ID="ddlPrePay" Width="500px" runat="server"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <div style="text-align: center; margin: 10px;">
                        <input type="button" id="btnPrint" value="列印" class="Btn03" />
                    </div>

                    <!----------------------->
                </ItemTemplate>
            </asp:FormView>

             


            <!-- 顯示列印區塊 Start -->
            <div id="divP" style="display: none">
                <div style="text-align: left;">
                    <input type="button" id="btnPayinstructions" value="【開啟】黏存單付款說明" style="display: none" />
                    <input type="button" id="btnPayinstructions2" value="【開啟】暫付款申請單付款說明" />
                </div>

                <!--黏存單付款說明-->
                <div id="divPX" style="display: none">
                    <iframe id="Payinstructions" name="Payinstructions" style="height: 170px; width: 100%; visibility: inherit; z-index: 2" scrolling="no" frameborder="0" src=""></iframe>
                </div>
              <!--預付申請單付款說明-->
                    <div id="divPX2" style="display: 1none">
                        <span id="span_data">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </span>
                        <!--後端撈取用-->
                        <div id="span_data2" name="span_data2" runat="server" style="display: none">
                        </div>
                        <asp:TextBox ID="txthtmlData" runat="server" Style="display: none"></asp:TextBox>
                        <asp:Button ID="btnSave" runat="server" Text="儲存" OnClick="btnSave_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="刪除" OnClick="btnClear_Click" />
                    </div>
                <!--列印資料-->
                <iframe id="PrePrint" name="PrePrint" style="height: 650px; width: 100%; visibility: inherit; z-index: 2" scrolling="yes" frameborder="1" src=""></iframe>
            </div>
            <!-- 顯示列印區塊 End -->

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

                //  fnPageInit();

                //初始畫都關閉
                $('#divPX').hide();
                $('#divPX2').hide();
            });


            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href;
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



            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {

                    var tmpDiV = $("#<%= this.FindControl("span_data2" ).ClientID %> ");
                    tmpDiV.empty().append($("#span_data").clone()); //複製修改後XML
                    var tmpx = tmpDiV.html();
                    //alert(tmpx);
                    $("#txthtmlData").val(encodeURIComponent(tmpx));

                    return true;
                } else {
                    alert("驗證失敗，請檢查紅色星號的欄位是否有填！！");
                }


                return false;
            });
            //#endregion








            //#region $("#btnView").click
            $("#btnPrint").click(function () {

                // var menuID = $("#hdfMenuID").val();


                var tsbYear = $('#lbltsbYear').html();
                var tsbApplyNo = $('#lbltsbApplyNo').html();
                var tsbDecideNo = $('#lbltsbDecideNo').html();
                var tsbPrePayNo = $('#lbltsbPrePayNo').html(); //新系統預撥號
                var tsbPrePayYear = $('#lbltsbPrePayYear').html();
                var tsbApplyWordNum = $("#<%=  FormView1.FindControl("lbltsbApplyWordNum").ClientID %>").html();

                var tsbDecideSeq = $("#<%=  FormView1.FindControl("ddlPrePay").ClientID %>").val().split("_")[0];; //核定明細號
                var tsbPayNoMapping = $("#<%=  FormView1.FindControl("ddlPrePay").ClientID %>").val().split("_")[1];; //對應到原系統號
                var acmNo1 = $("#<%=  FormView1.FindControl("ddlPrePay").ClientID %>").val().split("_")[2];; //對應到舊系統acmNo1

               

                if (tsbPrePayNo == "0") {
                    alert("尚未新增預撥資料，請先點選新增按鈕進行新增資料")
                    return;
                }

                var src = "../../UI.ActReports.Web/FrmRptMenu.aspx?"

                    + "visastage=P"
                    + "&acmYear=" + tsbYear
                    + "&acmNo=" + tsbApplyNo
                    + "&acmwordnum=" + tsbApplyWordNum
                    + "&acmNo1=" + acmNo1        //tsbDecideSeq   再簽號及決標號等於核定明細號  2016.08.10 改成改成 新增的欄位acmNo1 (再tsbDecideDtl 表單)  for 分期付款
                    + "&acpPayYear=" + tsbPrePayYear
                    + "&acpPayNo=" + parseInt(tsbPayNoMapping, 10)   //預撥對應
                    + "&acmkidnum=TCase"
                    + "&page1qty=7"
                    + "&page2qty=43"


                //偵錯用
                //alert(src);

                $('#divP').show();
                document.getElementById("PrePrint").src = src;


                //黏存單付款說明
                //var src2 = "../../AppCtrlCustom/FrmPayMethod.aspx?"
                var src2 = "../../UI.tsbPayAttPaidFrom.Web/Default.aspx?"
                + "datastage=P"
                + "&acmYear=" + tsbYear
                + "&acmNo=" + tsbApplyNo
                + "&acmwordnum=" + tsbApplyWordNum
                + "&acmNo1=" +  + acmNo1   //tsbDecideSeq       //再簽號及決標號等於核定明細號  2016.08.10 改成改成 新增的欄位acmNo1 (再tsbDecideDtl 表單)  for 分期付款
                + "&acpPayYear=" + tsbPrePayYear
                + "&acpPayNo=" + parseInt(tsbPayNoMapping, 10)   //預撥對應
                + "&acmkidnum="
                + "&page1qty=7"
                + "&page2qty=43"
                + "&SessID=undefined"

                //$('#divPX').show();
                document.getElementById("Payinstructions").src = src2;


                var tmpOpenFlag = 1;
                var tmpOpenFlag2 = 1;

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

                $("#btnPayinstructions2").bind("click", function () {
                    if (tmpOpenFlag2) {
                        tmpOpenFlag2 = 0
                        $('#divPX2').show();
                        $("#btnPayinstructions2").prop('value', '【關閉】暫付款申請單付款說明');

                    }
                    else {
                        $('#divPX2').hide();
                        tmpOpenFlag2 = 1;
                        $("#btnPayinstructions2").prop('value', '【開啟】暫付款申請單付款說明');
                    }
                });


            });
            //#endregion

            function check_Num() {
                if ((event.keyCode >= 48 && event.keyCode <= 57)) { return true; }
                else { event.keyCode = 0; false; }
            }

            function check_inputVal(parObj) {
                if (parseFloat(replaceString(parObj.value, ",", "")) < 0) {
                    alert("不得輸入小於零數值。");
                    parObj.value = 0;
                    parObj.focus();
                }
            }


        </script>
    </form>
</body>
</html>
