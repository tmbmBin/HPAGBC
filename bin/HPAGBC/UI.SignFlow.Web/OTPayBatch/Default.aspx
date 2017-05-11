<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.SignFlow.Web.OTPayFastInput.Default" %>

<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="content-language" content="utf-8" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="Cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <title>結報資料整批審核</title>
    <link href="../../TM.Style/ui-pager-style3.css" rel="stylesheet" type="text/css" />
    <link href="../Master.css" rel="stylesheet" type="text/css" />
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script src="../../ScriptFiles/jquery-1.9.1-fix.min.js" type="text/javascript"></script>
    <%--<script src="../../jQuery/jquery.jget.js" type="text/javascript"></script>--%>
    <script src="default.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrap">
        <div id="header">
            <asp:Panel ID="filter" CssClass="filter" runat="server">
                <fieldset>
                    <legend>資料過濾篩選</legend>
                    <div>
                        表單類型:
                        <asp:DropDownList ID="cboForm" runat="server">
                        </asp:DropDownList>
                        <br />
                        結報單據編號:
                        <asp:TextBox ID="txtFN" runat="server" Width="100px" />
                        <br />
                        月份:
                        <asp:DropDownList ID="cboYear" runat="server">
                        </asp:DropDownList>
                        年
                        <asp:DropDownList ID="cboMonth" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        月
                        <br />
                        部門:
                        <asp:DropDownList ID="cboDepCode" runat="server">
                        </asp:DropDownList>
                        <br />
                        員工編號:
                        <asp:TextBox ID="txtEmpNum" runat="server" Width="60px" />
                        員工姓名:
                        <asp:TextBox ID="txtEmpName" runat="server" Width="100px" />
                        <span class="actarea">
                            <asp:Button ID="btnFilter" Text="篩選" runat="server" OnClick="btnFilter_Click" />
                            <asp:Button ID="btnClrFilter" Text="清除" runat="server" OnClick="btnClrFilter_Click" />
                        </span>
                    </div>
                </fieldset>
            </asp:Panel>
        </div>
        <div id="content">
            <TM:MessagePanel ID="MessagePanel" runat="server">
            </TM:MessagePanel>
            <span class="notify">* 審核資料同意後將無法再做修正!</span>
            <asp:GridView ID="grid" runat="server" CssClass="gridstyle" AutoGenerateColumns="false"
                OnRowDataBound="grid_RowDataBound">
                <Columns>
                    <asp:TemplateField ShowHeader="False" HeaderText="勾選">
                        <ItemStyle Width="22px" />
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkSelectAll" runat="server" Checked="True" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" Checked="True" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="表單類型">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:HiddenField ID="formID" runat="server" Value='<%# Eval("FormID")%>' />
                            <asp:HiddenField ID="formPK" runat="server" Value='<%# Eval("FormPK")%>' />
                            <asp:HiddenField ID="levelID" runat="server" Value='<%# Eval("LevelID")%>' />
                            <%# Eval("表單名稱")%></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="承辦人">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# Eval("承辦人") %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="請假單據編號">
                        <ItemStyle HorizontalAlign="Center" CssClass="num" />
                        <ItemTemplate>
                            <asp:Literal ID="atmNum" Text='<%# Eval("加班單據編號")%>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="結報單據編號">
                        <ItemStyle HorizontalAlign="Center" CssClass="num" />
                        <ItemTemplate>
                            <asp:Literal ID="atpNum" Text='<%# Eval("結報單據編號")%>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="加班日期">
                        <ItemStyle HorizontalAlign="Center" CssClass="descript" Font-Bold="true" />
                        <ItemTemplate>
                            <%# Eval("預計開始日期")%></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="加班<br/>開始時間">
                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                        <ItemTemplate>
                            <%# Eval("實際開始時間")%></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="加班<br/>結束時間">
                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                        <ItemTemplate>
                            <%# Eval("實際結束時間")%></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="總時數">
                        <ItemStyle HorizontalAlign="Center" CssClass="num" />
                        <ItemTemplate>
                            <%# Eval("總時數")%></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="加班<br/>用餐">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# Eval("用餐數")%></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="選擇換<br/>休時數">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="atoForRestHRsOld" runat="server" Text='<%# Eval("原換休時數")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="審核換<br/>休時數">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="passRestHRs" runat="server" CssClass="hide" Text='<%# Eval("已審核換休時數") %>'
                                data-key='<%# Eval("申請人編號")%>' />
                            <asp:TextBox ID="atoForRestHRs" runat="server" Width="50px" Text='<%# Eval("換休時數")%>'
                                data-type="num" data-key='<%# Eval("申請人編號")%>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="換休<br/>總時數">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="RestHRSum" runat="server" Width="50px" data-key='<%# Eval("申請人編號")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="選擇加班<br/>費時數">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="atoForRepayHRsOld" runat="server" Text='<%# Eval("原加班費時數")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="審核加班<br/>費時數">
                        <HeaderStyle CssClass="hide" />
                        <ItemStyle HorizontalAlign="Center" CssClass="hide" />
                        <ItemTemplate>
                            <asp:Label ID="passRepayHRs" runat="server" CssClass="hide" Text='<%# Eval("已審核加班費時數")%>'
                                data-key='<%# Eval("申請人編號")%>' />
                            <asp:TextBox ID="atoForRepayHRs" runat="server" Width="50px" Text='<%# Eval("加班費時數")%>'
                                data-type="num"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <%--<AlternatingRowStyle CssClass="zebra" />--%>
                <EmptyDataRowStyle CssClass="empty" />
                <EmptyDataTemplate>
                    尚無任何可結報案件。</EmptyDataTemplate>
            </asp:GridView>
            <TM:PagerStyle1 ID="pager" runat="server" PageSize="15" PageIndexParameterName="p" />
        </div>
    </div>
    <p class="actarea">
        <asp:Button ID="btnSave" CssClass="btn" Text="同意勾選單據" runat="server" Height="35px"
            OnClick="btnSave_Click" Visible="False" />
    </p>
    </form>
</body>
</html>
