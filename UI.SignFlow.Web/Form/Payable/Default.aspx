<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.SignFlow.Web.Form.Payable._Default" %>

<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>

<%@ Register TagPrefix="sys" TagName="UCPayableList" Src="ascx/UCPayableList.ascx" %>
<%@ Register TagPrefix="sys" TagName="UCDisPayableList" Src="ascx/UCDisPayableList.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title>可報支案件清單</title>

<link href="../../../TM.Style/ui-pager-style3.css" rel="stylesheet" type="text/css" />
<link href="../../Master.css" rel="stylesheet" type="text/css" />

<script src="../../../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="../../../jQuery/jquery.jget.js" type="text/javascript"></script>
<script src="default.js" type="text/javascript"></script>
</head>
<body>
<form id="form1" runat="server">
<div id="wrap">

<div id="header">

	<asp:HiddenField ID="ShowButton" runat="server" />

<script type="text/javascript">
		$(function () { $(".menubar td").hover(function () { $(this).addClass("over"); }, function () { $(this).removeClass("over"); }); });
</script>
<style type="text/css">
.menubar{
	border-bottom:1px solid #5D7B9D;
	margin:0 10px 10px 0;
}
.menubar td{
	width:120px;
	background-color:#FFF;
	height:26px;
	text-align:center;
	font-size:10pt;
}
.menubar td a{
	color:#5D7B9D;
	text-decoration:none;
	display:block;
	height:26px;
	line-height:26px;
}
.menubar td.current{
	background:#5D7B9D;
}
.menubar td.current a{
	color:#FFF;
}
.menubar td.over{
	background:#5D7B9D;
}
.menubar td.over a{
	color:#FFF;
}
</style>
<div class="menubar"><table><tr>
<td id="td1" runat="server"><a id="a1" runat="server">可報支案件</a></td>
<td id="td2" runat="server"><a id="a2" runat="server">已報支案件</a></td>
</tr></table></div>

	<asp:Panel ID="filter" CssClass="filter" runat="server">
		<fieldset>
		<legend>資料過濾篩選</legend>
			<div>
				表單類型:
				<asp:dropdownlist ID="cboForm" runat="server"></asp:dropdownlist>
				請購編號:
				<asp:TextBox ID="txtFN" runat="server" />
				<span class="actarea">
					<asp:button ID="btnFilter" text="篩選" runat="server" onclick="btnFilter_Click" />
					<asp:Button ID="btnClrFilter" Text="清除" runat="server" onclick="btnClrFilter_Click" />
				</span>
			</div>
			<div class="actarea"></div>
		</fieldset>
	</asp:Panel><%--filter end--%>

</div><%--header end--%>
	
<div id="content">
	<TM:MessagePanel ID="MessagePanel1" runat="server"></TM:MessagePanel>
	<sys:UCPayableList ID="ucpayablelist" runat="server" />
	<sys:UCDisPayableList ID="ucdispayablelist" runat="server" />
</div><%--content end--%>
	
<div id="footer">
	
</div><%--footer end--%>

</div><%--wrap end--%>
</form>
</body>
</html>
