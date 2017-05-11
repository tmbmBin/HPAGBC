<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.SignFlow.Web.Form.Retrieve.Default" %>
<%@ Register TagPrefix="sys" TagName="UCRetrieveList" Src="ascx/UCRetrieveList.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title>決行案件取回作業</title>
<link href="../../../TM.Style/ui-pager-style3.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="Stylesheet" href="style.css" /> 

<script src="../../../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="default.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<sys:UCRetrieveList ID="ucretrievelist" runat="server" />
    </div>
    </form>
</body>
</html>
