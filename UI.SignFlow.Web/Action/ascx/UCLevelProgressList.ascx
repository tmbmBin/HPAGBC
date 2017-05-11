<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLevelProgressList.ascx.cs" Inherits="UI.SignFlow.Web.Action.ascx.UCLevelProgressList" %>
<asp:Panel ID="progress" runat="server" CssClass="ui-progress-list-container">
<asp:GridView ID="grid" runat="server" AutoGenerateColumns="false">

<Columns>

<asp:TemplateField HeaderText="&nbsp;">
<ItemStyle HorizontalAlign="Center" Width="30px" />
<ItemTemplate><img /></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="關卡審核角色">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate>
<input type="hidden" id='v<%# Eval("關卡編號") %>' />
<%# Eval("簽核人員")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="狀態">
<ItemStyle HorizontalAlign="Center" Width="60px" />
<ItemTemplate><%# Eval("狀態")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="簽核人員">
<ItemStyle HorizontalAlign="Center" Width="80px" />
<ItemTemplate><%# Eval("實際簽核者") %></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="審核結果">
<ItemStyle HorizontalAlign="Center" Width="60px" />
<ItemTemplate><%# Eval("審核結果")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="加註意見">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("簽核意見")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="簽核日期時間">
<ItemStyle HorizontalAlign="Center" Width="140px" />
<ItemTemplate><%# Eval("簽核日期時間")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="派送狀態">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("派送狀態")%></ItemTemplate>
</asp:TemplateField>
</Columns>
<AlternatingRowStyle CssClass="zebra" />
<EmptyDataTemplate>尚無任何關卡資料。</EmptyDataTemplate>
</asp:GridView>
</asp:Panel>