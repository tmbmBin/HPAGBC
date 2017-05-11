<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.SignFlow.Web.iSignForm.Default" %>
<%@ Register TagPrefix="SF" TagName="UCSignRec" Src="ascx/UCSignRec.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title></title>
<link href="../Master.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<div class="filter">
			<fieldset style="padding:4px;color:#333;">
			<legend>表單資訊</legend>
			<div style="line-height:22px">表單編號&nbsp;&raquo;&nbsp;<label style="font-family:Verdana;font-weight:bold"><asp:Literal ID="ltFormNumber" runat="server" /></label></div>
			<div style="line-height:22px">內容描述&nbsp;&raquo;&nbsp;<asp:Literal ID="ltDescript" runat="server" /></div>
			</fieldset>
		</div>
		<SF:UCSignRec ID="ucsignrec" runat="server" />
    </div>
    </form>
</body>
</html>
