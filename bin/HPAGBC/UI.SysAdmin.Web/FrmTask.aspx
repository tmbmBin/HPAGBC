<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmTask.aspx.cs" Inherits="UI.SysAdmin.Web.FrmTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>任務執行</title>
    <base target="_self" />
    <asp:Literal ID="ltrHead" runat="server"></asp:Literal>
    

    <% if(false){ %><link href="http://localhost/tmDevelop/CSSFiles/bootstrap/css/bootstrap.min.css" rel="stylesheet" /><% } %>
    <link rel="stylesheet" href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/CSSFiles/bootstrap/css/bootstrap.min.css")%>" />
    <%--<link rel="stylesheet" href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/CSSFiles/bootstrap/css/bootstrap-theme.min.css")%>" />--%>
        
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/html5shiv/dist/html5shiv.min.js")%>"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/Respond/dest/respond.min.js")%>"></script>
       
    <style type="text/css">
        .table th {
            text-align: center;
        }
        .NotVisible {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <br />
        <p class="lead">
            <span class="text-danger">＊請先按右鍵下載<a href="./Templates/TaskTemplate.xml" target="_blank">範本檔</a>！</span>
            <br />
            <asp:FileUpload ID="fudImport" runat="server" ToolTip="選取「工作列表」檔案..." data-filename-placement="inside" />
            <asp:Button ID="btnImport" runat="server" Text="匯入" onclick="btnImport_Click" CssClass="btn btn-primary" />
            <br />
            <span class="label label-info">註：該檔案為 *.xml 格式</span>
            <%--<span class="glyphicon glyphicon-book"></span>--%>
            <%--<asp:Button ID="Button1" Text="text" runat="server" />--%>
        </p>
       

        <div class="table-responsive">
            <asp:GridView ID="gvTask" runat="server" AutoGenerateColumns="false" 
                OnRowDataBound="gvTask_RowDataBound" MyName="gvTask" 
                CssClass="table table-striped table-hover table-condensed" CellSpacing="-1" GridLines="None"
                Caption="可執行的工作清單">
                <Columns>
                    <asp:TemplateField HeaderText="序號">
                        <ItemTemplate>
                            <asp:Label ID="lblOrder" runat="server" Text='<%# Eval("Order") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="50" />
                        <ItemStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <%-- ↓↓開始資料行↓↓ --%>
                    <asp:TemplateField HeaderText="狀態">
                        <ItemTemplate>
                            <asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="50px" />
                        <ItemStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="名稱">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="80px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="描述">
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="動作">
                        <ItemTemplate>
                            <asp:Button ID="btnSqlButtonText" runat="server" Text='<%# Eval("SqlButtonText") %>' OnClick="btnSqlButtonText_Click" CssClass="btn btn-primary" />
                        </ItemTemplate>
                        <HeaderStyle Width="100px" />
                        <ItemStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <%-- 利用 CSS 來隱藏 GridView 不需要顯示的 Column --%>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Label ID="lblSqlContent" runat="server" Text='<%# Eval("SqlContent") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" CssClass="NotVisible" />
                        <ItemStyle CssClass="NotVisible" />
                        <FooterStyle CssClass="NotVisible" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="訊息">
                        <ItemTemplate>
                            <asp:LinkButton ID="ltnMessage" runat="server" OnClick="ltnMessage_Click">下載錯誤訊息</asp:LinkButton>
                            <asp:LinkButton ID="ltnResult" runat="server" OnClick="ltnResult_Click">下載回傳的資料</asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" />
                        <ItemStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <%-- ↑↑開始資料行↑↑ --%>
                </Columns>
            </asp:GridView>


            <asp:GridView ID="gvResult" runat="server"></asp:GridView>
            <%--<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />--%>
        </div>
    </div>


    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.11.0-fix.min.js")%>" type="text/javascript"></script>
    <%--<script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/CSSFiles/bootstrap/js/bootstrap.min.js")%>" type="text/javascript"></script>--%>
        
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/base.js")%>" type="text/javascript"></script>


    <%-- ↓↓其他 plugin↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/bootstrap-file-input/bootstrap.file-input.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.blockUI/jquery.blockUI.min.js")%>" type="text/javascript"></script>
    <%-- ↑↑其他 plugin↑↑ --%>

    <script type="text/javascript">
        $(function () {
            $("input[type='file']").bootstrapFileInput();


            /* 僅做確認提醒的按鈕，不含其他邏輯 */
            var btnConfirmList = ["##btnImport", "##btnSqlButtonText"];
            //#region $jqbtnConfirmList.click
            var $jqbtnConfirmList = $$(btnConfirmList.join(", "));

            $jqbtnConfirmList.click(function (e) {
                var $this = $(this);
                var btnSrcText = $this.val();

                if (confirm('是否真的要' + btnSrcText + '？')) {
                    $.blockUI({ message: "<h1><b><img src='../Images/ajax-loader.gif' />" + btnSrcText + "中...</b></h1>" });
                    return true;
                }


                return false;
            });
            //#endregion
        });
    </script>
    </form>
</body>
</html>
