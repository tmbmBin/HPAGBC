<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.BasicData.Web.Extend.ControlPlan._Default" %>

<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title>列管計畫設定單元</title>
<%--連結 CSS 檔案 (BEGIN)--%>
<link type="text/css" rel="Stylesheet" href="style.css" /> 
<%--連結 CSS 檔案 (END)--%>

<%--連結 JavaScript 檔案 (BEGIN)--%>
<script src="../../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="default.js" type="text/javascript"></script>
<%--連結 JavaScript 檔案 (END)--%>
</head>
<body>
<form id="form1" runat="server">
<div id="wrap">

<div id="header">
	
</div><%--header end--%>
	
<div id="content">

<asp:PlaceHolder ID="container" runat="server">

<div class="ui-grid-container">
	<asp:GridView ID="grid" runat="server" CssClass="gridstyle" AutoGenerateColumns="false">
	<AlternatingRowStyle CssClass="zebra" />
	<Columns>
	<asp:TemplateField HeaderText="列管否">
	<ItemStyle Width="50px" HorizontalAlign="Center" />
	<ItemTemplate>
		<asp:CheckBox ID="chkFlag" runat="server" Checked='<%# Eval("checked") %>' />
	</ItemTemplate>
	</asp:TemplateField>

	<asp:TemplateField HeaderText="年度">
	<ItemStyle Width="30px" HorizontalAlign="Center" />
	<ItemTemplate>
	<asp:Literal ID="ccv" Text='<%# Eval("codCodeVer") %>' runat="server" />
	</ItemTemplate>
	</asp:TemplateField>

	<asp:TemplateField HeaderText="代碼">
	<ItemStyle Width="50px" HorizontalAlign="Center" />
	<ItemTemplate>
	<asp:Literal ID="ppc" Text='<%# Eval("plnPlanCode") %>' runat="server" />
	</ItemTemplate>
	</asp:TemplateField>

	<asp:TemplateField HeaderText="名稱">
	<ItemTemplate>
	<asp:Literal ID="ppn" Text='<%# Eval("plnPlanName") %>' runat="server" />
	</ItemTemplate>
	</asp:TemplateField>

	<asp:TemplateField HeaderText="經費來源">
	<ItemStyle HorizontalAlign="Left"/>
	<ItemTemplate>
	<asp:Literal ID="psn" Text='<%# Eval("ppcName") %>' runat="server" />
	</ItemTemplate>
	</asp:TemplateField>
	</Columns>
	</asp:GridView>
</div>
<div style="color:#5D7B9D">請將需作為列管的計畫勾選並儲存。</div>
<div style="text-align:center;margin-top:10px;">
	<asp:Button ID="btnSave" Text="儲存設定" runat="server" onclick="btnSave_Click" />
</div>
</asp:PlaceHolder>
<TM:MessagePanel ID="MessagePanel1" runat="server"></TM:MessagePanel>

</div><%--content end--%>
	
<div id="footer">
	
</div><%--footer end--%>

</div><%--wrap end--%>
</form>
</body>
</html>
