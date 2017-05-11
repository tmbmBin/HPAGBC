<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NameSpace.Web.Default" %>--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="tsbInspectT.Web.FrmtsbInspectT_tsbInspect.Modify" %>
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
 <asp:Label ID="lbltsbDecideNo" runat="server" Text="tsbDecideNo"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbDecideNo" runat="server" Text='<%# Eval("tsbDecideNo") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbDecideSeq" runat="server" Text="tsbDecideSeq"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbBgtKind" runat="server" Text="tsbBgtKind"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbBgtKind" runat="server" Text='<%# Eval("tsbBgtKind") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbBgtYear" runat="server" Text="tsbBgtYear"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbBgtYear" runat="server" Text='<%# Eval("tsbBgtYear") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbBgtMonth" runat="server" Text="tsbBgtMonth"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbBgtMonth" runat="server" Text='<%# Eval("tsbBgtMonth") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbPayeeNo" runat="server" Text="tsbPayeeNo"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbPayeeNo" runat="server" Text='<%# Eval("tsbPayeeNo") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbPayeeName" runat="server" Text="tsbPayeeName"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbPlanCode" runat="server" Text="tsbPlanCode"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbPlanCode" runat="server" Text='<%# Eval("tsbPlanCode") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbOutlayYear" runat="server" Text="tsbOutlayYear"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbOutlayYear" runat="server" Text='<%# Eval("tsbOutlayYear") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbOutlayCode" runat="server" Text="tsbOutlayCode"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbOutlayCode" runat="server" Text='<%# Eval("tsbOutlayCode") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbBgtSourceCode" runat="server" Text="tsbBgtSourceCode"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbBgtSourceCode" runat="server" Text='<%# Eval("tsbBgtSourceCode") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbAccKind" runat="server" Text="tsbAccKind"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbAccKind" runat="server" Text='<%# Eval("tsbAccKind") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbBizCode" runat="server" Text="tsbBizCode"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbBizCode" runat="server" Text='<%# Eval("tsbBizCode") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbMoney" runat="server" Text="tsbMoney"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbMoney" runat="server" Text='<%# Eval("tsbMoney") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbMoney1" runat="server" Text="tsbMoney1"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbMoney1" runat="server" Text='<%# Eval("tsbMoney1") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbAuditFlag" runat="server" Text="tsbAuditFlag"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbAuditFlag" runat="server" Text='<%# Eval("tsbAuditFlag") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbAuditDate" runat="server" Text="tsbAuditDate"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbAuditDate" runat="server" Text='<%# Eval("tsbAuditDate") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbAuditUser" runat="server" Text="tsbAuditUser"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbAuditUser" runat="server" Text='<%# Eval("tsbAuditUser") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbCreateDTime" runat="server" Text="tsbCreateDTime"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbCreateDTime" runat="server" Text='<%# Eval("tsbCreateDTime") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbCreateUser" runat="server" Text="tsbCreateUser"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbCreateUser" runat="server" Text='<%# Eval("tsbCreateUser") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbModifyDTime" runat="server" Text="tsbModifyDTime"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbModifyDTime" runat="server" Text='<%# Eval("tsbModifyDTime") %>' CssClass="Width40p" ></asp:TextBox>
 </li>
<li class="title3">
 <asp:Label ID="lbltsbModifyUser" runat="server" Text="tsbModifyUser"></asp:Label>
 </li>
 <li class="field3">
 <asp:TextBox ID="txttsbModifyUser" runat="server" Text='<%# Eval("tsbModifyUser") %>' CssClass="Width40p" ></asp:TextBox>
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
