<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLogList.ascx.cs" Inherits="UI.SignFlow.Web.LogPrint.ascx.UCLogList" %>
<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>
<asp:GridView ID="grid" runat="server" CssClass="gridstyle" AutoGenerateColumns="false">
<Columns>

<asp:TemplateField HeaderText="表單類型">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("表單名稱")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="承辦人">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("承辦人") %></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="請購編號" ItemStyle-CssClass="num">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("請購編號")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="說明">
<ItemStyle HorizontalAlign="Left" CssClass="descript" />
<ItemTemplate><%# Eval("說明") %></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="目前表單位置">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("目前表單位置") %></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="歷程">
<ItemStyle HorizontalAlign="Center" Width="40px" />
<ItemTemplate>
<asp:HiddenField ID="FID" runat="server" Value='<%# Eval("FormID") %>' />
<asp:HiddenField ID="PK" runat="server" Value='<%# Eval("FormPK") %>' />
<a class="status-view" href="#">檢視</a>
</ItemTemplate>
</asp:TemplateField>
</Columns>
<AlternatingRowStyle CssClass="zebra" />
<EmptyDataRowStyle CssClass="empty" />
<EmptyDataTemplate>尚無任何案件。</EmptyDataTemplate>
</asp:GridView>
<TM:PagerStyle1 ID="pager" runat="server" PageSize="10" />