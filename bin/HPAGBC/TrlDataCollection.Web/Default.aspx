<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TrlDataCollection.Default" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%-- Style專區 --%>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/jqueryui") %>
    <%: Styles.Render("~/Content/jqueryval") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <% if (false)
       { %><link href="../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
</head>
<body>
    <form id="form1" runat="server">
        <div class="MainCon" style="margin: 0 auto 0 auto; text-align: center">
            <h1 class="h1Class">差旅資料匯入</h1>
            <table style="text-align: center; width: 100%">
                <tr>
                    <td>
                        <br />
                        <asp:Button ID="btnTrlDataCollectionImport" CssClass="Btn08" BackColor="White" runat="server" Text="匯入差勤資料" OnClick="btnTrlDataCollectionImport_Click" />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
