<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NameSpace.Web.Default" %>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.tsbPayAttPaidFrom.Web.Default" EnableEventValidation="true" %>
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
<body style="background-color:transparent; ">
    <form id="form1" runat="server">
        <h1 class="h1Class">
            <asp:Label ID="lbltitle" runat="server" Text="分期付款表單備註設定"></asp:Label>  
        </h1>
        <%--  <div style="display:1none">
                            <asp:Label ID="lbltsbYear" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="lbltsbApplyNo" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="lbltsbDecideNo" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="lbltsbPayNo" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="lbltsbPayYear" runat="server" Text="Label"></asp:Label>

             </div>--%>
        <div id="DIV1" runat="server">

                <asp:TextBox ID="txtKeys" runat="server" style="display:none"></asp:TextBox> <!---Key---->
                  <!------------------->
                <table style="width: 100%; vertical-align: top;" border="1">
                    <tr>
                        <td  style="width:10%">表單名稱</td>
                        <td  style="width:10%">
                            欄位名稱</td>
                        <td style="width:50%">
                            內容</td>
                    </tr>
                    <tr>
                        <td >
                            <label for="RBRptList_3">
                            分批(期)付款表</label></td>
                        <td >
                            <asp:Label ID="lblColumnName1" runat="server" Text="備註"></asp:Label>
                        </td>
                        <td >
                            <asp:TextBox ID="txtContents1" runat="server" Width="99%" ></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <!----------------------->

          
        </div>

<%--        <asp:FormView ID="FormView1" runat="server" Width="100%">
            <ItemTemplate>
          
            </ItemTemplate>
        </asp:FormView>--%>


        <div style="text-align: center; margin: 10px;">
        <%--<input type="button" id="btnPrint" value="列印" class="Btn03" />--%>
       <%-- <input type="button" id="btnSave" value="儲存" class="Btn04" />--%>
        <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
        </div>


        <!-- 顯示列印區塊-->
    <%--    <div id="divP" style="display:1none">
             
             <table>
                

                 <tr>
                     <td style="text-align:center">
                           <input type="button" id="btnPayinstructions" value="【開啟】黏存單付款說明"  style="display:none"  /> 
                     </td>
                 </tr>
            
            </table>

             <!--黏存單付款說明-->
             <div id="divPX" style="display:none">
             <iframe id="Payinstructions" name="Payinstructions" style=" height:170px; width:100%; VISIBILITY: inherit; Z-INDEX: 2" scrolling="no" frameborder="0" src=""></iframe>
             </div>

             <!--列印資料-->
             <iframe id="PayPrint" name="PayPrint" style=" height:650px; width:100%; VISIBILITY: inherit; Z-INDEX: 2" scrolling="yes" frameborder="1" src=""></iframe>
        </div>--%>




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


            //#region $("#btnDelete").click
            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    $.blockUI({ message: "<h1><b><img src='../../Images/ajax-loader.gif' />刪除中...</b></h1>" });
                    return true;
                }
                return false;
            });
            //#endregion


            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {
                    $.blockUI({ message: "<h1><b><img src='../../Images/ajax-loader.gif' />儲存中...</b></h1>" });
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
