<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.SignFlow.Web.ReadyTodo._Default" %>
<%@ Register TagPrefix="SF" TagName="UCReadyTodoList" Src="ascx/UCReadyTodoList.ascx" %>
<%@ Register TagPrefix="SF" TagName="UCMenuBar" Src="../ascx/UCMenuBar.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title>線上簽核系統 - 將處理的待辦事項</title>
<%--連結 CSS 檔案 (BEGIN)--%>
<link href="../../jQuery/css/ui-1.8.9/dialog.style3/jquery-ui-1.8.9.custom-style3.css" rel="stylesheet" type="text/css" />
<link href="../../TM.Style/ui-pager-style3.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="Stylesheet" href="style.css" /> 
<link href="../Master.css" rel="stylesheet" type="text/css" />
<%--連結 CSS 檔案 (END)--%>

<%--連結 JavaScript 檔案 (BEGIN)--%>
<script src="../../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="../../jQuery/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
<script src="default.js" type="text/javascript"></script>
<script src="../Master.js" type="text/javascript"></script>
<%--連結 JavaScript 檔案 (END)--%>
</head>
<body>
<form id="form1" runat="server">
<div id="wrap">

<div id="header">
	<SF:UCMenuBar ID="menubar" runat="server" />

	<div class="filter">
		<fieldset>
		<legend>資料過濾篩選</legend>
			<div>
				表單類型:
				<asp:dropdownlist ID="cboForm" runat="server"></asp:dropdownlist>
				請購編號:
				<asp:TextBox ID="txtFN" runat="server" />
				<br />
				承辦人員:
				<asp:TextBox ID="txtWorkUser" runat="server" />
				說明欄位關鍵字:
				<asp:TextBox ID="txtDescript" runat="server" />
				<span class="actarea">
					<asp:button ID="btnFilter" text="篩選" runat="server" onclick="btnFilter_Click" />
					<asp:Button ID="btnClrFilter" Text="清除" runat="server" onclick="btnClrFilter_Click" />
				</span>
			</div>
			<div class="actarea"></div>
		</fieldset>
	</div><%--filter end--%>

</div><%--header end--%>
	
<div id="content">
	<SF:UCReadyTodoList ID="readytodolist" runat="server" />
</div><%--content end--%>
	
<div id="footer">
	
</div><%--footer end--%>

</div><%--wrap end--%>

<div id="logform" style="display:none">
	<iframe id="logfrm" frameborder="0" marginwidth="0" marginheight="0" width="100%" height="400px" scrolling="auto"></iframe>
</div>
</form>
</body>
</html>
