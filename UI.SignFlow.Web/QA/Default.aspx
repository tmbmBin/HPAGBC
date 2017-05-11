<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.SignFlow.Web.QA.Default" %>

<%@ Register TagPrefix="SF" TagName="UCMenuBar" Src="../ascx/UCMenuBar.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="content-language" content="utf-8" />
	<%--<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />--%>
	<title></title>
	<link href="Style.css" rel="stylesheet" type="text/css" />
	<link href="../Master.css" rel="stylesheet" type="text/css" />
	<script src="../../jQuery/jQuery-min.js" type="text/javascript"></script>
	<script src="../Master.js" type="text/javascript"></script>
</head>
<body>
<form id="form1" runat="server">
<div id="wrap">
<div id="header">
	<SF:UCMenuBar ID="menubar" runat="server" />
</div><%--header end--%>
<div id="content">

<div class="QA">
<fieldset>
<legend>問與答</legend>
<div class="Q">
	請購人如何查詢請購表單之簽核進度？</div>
<div class="A">
	在 [流程追蹤] 標籤下查詢即可。</div>
<div class="Q">
	列管計畫之計畫主持人如何設定？</div>
<div class="A">
	列管與非列管計畫皆可在選單【系統管理】﹨【基本資料維護】﹨【計畫資料及代碼維護】﹨計畫基本資料維護單元下設定計畫主持人。</div>
<div class="Q">
	如何列印已核准之請購單？</div>
<div class="A">
	請在 [已決行案件] 標籤下的清單最右邊欄位有放置印表機圖示，按下該圖示即跳出可列印的報表選單。</div>
<div class="Q">
	如何查詢請購單已核准？</div>
<div class="A">
	請在 [已決行案件] 標籤下查詢。</div>
<div class="Q">
	如何列印粘存單？</div>
<div class="A">
	列印黏存單與列印核准的請購單方式相同，請在已決行案件標籤下的清單最右邊欄位有放置印表機圖示，按下該圖示即跳出可列印的報表選單。
</div>
</fieldset>
</div>

<div class="attention">
<fieldset>
<legend>注意事項</legend>
<ol>
	<li>列印請購單完畢，請務必列印簽核歷程。</li>
</ol>
</fieldset>
</div>

</div><%--content end--%>
</div><%--wrap end--%>
</form>
</body>
</html>
