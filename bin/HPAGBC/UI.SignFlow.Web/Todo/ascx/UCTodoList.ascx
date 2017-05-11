<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCTodoList.ascx.cs" Inherits="UI.SignFlow.Web.Todo.ascx.UCTodoList" %>
<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>
<asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" CssClass="gridstyle" onrowcommand="grid_RowCommand">
<Columns>
<asp:TemplateField HeaderText="動作">
<ItemStyle HorizontalAlign="Center" Width="30px" />
<ItemTemplate>
<asp:ImageButton ID="ImageButton1" ImageUrl="../images/edit_text.png" CommandName="Action" runat="server" />
</ItemTemplate>

</asp:TemplateField>
<asp:TemplateField HeaderText="表單類型">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("表單名稱")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="承辦人">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("承辦人")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="請購編號" ItemStyle-CssClass="num">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("請購編號")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="說明">
<ItemStyle HorizontalAlign="Left" CssClass="descript" />
<ItemTemplate><%# Eval("說明") %></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="流程開始時間">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("流程開始時間") %></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="送件人">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("送件人") %></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="簽核狀況">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate>
<asp:HiddenField ID="FID" runat="server" Value='<%# Eval("FormID") %>' />
<asp:HiddenField ID="PK" runat="server" Value='<%# Eval("FormPK") %>' />
<asp:HiddenField ID="VID" Value='<%# Eval("LevelID") %>' runat="server" />
<a class="status-view" href="#">開啟</a>
</ItemTemplate>
</asp:TemplateField>
</Columns>
<AlternatingRowStyle CssClass="zebra" />
<EmptyDataRowStyle CssClass="empty" />
<EmptyDataTemplate>尚無任何可處理的待辦事項。</EmptyDataTemplate>
</asp:GridView>
<TM:PagerStyle1 ID="pager" runat="server" PageSize="10" />
