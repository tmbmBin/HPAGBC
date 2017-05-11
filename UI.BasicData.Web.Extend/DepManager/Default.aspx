<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.BasicData.Web.Extend.DepManager._Default" EnableViewState="false" %>

<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title>部門主管設定單元</title>
<%--連結 CSS 檔案 (BEGIN)--%>
<link href="../../jQuery/css/ui-1.8.9/dialog.style3/jquery-ui-1.8.9.custom-style3.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="Stylesheet" href="style.css" /> 
<%--連結 CSS 檔案 (END)--%>

<%--連結 JavaScript 檔案 (BEGIN)--%>
<script src="../../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="../../jQuery/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
<script src="default.js" type="text/javascript"></script>
<script src="style.js" type="text/javascript"></script>
<%--連結 JavaScript 檔案 (END)--%>
</head>
<body>
<form id="form1" runat="server">
<div id="wrap">

<div id="header">
</div><%--header end--%>
	
<div id="content">

<div class="ui-list-container">
<asp:Repeater ID="rpt" runat="server">
<HeaderTemplate>
<div>
<span class="title1">部門</span>
<span class="title2">主管</span>
<div class="clr"></div>
</div>
</HeaderTemplate>
<ItemTemplate>
<div>
<span class="content1">
<%# Eval("dptName") %>
<asp:HiddenField ID="code" runat="server" Value='<%# Eval("dptCode") %>' />
</span>
<span class="content2">
<%# Eval("payName").ToString().Length > 0 ? "【" + Eval("payName").ToString() + "】" : "---"%>
<input type="hidden" id="emp" class="emp" value='<%# Eval("payCode") %>' />
<a href="#" class="change">變更</a>
<a href="#" class="remove">移除</a>
</span>
<div class="clr"></div>
</div>
</ItemTemplate>
</asp:Repeater>
</div>
<TM:MessagePanel ID="MessagePanel1" runat="server"></TM:MessagePanel>

</div><%--content end--%>
	
<div id="footer">
	
</div><%--footer end--%>

</div><%--wrap end--%>
<div class="opt" style="display:none">
	<asp:RadioButtonList ID="rdos" runat="server" RepeatLayout="Flow" RepeatColumns="1"></asp:RadioButtonList>	
</div>
<div id="msg" style="display:none">

</div>
</form>
</body>
</html>
