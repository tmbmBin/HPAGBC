<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NameSpace.Web.Default" %>--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="tsbApplyDtlT.Web.FrmtsbApplyDtlT_tsbApplyDtl.Modify" %>
<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %>    
    <%: Styles.Render("~/Content/jqueryui") %>    
    <%: Styles.Render("~/Content/jqueryval") %>    
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <% if(false){ %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if(false){ %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if(false){ %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="tabsTitle">
            共通性計畫資料維護
        </div>
        
        <table style="width: 100%; height:250px; margin-top:0px; padding-top:0px; border-width: 1px; border-color: #666; border-style: solid">
            <tr>
                <td  style="vertical-align:top" class="auto-style1">    
                    <table style="width:100%; margin: 10px auto 10px auto; padding-top:0px; " >
                        <tr>
                            <td>
                                <table style="width: 100%;height:250px; border-width: 1px; border-color: #666; border-style: solid">
                                    <tr>
                                        <td  style="vertical-align:top">
                                            
                                            <asp:FormView ID="FormView1" runat="server"
                                            CellPadding="0" BorderWidth="0"
                                            ondatabound="FormView1_DataBound" CssClass="fvLayout1 fields2">
                                                <ItemTemplate>
                                                    <div class="caption">共通性計畫資料維護</div>
                                                    <ul>

													     <li class="title3">
 <asp:Label ID="lbltsbYear" runat="server" Text="tsbYear"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbYear" runat="server" Text='<%# Eval("tsbYear") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbApplyNo" runat="server" Text="tsbApplyNo"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbApplyNo" runat="server" Text='<%# Eval("tsbApplyNo") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbApplySeq" runat="server" Text="tsbApplySeq"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbApplySeq" runat="server" Text='<%# Eval("tsbApplySeq") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsvBgtYear" runat="server" Text="tsvBgtYear"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsvBgtYear" runat="server" Text='<%# Eval("tsvBgtYear") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsvBgtMonth" runat="server" Text="tsvBgtMonth"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsvBgtMonth" runat="server" Text='<%# Eval("tsvBgtMonth") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsvOutlayYear" runat="server" Text="tsvOutlayYear"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsvOutlayYear" runat="server" Text='<%# Eval("tsvOutlayYear") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsvOutlayCode" runat="server" Text="tsvOutlayCode"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsvOutlayCode" runat="server" Text='<%# Eval("tsvOutlayCode") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsvBgtSourceCode" runat="server" Text="tsvBgtSourceCode"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsvBgtSourceCode" runat="server" Text='<%# Eval("tsvBgtSourceCode") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsvAccKind" runat="server" Text="tsvAccKind"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsvAccKind" runat="server" Text='<%# Eval("tsvAccKind") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsvBizCode" runat="server" Text="tsvBizCode"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsvBizCode" runat="server" Text='<%# Eval("tsvBizCode") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsvMoney" runat="server" Text="tsvMoney"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsvMoney" runat="server" Text='<%# Eval("tsvMoney") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsvMemo" runat="server" Text="tsvMemo"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsvMemo" runat="server" Text='<%# Eval("tsvMemo") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbPlanCode" runat="server" Text="tsbPlanCode"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbPlanCode" runat="server" Text='<%# Eval("tsbPlanCode") %>' CssClass="Width40p" ></asp:TextBox>
 </li>

													 
													   <%--
                                                         <asp:TextBox ID="txtProductID" runat="server" Text='<%# Eval("ProductID") %>'  style="display:none"></asp:TextBox>
                                                       
                                                         <li class="title3">
                                                            <asp:Label ID="Label2" runat="server" Text="ProductName"></asp:Label>
                                                        </li>
                                                        <li class="field3">
                                                            <asp:TextBox ID="txtProductName" runat="server" Text='<%# Eval("ProductName") %>' CssClass="Width70p" ></asp:TextBox>
                                                        </li>

                                                         <li class="title3">
                                                            <asp:Label ID="Label1" runat="server" Text="SupplierID"></asp:Label>
                                                        </li>
                                                        <li class="field3">
                                                            <asp:TextBox ID="txtSupplierID" runat="server" Text='<%# Eval("SupplierID") %>' CssClass="Width70p" ></asp:TextBox>
                                                        </li>

                                                         <li class="title3">
                                                            <asp:Label ID="Label3" runat="server" Text="CategoryID"></asp:Label>
                                                        </li>
                                                        <li class="field3">
                                                            <asp:TextBox ID="txtCategoryID" runat="server" Text='<%# Eval("CategoryID") %>' CssClass="Width70p" ></asp:TextBox>
                                                        </li>

                                                         <li class="title3">
                                                            <asp:Label ID="Label4" runat="server" Text="QuantityPerUnit"></asp:Label>
                                                        </li>
                                                        <li class="field3">
                                                            <asp:TextBox ID="txtQuantityPerUnit" runat="server" Text='<%# Eval("QuantityPerUnit") %>' CssClass="Width70p" ></asp:TextBox>
                                                        </li>

                                                         <li class="title3">
                                                            <asp:Label ID="Label5" runat="server" Text="UnitPrice"></asp:Label>
                                                        </li>
                                                        <li class="field3">
                                                            <asp:TextBox ID="txtUnitPrice" runat="server" Text='<%# Eval("UnitPrice") %>' CssClass="Width70p" ></asp:TextBox>
                                                        </li>

                                                         <li class="title3">
                                                            <asp:Label ID="Label6" runat="server" Text="UnitsInStock"></asp:Label>
                                                        </li>
                                                        <li class="field3">
                                                            <asp:TextBox ID="txtUnitsInStock" runat="server" Text='<%# Eval("UnitsInStock") %>' CssClass="Width70p" ></asp:TextBox>
                                                        </li>

                                                         <li class="title3">
                                                            <asp:Label ID="Label7" runat="server" Text="UnitsOnOrder"></asp:Label>
                                                        </li>
                                                        <li class="field3">
                                                            <asp:TextBox ID="txtUnitsOnOrder" runat="server" Text='<%# Eval("UnitsOnOrder") %>' CssClass="Width70p" ></asp:TextBox>
                                                        </li>

                                                         <li class="title3">
                                                            <asp:Label ID="Label8" runat="server" Text="ReorderLevel"></asp:Label>
                                                        </li>
                                                        <li class="field3">
                                                            <asp:TextBox ID="txtReorderLevel" runat="server" Text='<%# Eval("ReorderLevel") %>' CssClass="Width70p" ></asp:TextBox>
                                                        </li>

                                                         <li class="title3">
                                                            <asp:Label ID="Label9" runat="server" Text="Discontinued"></asp:Label>
                                                        </li>
                                                        <li class="field3">
                                                            <asp:TextBox ID="txtDiscontinued" runat="server" Text='<%# Eval("Discontinued") %>' CssClass="Width70p" ></asp:TextBox>
                                                        </li>
                                                           --%>

                                                    </ul>
                                                </ItemTemplate>
                                            </asp:FormView>

                                       </td>
                                    </tr>
                                </table>
                 
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </div>
        
        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" CssClass="Button5" OnClick="btnDel_Click" />
            <asp:Button ID="btnSave" runat="server" Text="儲存" CssClass="Button5" OnClick="btnSave_Click" />
            <asp:Button ID="btnClose" runat="server" Text="關閉" CssClass="Button5" />
        </asp:Panel>

   
    <%: Scripts.Render("~/bundles/jquery") %>
    <%: Scripts.Render("~/bundles/basic") %>
    <%: Scripts.Render("~/bundles/jqueryui") %>
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/kendo") %>
    <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
    <%: Scripts.Render("~/bundles/MyLibraryJs") %>
    <%: Scripts.Render("~/bundles/jquery.pagination") %>
    <%: Scripts.Render("~/bundles/URI") %> 

<%--    <script src="../../Scripts/jquery-1.11.1-fix.js"></script>
    <script src="../../Scripts/base.js"></script>
    <script src="../../Scripts/json2.js"></script>
    <script src="../../Scripts/jquery.blockUI.js"></script>
    <script src="../../Scripts/jquery.validate.js"></script>
    <script src="../../Scripts/jquery.validate.messages_zh_TW.js"></script>
    <script src="../../Scripts/jquery.validate.inline.js"></script>
    <script src="../../Scripts/kendo/2014.1.416/kendo.ui.core-chinese.min.js"></script>
    <script src="../../Scripts/kendo/2014.1.416/cultures/kendo.culture.zh-TW-chinese.min.js"></script>
    <script src="../../Scripts/jquery.MyKendo/jquery.MyKendoAll.js"></script>
    <script src="../../Scripts/MyLibraryJs/MyLibraryJs.js"></script>
    <script src="../../Scripts/jquery.pagination/jquery.pagination.js"></script>
    <script src="../../Scripts/URI/URI.js"></script>--%>



    <script type="text/javascript">

        $(function () {
            fnPageInit();           
        });


        //#region $("#btnClose").click
        $("#btnClose").click(function () {
            parent.location.href = parent.location.href;
            //parent.MyLibraryJs.JqPluginExt.fnKendoWindowClose();
            return false;
        });
        //#endregion


        //#region $("#btnDelete").click
        $("#btnDelete").click(function () {
            if (confirm('是否真的要刪除此筆資料？')) {
                //$.blockUI({ message: "<h1><b><img src='../../Images/ajax-loader.gif' />刪除中...</b></h1>" });
                return true;
            }
            return false;
        });
        //#endregion


        //#region $("#btnSave").click
        $("#btnSave").click(function () {
            if ($("#form1").valid()) {
                //$.blockUI({ message: "<h1><b><img src='../../Images/ajax-loader.gif' />儲存中...</b></h1>" });
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
            //$("form").makeValidationInline();

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
